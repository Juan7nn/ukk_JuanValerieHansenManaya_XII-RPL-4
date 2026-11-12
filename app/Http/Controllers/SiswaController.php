<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Loan;
use Illuminate\Support\Facades\Auth;

class SiswaController extends Controller
{
    public function dashboard()
{
    $id = Auth::id();

    $dipinjam = Loan::where('user_id', $id)->where('status', 'dipinjam')->count();
    $dikembalikan = Loan::where('user_id', $id)->where('status', 'dikembalikan')->count();
    $denda = Loan::where('user_id', $id)->sum('fine');

    return view('siswa.dashboard', compact('dipinjam', 'dikembalikan', 'denda'));
}

    public function menu()
    {
        return view('siswa.menu');
    }

    public function pinjamIndex()
    {
        $books = Book::where('stock', '>', 0)->get();
        return view('siswa.pinjam', compact('books'));
    }

    public function pinjamStore(Book $book)
    {
        $sudah = Loan::where('user_id', Auth::id())
            ->where('book_id', $book->id)
            ->where('status', 'dipinjam')
            ->exists();

        if ($sudah) {
            return back()->with('error', 'Kamu masih meminjam buku ini.');
        }

        if ($book->stock < 1) {
            return back()->with('error', 'Stok buku habis.');
        }

        Loan::create([
            'user_id' => Auth::id(),
            'book_id' => $book->id,
            'loan_date' => today(),
            'due_date' => today()->addDays(7),
            'status' => 'dipinjam',
        ]);
        $book->decrement('stock');

        return redirect('/menu')->with('success', 'Buku berhasil dipinjam. Batas pengembalian 7 hari lagi.');
    }

    public function kembaliIndex()
    {
        $loans = Loan::with('book')
            ->where('user_id', Auth::id())
            ->where('status', 'dipinjam')
            ->get();

        return view('siswa.kembali', compact('loans'));
    }

    public function kembaliStore(Loan $loan)
    {
        abort_if($loan->user_id !== Auth::id() || $loan->status !== 'dipinjam', 403);

        $telat = $loan->due_date->lt(today())
            ? (int) $loan->due_date->diffInDays(today())
            : 0;
        $denda = $telat * 1000;

        $loan->update([
            'status' => 'dikembalikan',
            'returned_at' => today(),
            'fine' => $denda,
        ]);
        $loan->book->increment('stock');

        $pesan = 'Buku berhasil dikembalikan.';
        if ($denda > 0) {
            $pesan .= " Terlambat $telat hari, denda Rp " . number_format($denda, 0, ',', '.') . '.';
        }

        return redirect('/menu')->with('success', $pesan);
    }
}