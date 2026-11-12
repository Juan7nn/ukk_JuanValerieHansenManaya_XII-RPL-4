@extends('layouts.app')
@section('title', 'Pengembalian')
@section('content')
    <h1>Pengembalian Buku</h1>
    <div class="card">
        @if($loans->isEmpty())
            <p class="muted">Kamu tidak sedang meminjam buku.</p>
        @else
            <table>
                <tr><th>Judul</th><th>Tanggal Pinjam</th><th>Batas Kembali</th><th></th></tr>
                @foreach($loans as $l)
                    <tr>
                        <td>{{ $l->book->title }}</td>
                        <td>{{ $l->loan_date->format('d-m-Y') }}</td>
                        <td>
                            {{ $l->due_date->format('d-m-Y') }}
                            @if($l->due_date->lt(today()))<span class="badge">Terlambat</span>@endif
                        </td>
                        <td>
                            <form method="POST" action="/kembali/{{ $l->id }}">
                                @csrf
                                <button>Kembalikan</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </table>
        @endif
    </div>
@endsection