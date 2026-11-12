@extends('layouts.app')
@section('title', 'Masuk')
@section('content')
    <h2>Masuk</h2>
    <p class="muted">atau <a href="/register" style="color:var(--primary-soft)">daftar akun siswa</a></p>
    <form method="POST" action="/login">
        @csrf
        <label>Gmail</label>
        <input type="email" name="email" value="{{ old('email') }}">
        <label>Password</label>
        <input type="password" name="password">
        <button class="btn-block">Masuk</button>
    </form>
@endsection