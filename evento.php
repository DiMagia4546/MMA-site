<?php
session_start();
include "db.php";

if (!isset($_GET['id'])) {
    die("Evento não encontrado.");
}

$event_id = intval($_GET['id']);

$sql_event = "SELECT * FROM events WHERE id = $event_id";
$res_event = $conn->query($sql_event);
if (!$res_event || $res_event->num_rows === 0) {
    die("Evento não existe.");
}
$event = $res_event->fetch_assoc();

$sql_fights = "SELECT * FROM event_fights WHERE event_id = $event_id ORDER BY fight_order ASC";
$fights = $conn->query($sql_fights);
?>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($event['name']) ?> | MMA 360</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Teko:wght@400;500;600;700&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Inter', sans-serif; }
        h1, h2, h3 { font-family: 'Teko', sans-serif; }
    </style>
</head>

<body class="bg-[#f5f5f5] text-[#111]">

<!-- NAVBAR -->
<nav class="fixed top-0 w-full z-40 bg-white/80 backdrop-blur border-b border-[#e5e5e5]">
    <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
        <a href="index.php" class="flex items-center gap-3">
            <img src="pf-removebg-preview.png" class="h-10">
            <span class="text-xl font-semibold tracking-widest text-[#ef4444]">MMA 360</span>
        </a>

        <ul class="hidden md:flex gap-8 text-sm uppercase tracking-wide text-[#444]">
            <li><a href="index.php" class="hover:text-[#ef4444] transition">Início</a></li>
            <li><a href="noticias.php" class="hover:text-[#ef4444] transition">Notícias</a></li>
            <li><a href="about.php" class="hover:text-[#ef4444] transition">Quem Somos</a></li>
            <li><a href="fighters.php" class="hover:text-[#ef4444] transition">Lutadores</a></li>
            <li><a href="eventos.php" class="text-[#ef4444]">Eventos</a></li>
            <li><a href="contacto.php" class="hover:text-[#ef4444] transition">Contacto</a></li>
            <li><a href="login.php" class="hover:text-[#ef4444] transition">Login</a></li>
        </ul>
    </div>
</nav>

<div class="pt-24"></div>

<!-- BANNER -->
<?php
$banner = !empty($event['banner']) ? $event['banner'] : 'uploads/default_banner.webp';
?>
<div class="w-full h-64 md:h-80 bg-cover bg-center border-b border-[#e5e5e5]"
     style="background-image: linear-gradient(to top, rgba(0,0,0,0.7), rgba(0,0,0,0.2)), url('<?= $banner ?>');">
    <div class="max-w-5xl mx-auto h-full flex flex-col justify-end px-6 pb-6">
        <h1 class="text-6xl font-bold text-white tracking-wide"><?= htmlspecialchars($event['name']) ?></h1>
        <p class="text-neutral-200 text-lg mt-2">
            📅 <?= date("d/m/Y", strtotime($event['date'])) ?> &nbsp; • &nbsp; 📍 <?= htmlspecialchars($event['location']) ?>
        </p>
    </div>
</div>

<!-- FIGHT CARD UFC STYLE -->
<section class="max-w-5xl mx-auto px-6 py-12">

    <h2 class="text-5xl font-bold text-[#111] tracking-wide mb-10">Fight Card</h2>

    <div class="space-y-10">

        <?php if ($fights && $fights->num_rows > 0): ?>
            <?php while ($fight = $fights->fetch_assoc()): ?>

                <div class="bg-white border border-[#e5e5e5] rounded-xl p-8 shadow-lg">

                    <div class="flex flex-col md:flex-row items-center justify-between gap-10">

                        <!-- Lutador 1 -->
                        <div class="flex flex-col items-center">
                            <img src="<?= htmlspecialchars($fight['fighter1_image']) ?>" 
                                 class="w-40 h-40 object-cover rounded-full border-2 border-[#ef4444]">
                            <p class="text-3xl font-bold mt-4"><?= htmlspecialchars($fight['fighter1_name']) ?></p>
                        </div>

                        <!-- VS -->
                        <span class="text-5xl font-bold text-[#111]">VS</span>

                        <!-- Lutador 2 -->
                        <div class="flex flex-col items-center">
                            <img src="<?= htmlspecialchars($fight['fighter2_image']) ?>" 
                                 class="w-40 h-40 object-cover rounded-full border-2 border-[#ef4444]">
                            <p class="text-3xl font-bold mt-4"><?= htmlspecialchars($fight['fighter2_name']) ?></p>
                        </div>

                    </div>

                </div>

            <?php endwhile; ?>
        <?php else: ?>
            <p class="text-[#777]">Ainda não há lutas registadas para este evento.</p>
        <?php endif; ?>

    </div>

    <div class="mt-10">
        <a href="eventos.php" class="text-[#ef4444] hover:text-red-600 text-sm uppercase tracking-[0.25em]">
            ← Voltar aos eventos
        </a>
    </div>
</section>

<!-- FOOTER -->
<footer class="bg-white border-t border-[#e5e5e5] py-10 text-center">
    <p class="text-[#444] text-lg">📧 mma360@gmail.com</p>
    <p class="mt-4 text-[#777] text-sm">© 2025 MMA 360 — Todos os direitos reservados</p>
</footer>

</body>
</html>
