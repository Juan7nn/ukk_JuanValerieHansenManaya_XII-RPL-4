@extends('layouts.app')
@section('title', 'Menu')
@section('content')
    <h1>Menu</h1>
    <div class="grid">
        <a href="/pinjam" class="card menu-card">
            <strong>Peminjaman Buku</strong>
            <p class="muted">Pilih buku yang ingin kamu pinjam.</p>
        </a>
        <a href="/kembali" class="card menu-card">
            <strong>Pengembalian Buku</strong>
            <p class="muted">Kembalikan buku yang sedang kamu pinjam.</p>
        </a>
    </div>
@endsection