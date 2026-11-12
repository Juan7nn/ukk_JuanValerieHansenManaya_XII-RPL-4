<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title') - Perpustakaan</title>
    <style>
        :root {
            --bg: #09090b; --card: #18181b; --border: #27272a;
            --text: #fafafa; --muted: #a1a1aa;
            --primary: #7c3aed; --primary-hover: #6d28d9; --primary-soft: #a78bfa;
        }
        * { box-sizing: border-box; }
        body { margin: 0; font-family: Inter, system-ui, Arial, sans-serif; background: var(--bg); color: var(--text); }
        a { color: inherit; text-decoration: none; }
        h1 { margin: 0 0 24px; font-size: 28px; }
        h2 { margin: 0 0 16px; font-size: 22px; }
        .muted { color: var(--muted); font-size: 14px; }

        .topbar { display: flex; justify-content: space-between; align-items: center; height: 64px; padding: 0 24px; background: var(--card); border-bottom: 1px solid var(--border); }
        .brand { font-weight: 700; font-size: 20px; }
        .user { display: flex; align-items: center; gap: 12px; }
        .avatar { width: 36px; height: 36px; border-radius: 50%; background: var(--primary); display: flex; align-items: center; justify-content: center; font-weight: 600; flex-shrink: 0; }

        .layout { display: flex; min-height: calc(100vh - 64px); }
        .sidebar { width: 240px; padding: 16px; border-right: 1px solid var(--border); flex-shrink: 0; }
        .sidebar a { display: block; padding: 10px 12px; margin-bottom: 4px; border-radius: 8px; color: var(--muted); }
        .sidebar a:hover { background: var(--card); }
        .sidebar a.active { background: var(--card); color: var(--primary-soft); }
        .content { flex: 1; padding: 32px; max-width: 1000px; }

        .card { background: var(--card); border: 1px solid var(--border); border-radius: 12px; padding: 20px; margin-bottom: 16px; }
        .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 16px; }
        .grid .card { margin-bottom: 0; }
        .row { display: flex; justify-content: space-between; align-items: center; gap: 12px; }
        .stat .value { font-size: 32px; font-weight: 700; margin-top: 6px; }
        .menu-card { display: block; transition: border-color .15s; }
        .menu-card:hover { border-color: var(--primary); }
        .menu-card strong { font-size: 18px; }

        label { font-size: 14px; font-weight: 500; }
        input { width: 100%; padding: 10px 12px; margin: 6px 0 16px; background: var(--bg); color: var(--text); border: 1px solid var(--border); border-radius: 8px; font-size: 15px; }
        input:focus { outline: 2px solid var(--primary); border-color: transparent; }

        button, .btn { display: inline-block; background: var(--primary); color: #fff; border: 0; padding: 9px 16px; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; }
        button:hover, .btn:hover { background: var(--primary-hover); }
        .btn-block { width: 100%; padding: 11px; }
        .btn-ghost { background: transparent; border: 1px solid var(--border); color: var(--text); }
        .btn-ghost:hover { background: var(--border); }

        .alert { padding: 10px 14px; border-radius: 8px; margin-bottom: 16px; font-size: 14px; }
        .alert-error { background: rgba(239,68,68,.15); color: #fca5a5; border: 1px solid rgba(239,68,68,.35); }
        .alert-success { background: rgba(34,197,94,.15); color: #86efac; border: 1px solid rgba(34,197,94,.35); }

        table { width: 100%; border-collapse: collapse; }
        th { color: var(--muted); font-size: 13px; font-weight: 500; }
        th, td { padding: 12px 8px; border-bottom: 1px solid var(--border); text-align: left; }
        tr:last-child td { border-bottom: 0; }
        .badge { padding: 2px 8px; border-radius: 999px; font-size: 12px; background: rgba(239,68,68,.15); color: #fca5a5; }

        .center { min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 16px; }
        .auth-card { width: 100%; max-width: 420px; padding: 32px; }
        .auth-card .brand, .auth-card h2, .auth-card .muted { text-align: center; }

        @media (max-width: 768px) {
            .layout { flex-direction: column; }
            .sidebar { width: 100%; display: flex; gap: 4px; overflow-x: auto; border-right: 0; border-bottom: 1px solid var(--border); }
            .sidebar a { white-space: nowrap; margin-bottom: 0; }
            .content { padding: 20px; }
            .user .name { display: none; }
        }
    </style>
</head>
<body>
@auth
    <div class="topbar">
        <div class="brand">Perpustakaan</div>
        <div class="user">
            <span class="name">{{ auth()->user()->name }}</span>
            <div class="avatar">{{ strtoupper(substr(auth()->user()->name, 0, 1)) }}</div>
            <form method="POST" action="/logout">
                @csrf
                <button class="btn-ghost">Keluar</button>
            </form>
        </div>
    </div>

    <div class="layout">
        <nav class="sidebar">
            <a href="/dashboard" class="{{ request()->is('dashboard') ? 'active' : '' }}">Dashboard</a>
            <a href="/menu" class="{{ request()->is('menu') ? 'active' : '' }}">Menu</a>
            <a href="/pinjam" class="{{ request()->is('pinjam') ? 'active' : '' }}">Peminjaman Buku</a>
            <a href="/kembali" class="{{ request()->is('kembali') ? 'active' : '' }}">Pengembalian Buku</a>
        </nav>

        <main class="content">
            @if(session('success'))<div class="alert alert-success">{{ session('success') }}</div>@endif
            @if(session('error'))<div class="alert alert-error">{{ session('error') }}</div>@endif
            @yield('content')
        </main>
    </div>
@else
    <div class="center">
        <div class="card auth-card">
            <div class="brand">Perpustakaan</div>
            @if(session('success'))<div class="alert alert-success">{{ session('success') }}</div>@endif
            @if(session('error'))<div class="alert alert-error">{{ session('error') }}</div>@endif
            @if($errors->any())
                <div class="alert alert-error">
                    @foreach($errors->all() as $e)<div>{{ $e }}</div>@endforeach
                </div>
            @endif
            @yield('content')
        </div>
    </div>
@endauth
</body>
</html>