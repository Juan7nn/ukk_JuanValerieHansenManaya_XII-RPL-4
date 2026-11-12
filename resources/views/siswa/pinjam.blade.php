@extends('layouts.app')
@section('title', 'Peminjaman')
@section('content')
    <h1>Peminjaman Buku</h1>
    <div class="card">
        @if($books->isEmpty())
            <p class="muted">Tidak ada buku yang tersedia.</p>
        @else
            <table>
                <tr><th>Judul</th><th>Penulis</th><th>Penerbit</th><th>Tahun</th><th>Stok</th><th></th></tr>
                @foreach($books as $b)
                    <tr>
                        <td>{{ $b->title }}</td>
                        <td>{{ $b->author }}</td>
                        <td>{{ $b->publisher }}</td>
                        <td>{{ $b->year }}</td>
                        <td>{{ $b->stock }}</td>
                        <td>
                            <form method="POST" action="/pinjam/{{ $b->id }}">
                                @csrf
                                <button>Pinjam</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </table>
        @endif
    </div>
@endsection