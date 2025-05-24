-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Май 24 2025 г., 14:58
-- Версия сервера: 8.0.29
-- Версия PHP: 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ais_rasimbetova9069_millk`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL COMMENT 'id клиента',
  `surname` varchar(20) NOT NULL COMMENT 'фамилия клиента'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `surname`) VALUES
(1, 'Киселева'),
(2, 'Шестакова'),
(3, 'Петрова'),
(4, 'Кулакова'),
(5, 'Тимофеева'),
(6, 'Попова'),
(7, 'Филиппова'),
(8, 'Иванова'),
(9, 'Миронова'),
(10, 'Власова');

-- --------------------------------------------------------

--
-- Структура таблицы `cosmetologists`
--

CREATE TABLE `cosmetologists` (
  `id` int NOT NULL COMMENT 'Id косметолога',
  `surname` varchar(10) NOT NULL COMMENT 'Фамилия косметолога'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `cosmetologists`
--

INSERT INTO `cosmetologists` (`id`, `surname`) VALUES
(1, 'Ресницева'),
(2, 'Бровисцина'),
(3, 'Губинина'),
(4, 'Мастерова');

-- --------------------------------------------------------

--
-- Структура таблицы `pruvided_services`
--

CREATE TABLE `pruvided_services` (
  `id` int NOT NULL,
  `session_id` int NOT NULL,
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `pruvided_services`
--

INSERT INTO `pruvided_services` (`id`, `session_id`, `service_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 3, 1),
(4, 4, 4),
(5, 5, 4),
(6, 6, 1),
(7, 7, 3),
(8, 8, 2),
(9, 9, 2),
(10, 10, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int NOT NULL COMMENT 'id услуги',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'наименование услуги',
  `price` varchar(10) NOT NULL COMMENT 'стоимость услуги'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `price`) VALUES
(1, 'Окраска бровей', '3000'),
(2, 'Наращивание ресниц', '3500'),
(3, 'Ботокс губ', '20000'),
(4, 'Лазерная эпиляция', '8000');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL COMMENT 'id сеанса',
  `client_id` int NOT NULL COMMENT 'id клиента',
  `cosmetologist_id` int NOT NULL COMMENT 'id косметолога',
  `start_datetime` datetime NOT NULL COMMENT 'начало сеанса',
  `end_datetime` datetime NOT NULL COMMENT 'окончание сеанса'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `client_id`, `cosmetologist_id`, `start_datetime`, `end_datetime`) VALUES
(1, 10, 2, '2025-04-09 12:00:49', '2025-04-09 14:31:45'),
(2, 8, 3, '2025-04-16 10:52:33', '2025-04-16 13:05:23'),
(3, 1, 2, '2025-04-08 16:40:01', '2025-04-08 18:56:11'),
(4, 4, 4, '2025-04-03 11:00:56', '2025-04-03 12:10:21'),
(5, 9, 4, '2025-04-05 17:31:48', '2025-04-05 19:02:39'),
(6, 3, 2, '2025-04-11 09:00:15', '2025-04-11 11:07:32'),
(7, 6, 3, '2025-04-17 14:56:58', '2025-04-17 16:01:17'),
(8, 5, 1, '2025-04-13 13:02:19', '2025-04-13 15:21:25'),
(9, 7, 1, '2025-04-09 18:05:02', '2025-04-09 20:10:45'),
(10, 2, 4, '2025-04-21 12:34:22', '2025-04-21 13:15:52');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cosmetologists`
--
ALTER TABLE `cosmetologists`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pruvided_services`
--
ALTER TABLE `pruvided_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `cosmetologist_id` (`cosmetologist_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id клиента', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `cosmetologists`
--
ALTER TABLE `cosmetologists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'Id косметолога', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `pruvided_services`
--
ALTER TABLE `pruvided_services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id услуги', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id сеанса', AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `pruvided_services`
--
ALTER TABLE `pruvided_services`
  ADD CONSTRAINT `pruvided_services_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pruvided_services_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `sessions_ibfk_2` FOREIGN KEY (`cosmetologist_id`) REFERENCES `cosmetologists` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
