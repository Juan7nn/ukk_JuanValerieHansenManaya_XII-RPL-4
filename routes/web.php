<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\SiswaController;
use Illuminate\Support\Facades\Route;

Route::get('/', fn () => redirect('/dashboard'));

Route::middleware('guest')->group(function () {
    Route::get('/register', [AuthController::class, 'showRegister']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
    Route::post('/login', [AuthController::class, 'login']);
});

Route::post('/logout', [AuthController::class, 'logout']);

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [SiswaController::class, 'dashboard']);
    Route::get('/menu', [SiswaController::class, 'menu']);

    Route::get('/pinjam', [SiswaController::class, 'pinjamIndex']);
    Route::post('/pinjam/{book}', [SiswaController::class, 'pinjamStore']);

    Route::get('/kembali', [SiswaController::class, 'kembaliIndex']);
    Route::post('/kembali/{loan}', [SiswaController::class, 'kembaliStore']);
});