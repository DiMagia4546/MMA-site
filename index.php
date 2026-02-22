<?php
session_start();
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MMA 360</title>

    <!-- Tailwind -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Fontes -->
    <link href="https://fonts.googleapis.com/css2?family=Teko:wght@400;500;600;700&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3 { font-family: 'Teko', sans-serif; }
    </style>
</head>

<!-- TEMA CLARO -->
<body class="bg-[#f5f5f5] text-[#111]">

<!-- WELCOME BOX -->
<?php if (isset($_SESSION['welcome'])): ?>
    <div id="welcomeBox"
         class="fixed top-6 left-1/2 -translate-x-1/2 bg-[#ef4444] text-white px-6 py-3 rounded-lg shadow-xl flex items-center gap-4 z-50">
        <span class="text-xl"><?= htmlspecialchars($_SESSION['welcome']) ?></span>
        <button onclick="closeWelcome()" class="text-2xl hover:text-black transition">✕</button>
    </div>
    <?php unset($_SESSION['welcome']); ?>
<?php endif; ?>

<!-- NAVBAR NOVA (TEMA CLARO) -->
<nav class="fixed top-0 w-full z-40 bg-white/80 backdrop-blur border-b border-[#e5e5e5]">
    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">

        <a href="index.php" class="flex items-center gap-3">
            <img src="pf-removebg-preview.png" class="h-10">
            <span class="text-xl font-semibold tracking-widest text-[#ef4444]">MMA 360</span>
        </a>

        <ul class="hidden md:flex gap-8 text-sm uppercase tracking-wide text-[#444]">
            <li><a href="index.php" class="text-[#ef4444]">Início</a></li>
            <li><a href="noticias.php" class="hover:text-[#ef4444] transition">Notícias</a></li>
            <li><a href="about.php" class="hover:text-[#ef4444] transition">Quem Somos</a></li>
            <li><a href="fighters.php" class="hover:text-[#ef4444] transition">Lutadores</a></li>
            <li><a href="eventos.php" class="hover:text-[#ef4444] transition">Eventos</a></li>
            <li><a href="contacto.php" class="hover:text-[#ef4444] transition">Contacto</a></li>
            <li><a href="login.php" class="hover:text-[#ef4444] transition">Login</a></li>
        </ul>

    </div>
</nav>

<!-- HERO ESTILO PROFISSIONAL -->
<section class="relative min-h-screen flex items-center justify-center pt-24">

    <!-- Imagem de fundo -->
    <div class="absolute inset-0">
        <img src="https://i2-prod.mirror.co.uk/incoming/article1516071.ece/ALTERNATES/s1227b/_MG_0139.jpg"
             class="w-full h-full object-cover opacity-60">
        <div class="absolute inset-0 bg-black/50"></div>
    </div>

    <!-- Conteúdo -->
    <div class="relative text-center max-w-3xl px-6">

        <!-- Badge -->
        <span class="inline-block bg-[#ef4444] text-white px-4 py-1 rounded-full text-lg tracking-wide mb-6">
            A sua fonte de MMA
        </span>

        <h1 class="text-6xl md:text-7xl font-bold tracking-widest mb-6 text-white">
            Tudo sobre Artes Marciais Mistas
        </h1>

        <p class="text-xl md:text-2xl text-neutral-200 mb-10">
            Cobertura completa de eventos, perfis detalhados de lutadores, notícias em tempo real e análises aprofundadas.
        </p>

        <div class="flex justify-center gap-6">
            <a href="eventos.php"
               class="bg-[#ef4444] text-white px-10 py-4 text-xl rounded-lg hover:bg-red-600 transition">
                Ver Eventos
            </a>

            <a href="fighters.php"
               class="bg-white text-[#111] px-10 py-4 text-xl rounded-lg border border-[#e5e5e5] hover:bg-[#f0f0f0] transition">
                Explorar Lutadores
            </a>
        </div>
    </div>
</section>

<!-- FOOTER NOVO (TEMA CLARO) -->
<footer class="bg-white border-t border-[#e5e5e5] py-10 text-center">
    <p class="text-[#444] text-lg">📧 mma360@gmail.com</p>
    <p class="mt-4 text-[#777] text-sm">
        © 2025 MMA 360 — Todos os direitos reservados
    </p>
</footer>

<script>
    function closeWelcome() {
        const box = document.getElementById('welcomeBox');
        box.style.opacity = "0";
        setTimeout(() => box.remove(), 400);
    }
</script>

</body>
</html>
