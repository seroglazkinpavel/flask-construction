-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 30 2024 г., 19:39
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `flask_construction`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_panel`
--

CREATE TABLE `admin_panel` (
  `id` int NOT NULL,
  `password_hash` varchar(428) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `admin_panel`
--

INSERT INTO `admin_panel` (`id`, `password_hash`) VALUES
(1, 'Volodya_2023');

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int NOT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `text`, `author`, `created_at`) VALUES
(1, 'Тестируем запрос в базу данных', 'Iuliania', '2024-01-07 10:29:53'),
(2, 'Пробуем второй раз протестировать запрос в базу данных.', 'Anna', '2024-01-08 10:29:53'),
(3, 'test', 'Pavel', '2024-01-08 10:42:42'),
(4, 'Всем привет! Пробуем тестирования комментарий.Описание\r\nПрименяется для изменения алгоритма расчета ширины и высоты элемента.\r\n\r\nСогласно спецификации CSS ширина блока складывается из ширины контента (width), значений отступов (margin), полей (padding) и границ (border). Аналогично обстоит и с высотой блока. Свойство box-sizing позволяет изменить этот алгоритм, чтобы свойства width и height задавали размеры не контента, а размеры блока.\r\n\r\n', 'Luba', '2024-01-08 13:52:49'),
(5, 'Всем привет! Пробуем тестирования комментарий.Описание\r\nПрименяется для изменения алгоритма расчета ширины и высоты элемента.\r\n\r\nСогласно спецификации CSS ширина блока складывается из ширины контента (width), значений отступов (margin), полей (padding) и границ (border). Аналогично обстоит и с высотой блока. Свойство box-sizing позволяет изменить этот алгоритм, чтобы свойства width и height задавали размеры не контента, а размеры блока.\r\n\r\n', 'Luba', '2024-01-08 13:53:21'),
(21, 'textarea вылезает за пределы контейнера, как исправить?\r\nru.stackoverflow.com›questions/959515/textarea-…\r\nМеню\r\nСправка Подробные ответы на любые возможные вопросы. Мета Обсудить принципы работы и политику сайта. ... Как исправить выход блока за пределы родительского? 1. Слово вылезает за пределы экрана. Читать ещёСправка Подробные ответы на любые возможные вопросы. Мета Обсудить принципы работы и политику сайта. О нас Узнайте больше о компании Stack Overflow и наших продуктах. текущее сообщество. ... Как исправить выход блока за пределы родительского? 1. Слово вылезает за пределы экрана. 0. Вывод фона за пределы контейнера. 2. Как вынести background-image за пределы контейнера? 0. Элемент выходит за пределы grid-контейнера. Лента вопроса. Подписаться на ленту. Скрыть\r\nНе найдено: строки, заполнения', 'Pavel', '2024-01-10 14:24:12'),
(22, 'С помощью line-height можно выбрать, насколько большое расстояние будет между строчками текста. Обычно это расстояние немного больше, чем высота шрифта. Браузеры понимают line-height по-своему: как высоту контейнера строки. Читать ещёС помощью line-height можно выбрать, насколько большое расстояние будет между строчками текста. Обычно это расстояние немного больше, чем высота шрифта. Браузеры понимают line-height по-своему: как высоту контейнера строки. Символы внутри образуют область контента, а участки между этой областью и границей контейнера и есть интерлиньяж. Такая особенность может легко запутать, ведь обычно расстояние между строчками измеряется по базовым линиям текста. Иллюстрация свойства line-height. Как браузеры понимают свойство line-height. Скрыть\r\nНе найдено: отступ', 'Anna', '2024-01-10 18:28:26'),
(24, 'Как исправить выход блока за пределы родительского? 1. Слово вылезает за пределы экрана. 0. Вывод фона за пределы контейнера. 2. Как вынести background-image за пределы контейнера? 0. Элемент выходит за пределы grid-контейнера. Лента вопроса. Подписаться на ленту. Скрыть Не найдено: строки, заполнения', 'Anna', '2024-01-10 18:45:10');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(428) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `created_at`) VALUES
(3, 'Anna', 'anna@bk.ru', 'scrypt:32768:8:1$OJ9p5d3DZMO94zqZ$728ebc471216d4ceb2e9aea90444b2a4651440f4325cfccafef1f67f526b56fbb157d86ead0525e4c9905b93352ffa082f15ab008cb0deea9adfbaac449f560d', '2024-01-06 13:43:05'),
(5, 'Pavel', 'pavel@bk.ru', 'scrypt:32768:8:1$vibuljnNJW90tO4m$d80156c65028ff978949402a1e682946922357328aaeccb2517514ddbe63aaa615729efb4dc6f1012a3f672b5ae4e52cefee3b982bde3a0a35aeb7a5567b83ca', '2024-01-06 15:51:23'),
(6, 'Luba', 'luba@email.ru', 'scrypt:32768:8:1$mbcDwflcc051EjvW$006fe576d1a213608de508e737ba1dcd04f1e3cd84ab8894e09a10f821188d98fd9d0d901e67ca7e00d4060a58d23d3664aeeb422e0de400e5629731c9d40926', '2024-01-06 16:10:28');

-- --------------------------------------------------------

--
-- Структура таблицы `works`
--

CREATE TABLE `works` (
  `id` int NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_dimensions` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `works`
--

INSERT INTO `works` (`id`, `title`, `unit_dimensions`, `price`) VALUES
(1, 'Демонтаж стен из ГКЛ,пластика, МДФ', 'кв.м', 100),
(2, 'Демонтаж потолка из ГКЛ, пластика, МДФ', 'кв.м', 100),
(3, 'Демонтаж бетонных перегородок', 'кв.м', 200),
(4, 'Демонтаж болконных проемов', 'кв.м', 2000),
(5, 'Демонтаж межкомнатных дверей', 'шт.', 100),
(6, 'Демонтаж окон', 'шт.', 200),
(7, 'Демонтаж кафельной плитки', 'кв.м', 160),
(8, 'Демонтаж стяжки', 'кв.м', 200),
(9, 'Демонтаж деревянных полов', 'кв.м', 200),
(10, 'Снятие обоев', 'кв.м', 60),
(11, 'Снятие краски', 'кв.м', 150),
(12, 'Выравнивание стен по маякам', 'кв.м', 300),
(13, 'Шпатлевка стен под обои', 'кв.м', 200),
(14, 'Шпатлевка стен под окраску', 'кв.м', 300),
(15, 'Шпатлевка полукруглых стен', 'кв.м', 350),
(16, 'Монтаж откосов из пластиковых панелей', 'п/м', 250),
(17, 'Монтаж откосов из ГКЛ', 'п/м', 200),
(18, 'Замена подоконника', 'шт', 300),
(19, 'Монтаж стен из ГКЛ', 'кв.м', 300),
(20, 'Монтаж стен из МДФ', 'кв.м', 300),
(21, 'Монтаж перегородки из гкл', 'кв.м', 400),
(22, 'Монтаж стен из пластиковых панелей', 'кв.м', 250),
(23, 'Укладка тепло-шумо изоляции', 'кв.м', 80),
(24, 'Монтаж арки, полуарки', 'шт.', 2500),
(25, 'Монтаж декор стенки', 'кв.м', 1000),
(26, 'Монтаж короба под батарею отопления', 'шт', 400),
(27, 'Покраска стен', 'кв.м', 130),
(28, 'Покраска полукруглых стен', 'кв.м', 200),
(29, 'Оклеивание стен обоями в1 уровень', 'кв.м', 130),
(30, 'Оклеивание стен обоями в2 уровеня', 'кв.м', 180),
(31, 'Укладка кафеля', 'кв.м', 550),
(32, 'Сборка и установка межкомнатных дверей', 'шт', 2000),
(33, 'Сборка и установка 2-х межкомнатных дверей', 'шт', 2500),
(34, 'Установка металических дверей', 'шт', 2000),
(35, 'Увеличение проема под мет. Дверь', 'шт', 1500),
(36, 'Монтаж натяжного потолка', 'кв.м', 350),
(37, 'Монтаж потолков из ГКЛ 1 уровень', 'кв.м', 300),
(38, 'Монтаж потолков из ГКЛ 2 уровня', 'кв.м', 400),
(39, 'Монтаж потолков из ГКЛ 3 уровня', 'кв.м', 500),
(40, 'Монтаж потолков из ГКЛ 2 уровня с внутренней подсветкой', 'кв.м', 500),
(41, 'Монтаж потолка из пластиковых панелей', 'кв.м', 300),
(42, 'Монтаж потолка типа Армстронг', 'кв.м', 250),
(43, 'Шпатлевка потолка из ГКЛ 1 уровень', 'кв.м', 300),
(44, 'Шпатлевка потолка из ГКЛ 2 уровня', 'кв.м', 350),
(45, 'Шпатлевка потолка из ГКЛ 2 уровня с внутренней подсветкой', 'кв.м', 400),
(46, 'Шпатлевка бетонного потолка', 'кв.м', 450),
(47, 'Покраска потолка 1 цвет', 'кв.м', 130),
(48, 'Покраска потолка 2 цвета', 'кв.м', 200),
(49, 'Покраска потолка 3 цвета', 'кв.м', 300),
(50, 'Наклейка галтель шириной до 5 см.', 'п/м', 50),
(51, 'Наклейка галтель шириной более 5 см.', 'п/м', 80),
(52, 'Наклейка галтель к натяжному потолку', 'п/м', 100),
(53, 'Стяжка полов толщиной до 5 см', 'кв.м', 350),
(54, 'Стяжка полов толщиной до 10 см', 'кв.м', 450),
(55, 'Выравнивание полов по плоскости', 'кв.м', 200),
(56, 'Укладка линолиума', 'кв.м', 150),
(57, 'Укладка ламината', 'кв.м', 250),
(58, 'Укладка ковралина', 'кв.м', 200),
(59, 'Монтаж плинтусов', 'кв.м', 60),
(60, 'Установка порожка', 'шт', 100),
(61, 'Установка гибкого порожка', 'п/м', 50),
(62, 'Троссировка провода', 'п/м', 20),
(63, 'Установка розеток и выключателей', 'шт', 350),
(64, 'Установка точечных светильников', 'шт', 350),
(65, 'Установка бра и люстр', 'шт', 500),
(66, 'Монтаж наружнего эл.щита до 10 автоматов', 'шт', 1000),
(67, 'Монтаж внутреннего эл.щита до 10 автоматов', 'шт', 1500),
(68, 'Монтаж наружнего эл.щита до 20 автоматов', 'шт', 1300),
(69, 'Монтаж внутреннего эл.щита до20 автоматов', 'шт', 1800),
(70, 'Вынос мусора', 'Газель', 2000);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_panel`
--
ALTER TABLE `admin_panel`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_user_username` (`username`),
  ADD UNIQUE KEY `ix_user_email` (`email`);

--
-- Индексы таблицы `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_panel`
--
ALTER TABLE `admin_panel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `works`
--
ALTER TABLE `works`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
