-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Mar-2026 às 02:25
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mma_site`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `auth_codes`
--

CREATE TABLE `auth_codes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `code_hash` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `attempts` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `auth_codes`
--

INSERT INTO `auth_codes` (`id`, `user_id`, `purpose`, `code_hash`, `expires_at`, `used_at`, `created_at`, `attempts`) VALUES
(27, 22, 'login', '$2y$10$XFRinKkmToWFi3ZDsSp2POFZP8JndVMY5soqEdWy91.9Hb3woLvL6', '2026-03-07 04:36:06', '2026-03-07 03:26:20', '2026-03-07 03:26:06', 0),
(28, 22, 'login', '$2y$10$QltRJkYLoVn7Wu0lTrHPM.K1tdmf5hSehN0R76.lNV8/ApBOjVpqa', '2026-03-07 17:40:49', '2026-03-07 16:31:02', '2026-03-07 16:30:49', 0),
(42, 22, 'login', '$2y$10$J9NrPeYTMf9qQQwdDtre/Oo7KrHIzvmrYfQCmUIRjKfGW7T32tDVm', '2026-03-09 15:17:14', '2026-03-09 14:07:46', '2026-03-09 14:07:14', 0),
(43, 22, 'change_password', '$2y$10$glfdIF2U4J1DyMazV799PeahIxCvNNfUOPKhxk6H8NWcBTUpu3evW', '2026-03-09 15:18:50', '2026-03-09 14:09:11', '2026-03-09 14:08:50', 0),
(44, 22, 'login', '$2y$10$ot3DvBEPoXqymXVyz2abc.k58SLECbnDENVn6yKsv.ILhfeqeFJsK', '2026-03-09 15:20:06', '2026-03-09 14:10:17', '2026-03-09 14:10:06', 0),
(46, 23, 'login', '$2y$10$jHfMpDl2ukwV8KuoO26MjeK3jTcQaFEDDaQT18DEbqQJ6IefFCTzS', '2026-03-09 16:44:46', NULL, '2026-03-09 15:34:46', 0),
(47, 24, 'change_password', '$2y$10$/cq5hfXqR28lwnHYsVgq9O9yZUqVUQxZHFgssvqoVh/XBhysS0Gta', '2026-03-09 16:47:46', NULL, '2026-03-09 15:37:46', 0),
(48, 22, 'login', '$2y$10$o0WI5Wl0lnpSX4QkSB/5geMaYyIy7Ek9o0/RU4G43fMw.0ttkQkP2', '2026-03-09 17:12:04', '2026-03-09 16:02:34', '2026-03-09 16:02:04', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `news_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `message`, `created_at`) VALUES
(1, 'Martim', 'martimabreuslb@gmail.com', 'PAP', '2026-03-07 16:31:43'),
(2, 'Martim', 'martimabreuslb@gmail.com', 'teste', '2026-03-09 16:02:56');

-- --------------------------------------------------------

--
-- Estrutura da tabela `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `location` varchar(100) NOT NULL,
  `main_event` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lutador1` varchar(255) NOT NULL,
  `lutador2` varchar(255) NOT NULL,
  `banner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `events`
--

INSERT INTO `events` (`id`, `name`, `date`, `location`, `main_event`, `created_at`, `lutador1`, `lutador2`, `banner`) VALUES
(2, 'UFC 326', '2026-03-08', 'Dom, Mar 8 / 2:00 AM GMT\r\nT-Mobile Arena, Las Vegas United States', 'Holloway vs Oliveira 2', '2026-01-19 23:39:52', 'HOLLOWAY_MAX_BMF_07-19.avif', 'OLIVEIRA_CHARLES_10-11.avif', 'uploads/ufc326_banner.webp'),
(3, 'CW 205: Glasgow', '2026-04-25', 'Braehead Arena, Glasgow', 'Sean Clancy Jr.  VS.  Justin Burlinson', '2026-03-07 16:57:37', '', '', 'uploads/event_2efa93ae6684eeda.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `event_fights`
--

CREATE TABLE `event_fights` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `fighter1_name` varchar(100) NOT NULL,
  `fighter2_name` varchar(100) NOT NULL,
  `fighter1_image` varchar(255) NOT NULL,
  `fighter2_image` varchar(255) NOT NULL,
  `fight_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `event_fights`
--

INSERT INTO `event_fights` (`id`, `event_id`, `fighter1_name`, `fighter2_name`, `fighter1_image`, `fighter2_image`, `fight_order`) VALUES
(6, 2, 'Max Holloway', 'Charles Oliveira', 'uploads/HOLLOWAY_MAX_BMF_07-19.avif', 'uploads/OLIVEIRA_CHARLES_10-11.avif', 1),
(8, 2, 'Drew Dober', 'Michael Johnson', 'uploads/DOBER_DREW_10-18.avif', 'uploads/JOHNSON_MICHAEL_01-24.avif', 4),
(9, 2, 'Caio Borralho', 'Reinier De Ridder', 'uploads/BORRALHO_CAIO_09-06.avif', 'uploads/DE-RIDDER_REINIER_10-18.avif', 2),
(10, 2, 'Gregory Rodrigues', 'Brunno Ferreira', 'uploads/RODRIGUES_GREGORY_11-15.avif', 'uploads/FERREIRA_BRUNNO_12-06.avif', 5),
(13, 2, 'Rob Font', 'Raul Rosas JR.', 'uploads/FONT_ROB_09-13.avif', 'uploads/ROSAS_JR_RAUL_03-29.avif', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `fighter_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fighters`
--

CREATE TABLE `fighters` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `weight_class` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `wins` int(11) DEFAULT 0,
  `losses` int(11) DEFAULT 0,
  `kos` int(11) DEFAULT 0,
  `submissions` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `nickname` varchar(100) DEFAULT NULL,
  `rank_division` varchar(50) DEFAULT NULL,
  `rank_pfp` varchar(50) DEFAULT NULL,
  `upcoming_event` varchar(100) DEFAULT NULL,
  `upcoming_opponent` varchar(100) DEFAULT NULL,
  `upcoming_date` date DEFAULT NULL,
  `is_champion` tinyint(1) DEFAULT 0,
  `age` int(11) DEFAULT 0,
  `height` varchar(10) DEFAULT '',
  `reach` varchar(10) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `fighters`
--

INSERT INTO `fighters` (`id`, `name`, `weight_class`, `nationality`, `wins`, `losses`, `kos`, `submissions`, `created_at`, `image`, `profile_image`, `nickname`, `rank_division`, `rank_pfp`, `upcoming_event`, `upcoming_opponent`, `upcoming_date`, `is_champion`, `age`, `height`, `reach`) VALUES
(8, 'Max Holloway', 'Lightweight', 'American', 27, 8, 0, 0, '2026-03-02 16:42:02', 'uploads/HOLLOWAY_MAX_BMF_07-19.avif', 'uploads/fighter_profile_6713bceddb483a1b.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '180', '175'),
(10, 'Caio Borralho', 'Middleweight', 'Brazilian', 17, 2, 0, 0, '2026-03-02 16:42:02', 'uploads/BORRALHO_CAIO_09-06.avif', 'uploads/fighter_profile_3867a9bb526637be.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '187', '191'),
(11, 'Gregory Rodrigues', 'Middleweight', 'Brazilian', 18, 6, 0, 0, '2026-03-02 16:42:02', 'uploads/RODRIGUES_GREGORY_11-15.avif', 'uploads/fighter_profile_daf23f018e6352fd.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '191', '191'),
(12, 'Rob Font', 'Bantamweight', 'Puerto Rican', 22, 9, 0, 0, '2026-03-02 16:42:02', 'uploads/FONT_ROB_09-13.avif', 'uploads/fighter_profile_cd296f76c8a67da3.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '173', '182'),
(13, 'Charles Oliveira', 'Lightweight', 'Brazilian', 36, 11, 0, 0, '2026-03-02 16:42:02', 'uploads/OLIVEIRA_CHARLES_10-11.avif', 'uploads/fighter_profile_12eb735b458c8eca.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '178', '188'),
(15, 'Reinier De Ridder', 'Middleweight', 'Dutch', 21, 3, 0, 0, '2026-03-02 16:42:02', 'uploads/DE-RIDDER_REINIER_10-18.avif', 'uploads/fighter_profile_8ab14405a36346b7.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '193', '198'),
(16, 'Brunno Ferreira', 'Middleweight', 'Brazilian', 15, 3, 0, 0, '2026-03-02 16:42:02', 'uploads/fighter_3e1c8c7f92e94a48.avif', 'uploads/fighter_profile_056b6f90b977713e.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 33, '179', '183'),
(17, 'Raul Rosas JR.', 'Bantamweight', 'Mexican', 11, 1, 0, 0, '2026-03-02 16:42:02', 'uploads/ROSAS_JR_RAUL_03-29.avif', 'uploads/fighter_profile_b5bfa35346cd1419.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '175', '170'),
(18, 'Drew Dober', 'Lightweight', 'American', 27, 15, 10, 9, '2026-03-03 15:58:56', 'uploads/DOBER_DREW_10-18.avif', 'uploads/fighter_profile_0616e0ff7b0e8bf3.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '173', '178'),
(19, 'Michael Johnson', 'Lightweight', 'American', 23, 19, 12, 2, '2026-03-03 15:58:56', 'uploads/JOHNSON_MICHAEL_01-24.avif', 'uploads/fighter_profile_23f608441b100511.avif', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '178', '187');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fighter_history`
--

CREATE TABLE `fighter_history` (
  `id` int(11) NOT NULL,
  `fighter_id` int(11) NOT NULL,
  `opponent_name` varchar(100) NOT NULL,
  `opponent_image` varchar(255) DEFAULT NULL,
  `event_name` varchar(100) NOT NULL,
  `fight_date` date NOT NULL,
  `result` enum('Win','Loss','Draw') NOT NULL,
  `method` varchar(100) NOT NULL,
  `round_number` int(11) NOT NULL,
  `time` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image_path`, `author_id`, `created_at`) VALUES
(2, 'Alex Pereira e o sonho do terceiro cinturao', 'Alex Pereira voltou ao centro da conversa sobre legado no MMA. O cenario de disputar um terceiro cinturao ganha forca entre analistas, sobretudo pela combinacao de impacto comercial e merito competitivo. O desafio passa por alinhar calendario, categoria e oportunidade de titulo no momento certo.', 'uploads/Alex-Pereira-2.webp', NULL, '2026-03-02 17:47:23'),
(3, 'Strickland vs Chimaev pode tornar-se o proximo grande duelo', 'A hipotese de um confronto entre Sean Strickland e Khamzat Chimaev continua a ganhar tracao nos bastidores. A luta junta estilos opostos: volume e pressao em pe contra forca fisica, controlo e grappling de alto nivel. Dependendo da decisao do UFC, este combate pode definir o proximo candidato ao titulo.', 'uploads/news-chimaev-vs-strickland.webp', NULL, '2026-03-02 17:47:23'),
(4, 'UFC assina acordo com a Paramount para reforcar distribuicao global', 'O UFC confirmou um novo acordo com a Paramount, numa movimentacao estrategica para ampliar alcance e distribuicao de conteudo. A parceria pode fortalecer a presenca da organizacao em diferentes mercados, aumentar exposicao internacional e criar novas oportunidades comerciais para eventos premium. Para os fas, a expectativa e de melhor acesso as transmissoes e integracao mais forte entre plataformas de media e entretenimento.', 'uploads/news-ufc-paramount.jpg', NULL, '2026-03-02 17:58:06');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pending_auth_codes`
--

CREATE TABLE `pending_auth_codes` (
  `id` int(11) NOT NULL,
  `pending_id` int(11) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `code_hash` varchar(255) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `expires_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pending_registrations`
--

CREATE TABLE `pending_registrations` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `email_verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `profile_pic`, `created_at`, `email_verified`) VALUES
(2, 'Admin', 'admin@mma360.com', '$2y$10$VGmJgiYkegRi8mOkvh7x6eIn9palpTDegZjbj2nGydv/NYOSUnIqK', 'admin', NULL, '2026-03-02 15:02:10', 0),
(22, 'Martim', 'martimabreuslb@gmail.com', '$2y$10$gsrXj6KH8NxUj5vgA2GWZOTI9Mf.pzWIqMaAXVGFQr7jUVsL4PBB2', 'user', NULL, '2026-03-07 03:25:22', 1),
(23, 'QA Automation', 'qa.automation@example.com', '$2y$10$fjkHcSJgIVXlSjb1XEpV/.HTGeI3Rs3vlju8jQZMaaoaKAaK2cL4e', 'user', NULL, '2026-03-09 15:30:44', 1),
(24, 'QA Admin', 'qa.admin@example.com', '$2y$10$1ObtBbVka2aEHj0vbVOweOkWrnwkVFz84HpKt086s/CPAsL3GRhcW', 'admin', NULL, '2026-03-09 15:35:07', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `user_activity`
--

INSERT INTO `user_activity` (`id`, `user_id`, `action`, `created_at`) VALUES
(1, 1, 'Adicionou um lutador aos favoritos', '2026-03-02 15:56:10'),
(2, 1, 'Removeu um lutador dos favoritos', '2026-03-02 15:56:17'),
(3, 1, 'Adicionou um lutador aos favoritos', '2026-03-02 17:59:38'),
(4, 1, 'Adicionou um evento aos favoritos', '2026-03-02 17:59:48'),
(5, 1, 'Removeu um lutador dos favoritos', '2026-03-02 18:00:07'),
(6, 1, 'Adicionou um lutador aos favoritos', '2026-03-02 18:05:53'),
(7, 1, 'Removeu um lutador dos favoritos', '2026-03-02 18:06:02'),
(8, 1, 'Removeu um evento dos favoritos', '2026-03-02 18:06:09'),
(9, 1, 'Adicionou um evento aos favoritos', '2026-03-02 18:06:10'),
(10, 1, 'Removeu um evento dos favoritos', '2026-03-02 18:06:10'),
(11, 24, 'Adicionou um lutador aos favoritos', '2026-03-09 15:37:31'),
(12, 24, 'Removeu um lutador dos favoritos', '2026-03-09 15:37:31');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `auth_codes`
--
ALTER TABLE `auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_purpose` (`user_id`,`purpose`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Índices para tabela `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `event_fights`
--
ALTER TABLE `event_fights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Índices para tabela `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fighter_id` (`fighter_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Índices para tabela `fighters`
--
ALTER TABLE `fighters`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `fighter_history`
--
ALTER TABLE `fighter_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fighter_id` (`fighter_id`);

--
-- Índices para tabela `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Índices para tabela `pending_auth_codes`
--
ALTER TABLE `pending_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pending_purpose` (`pending_id`,`purpose`),
  ADD KEY `idx_pending_expires` (`expires_at`);

--
-- Índices para tabela `pending_registrations`
--
ALTER TABLE `pending_registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_pending_email` (`email`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auth_codes`
--
ALTER TABLE `auth_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `event_fights`
--
ALTER TABLE `event_fights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `fighters`
--
ALTER TABLE `fighters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `fighter_history`
--
ALTER TABLE `fighter_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de tabela `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pending_auth_codes`
--
ALTER TABLE `pending_auth_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pending_registrations`
--
ALTER TABLE `pending_registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `auth_codes`
--
ALTER TABLE `auth_codes`
  ADD CONSTRAINT `fk_auth_codes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Limitadores para a tabela `event_fights`
--
ALTER TABLE `event_fights`
  ADD CONSTRAINT `event_fights_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`fighter_id`) REFERENCES `fighters` (`id`),
  ADD CONSTRAINT `favorites_ibfk_3` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Limitadores para a tabela `fighter_history`
--
ALTER TABLE `fighter_history`
  ADD CONSTRAINT `fighter_history_ibfk_1` FOREIGN KEY (`fighter_id`) REFERENCES `fighters` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pending_auth_codes`
--
ALTER TABLE `pending_auth_codes`
  ADD CONSTRAINT `fk_pending_auth_codes_pending` FOREIGN KEY (`pending_id`) REFERENCES `pending_registrations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
