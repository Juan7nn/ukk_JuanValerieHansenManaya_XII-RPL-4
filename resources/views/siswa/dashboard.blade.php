@extends('layouts.app')
@section('title', 'Dashboard')
@section('content')
    <h1>Dashboard</h1>

    <div class="card row">
        <div class="row" style="justify-content:flex-start">
            <div class="avatar">{{ strtoupper(substr(auth()->user()->name, 0, 1)) }}</div>
            <div>
                <strong>Halo, {{ auth()->user()->name }}!</strong>
                <div class="muted">Siswa</div>
            </div>
        </div>
        <a class="btn" href="/menu">Buka Menu</a>
    </div>

    <div class="grid">
        <div class="card stat">
            <div class="muted">Sedang Dipinjam</div>
            <div class="value">{{ $dipinjam }}</div>
        </div>
        <div class="card stat">
            <div class="muted">Sudah Dikembalikan</div>
            <div class="value">{{ $dikembalikan }}</div>
        </div>
        <div class="card stat">
            <div class="muted">Total Denda</div>
            <div class="value">Rp {{ number_format($denda, 0, ',', '.') }}</div>
        </div>
    </div>
@endsection