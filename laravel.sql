-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 18 2020 г., 06:34
-- Версия сервера: 8.0.15
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel`
--

-- --------------------------------------------------------

--
-- Структура таблицы `discs`
--

CREATE TABLE `discs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `discs`
--

INSERT INTO `discs` (`id`, `name`, `text`, `created_at`, `updated_at`, `user_id`) VALUES
(3, 'БИ-2', 'Горизонт событий', '2020-08-11 02:59:28', '2020-08-11 02:59:28', 1),
(4, 'Кукрыниксы', 'Артист', '2020-08-11 03:04:07', '2020-08-11 03:04:07', 2),
(5, 'Gorillaz', 'Demon Days', '2020-08-12 03:25:05', '2020-08-12 03:25:05', 1),
(19, 'Кино', 'Группа крови', '2020-08-17 02:00:19', '2020-08-17 02:00:19', 3),
(26, 'Michael Jackson', 'Thriller', '2020-08-17 05:24:48', '2020-08-17 05:24:48', 3),
(27, 'Adele', '21', '2020-08-17 05:25:07', '2020-08-17 05:25:07', 3),
(28, 'Pink Floyd', 'The Dark Side Of The Moon', '2020-08-17 05:25:31', '2020-08-17 05:25:31', 3),
(29, 'Prodigy', 'The Fat Of The Land', '2020-08-17 05:26:05', '2020-08-17 05:26:05', 3),
(30, 'Arctic Monkeys', 'AM', '2020-08-17 05:26:38', '2020-08-17 05:26:38', 3),
(31, 'Red Hot Chili Peppers', 'Californication', '2020-08-17 05:27:06', '2020-08-17 05:27:06', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2020_07_20_032010_create_discs_table', 2),
(6, '2020_08_07_035447_create_roles_table', 2),
(7, '2020_08_07_035538_create_role_user_table', 2),
(8, '2020_08_11_032756_add_discs_user_table', 3),
(9, '2020_08_11_114228_create_disc_user_table', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sbs18@mail.ru', '179e661bd9c7043015508ade43c306cd1670ba653b061d12f90ea0bc89fefeab', '2020-08-16 23:23:00');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(5, 2, 2, NULL, NULL),
(6, 1, 2, NULL, NULL),
(12, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Борис', 'sbs18@mail.ru', '$2y$10$Whkndxb191CisMHYiZt.oO31u.ITRHw1H9xTElxDGe2Jf1D71Q8sm', 'LgCAvtxvPq0w6VJy6FEt1lo2CwH2OrNUd5hknXBxZXPincTBBIB74Am6ltxC', '2020-07-29 23:21:45', '2020-08-15 05:50:56'),
(2, 'Anton', 'Anton@mail.ru', '$2y$10$Fbo4xia3HDgnNrqGG6jSoOnz.kK/del0SFbnDI9m0ZOLzF5SrJtSO', 'gCFqZAh2WJG66VvQtNskFqnziJcTEwPpngI35Sb2R1LMueV1Mm4CcOceBx9M', '2020-08-07 02:02:44', '2020-08-17 05:22:18'),
(3, 'adam', 'solomon-st@mail.ru', '$2y$10$qQQ0BsXIlml1oPIRswHBuOyHcWYRosoEjjTFqe2xBo0cN0wbmWFiW', '0vZoKLA92jpRxTPHGuxFbQwI1gCoruc4Wah7BCmzqD4r5Mx7bG8UTRY0aWLM', '2020-08-16 23:24:37', '2020-08-17 05:28:43');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `discs`
--
ALTER TABLE `discs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discs_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `discs`
--
ALTER TABLE `discs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `discs`
--
ALTER TABLE `discs`
  ADD CONSTRAINT `discs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
