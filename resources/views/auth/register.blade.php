@extends('layouts.app')
@section('title', 'Daftar')
@section('content')
    <h2>Daftar Siswa</h2>
    <p class="muted">atau <a href="/login" style="color:var(--primary-soft)">masuk ke akun</a></p>
    <form method="POST" action="/register">
        @csrf
        <label>Username</label>
        <input type="text" name="name" value="{{ old('name') }}">
        <label>Gmail</label>
        <input type="email" name="email" value="{{ old('email') }}">
        <label>Password</label>
        <input type="password" name="password">
        <button class="btn-block">Daftar</button>
    </form>
@endsection