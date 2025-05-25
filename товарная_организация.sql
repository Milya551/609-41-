-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: mysql
-- Время создания: Май 25 2025 г., 15:18
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
-- Структура таблицы `категория_товара`
--

CREATE TABLE `категория_товара` (
  `id` int NOT NULL COMMENT 'id категории товара',
  `наименование` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'наименование категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `категория_товара`
--

INSERT INTO `категория_товара` (`id`, `наименование`) VALUES
(1, 'Бытовая техника'),
(2, 'Продукты питания'),
(3, 'Одежда'),
(4, 'Канцелярия'),
(5, 'Электроника');

-- --------------------------------------------------------

--
-- Структура таблицы `приходная_накладная`
--

CREATE TABLE `приходная_накладная` (
  `id` int NOT NULL COMMENT 'id приходной накладной',
  `дата_и_время` datetime NOT NULL COMMENT 'дата и время поступления',
  `поставщик` varchar(100) NOT NULL COMMENT 'Поставщик'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `приходная_накладная`
--

INSERT INTO `приходная_накладная` (`id`, `дата_и_время`, `поставщик`) VALUES
(1, '2025-05-05 14:35:00', 'Haier'),
(2, '2025-05-06 12:16:52', 'ООО Пищепром'),
(3, '2025-05-04 18:31:27', 'ИП Стиль'),
(4, '2025-05-07 08:48:42', 'Erich Krause'),
(5, '2025-05-07 15:17:53', 'Smart-AC');

-- --------------------------------------------------------

--
-- Структура таблицы `расходная_накладная`
--

CREATE TABLE `расходная_накладная` (
  `id` int NOT NULL COMMENT 'id расходной накладной',
  `дата_и_время` datetime NOT NULL COMMENT 'дата и время отпуска',
  `покупатель` varchar(100) NOT NULL COMMENT 'покупатель'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `расходная_накладная`
--

INSERT INTO `расходная_накладная` (`id`, `дата_и_время`, `покупатель`) VALUES
(1, '2025-05-10 17:56:04', 'Магазин \"Подсолнух\"'),
(2, '2025-05-11 13:23:07', 'Интернет-магазин'),
(3, '2025-05-10 16:50:59', 'Магазин \"24 часа\"'),
(4, '2025-05-25 14:56:04', 'Покупатель Федоров'),
(5, '2025-05-25 14:56:04', 'Покупатель Игнатьев');

-- --------------------------------------------------------

--
-- Структура таблицы `товар`
--

CREATE TABLE `товар` (
  `id` int NOT NULL COMMENT 'id товара',
  `наименование` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'наименование товара',
  `id_категории` int NOT NULL COMMENT 'id категории(внешний ключ)',
  `вес` decimal(10,0) NOT NULL COMMENT 'вес товара в кг'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `товар`
--

INSERT INTO `товар` (`id`, `наименование`, `id_категории`, `вес`) VALUES
(1, 'Холодильник', 1, '75'),
(2, 'Молоко 1л', 2, '1'),
(3, 'Футболка', 3, '0'),
(4, 'Ручка гелевая', 4, '0'),
(5, 'Смартфон', 5, '0'),
(6, 'Хлеб', 2, '1'),
(7, 'Джинсы', 3, '1'),
(8, 'Ноутбук', 5, '3'),
(9, 'Кофеварка', 1, '4'),
(10, 'Тетрадь 96л', 4, '0');

-- --------------------------------------------------------

--
-- Структура таблицы `товар_приходной_накладной`
--

CREATE TABLE `товар_приходной_накладной` (
  `id` int NOT NULL COMMENT 'id товара приходной накладной',
  `id_товара` int NOT NULL COMMENT 'id товара(внешний ключ)',
  `id_приходной_накладной` int NOT NULL COMMENT 'id приходной накладной(внешний ключ)',
  `количество` int NOT NULL COMMENT 'количество товара',
  `цена` decimal(10,0) NOT NULL COMMENT 'цена за единицу товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `товар_приходной_накладной`
--

INSERT INTO `товар_приходной_накладной` (`id`, `id_товара`, `id_приходной_накладной`, `количество`, `цена`) VALUES
(1, 1, 1, 5, '40000'),
(2, 2, 2, 100, '70'),
(3, 3, 3, 50, '800'),
(4, 4, 4, 200, '50'),
(5, 5, 5, 45, '30000'),
(6, 6, 2, 80, '30'),
(7, 7, 3, 25, '1500'),
(8, 8, 5, 15, '45000'),
(9, 9, 1, 12, '10000'),
(10, 10, 4, 180, '45');

-- --------------------------------------------------------

--
-- Структура таблицы `товар_расходной_накладной`
--

CREATE TABLE `товар_расходной_накладной` (
  `id` int NOT NULL COMMENT 'id товара расходной накладной',
  `id_товара` int NOT NULL COMMENT 'id товара(внешний ключ)',
  `id_расходной_накладной` int NOT NULL COMMENT 'id расходной накладной(внешний ключ)',
  `количество` int NOT NULL COMMENT 'количество товара',
  `цена` decimal(10,0) NOT NULL COMMENT 'цена за единицу товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `товар_расходной_накладной`
--

INSERT INTO `товар_расходной_накладной` (`id`, `id_товара`, `id_расходной_накладной`, `количество`, `цена`) VALUES
(11, 1, 2, 2, '50000'),
(12, 2, 1, 10, '100'),
(13, 3, 2, 5, '1200'),
(14, 4, 3, 50, '90'),
(15, 5, 5, 10, '55000'),
(16, 6, 1, 15, '60'),
(17, 7, 4, 8, '2500'),
(18, 8, 5, 5, '6000'),
(19, 9, 3, 6, '15000'),
(20, 10, 4, 50, '70');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `категория_товара`
--
ALTER TABLE `категория_товара`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `приходная_накладная`
--
ALTER TABLE `приходная_накладная`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `расходная_накладная`
--
ALTER TABLE `расходная_накладная`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `товар`
--
ALTER TABLE `товар`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_категории` (`id_категории`);

--
-- Индексы таблицы `товар_приходной_накладной`
--
ALTER TABLE `товар_приходной_накладной`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_приходной_накладной` (`id_приходной_накладной`),
  ADD KEY `id_товара` (`id_товара`);

--
-- Индексы таблицы `товар_расходной_накладной`
--
ALTER TABLE `товар_расходной_накладной`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_расходной_накладной` (`id_расходной_накладной`),
  ADD KEY `id_товара` (`id_товара`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `категория_товара`
--
ALTER TABLE `категория_товара`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id категории товара', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `приходная_накладная`
--
ALTER TABLE `приходная_накладная`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id приходной накладной', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `расходная_накладная`
--
ALTER TABLE `расходная_накладная`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id расходной накладной', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `товар`
--
ALTER TABLE `товар`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id товара', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `товар_приходной_накладной`
--
ALTER TABLE `товар_приходной_накладной`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id товара приходной накладной', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `товар_расходной_накладной`
--
ALTER TABLE `товар_расходной_накладной`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id товара расходной накладной', AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `товар`
--
ALTER TABLE `товар`
  ADD CONSTRAINT `товар_ibfk_1` FOREIGN KEY (`id_категории`) REFERENCES `категория_товара` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `товар_приходной_накладной`
--
ALTER TABLE `товар_приходной_накладной`
  ADD CONSTRAINT `товар_приходной_накладной_ibfk_1` FOREIGN KEY (`id_приходной_накладной`) REFERENCES `приходная_накладная` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `товар_приходной_накладной_ibfk_2` FOREIGN KEY (`id_товара`) REFERENCES `товар` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `товар_расходной_накладной`
--
ALTER TABLE `товар_расходной_накладной`
  ADD CONSTRAINT `товар_расходной_накладной_ibfk_1` FOREIGN KEY (`id_расходной_накладной`) REFERENCES `расходная_накладная` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `товар_расходной_накладной_ibfk_2` FOREIGN KEY (`id_товара`) REFERENCES `товар` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
