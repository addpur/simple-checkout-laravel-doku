-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 23 Nov 2024 pada 04.06
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simple_checkout`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `delivery_fee` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`id`, `name`, `email`, `address`, `phone_number`, `country`, `total_price`, `delivery_fee`, `grand_total`, `created_at`, `updated_at`) VALUES
(1, 'Dono', 'dono@mail.com', 'Purwokerto RT 01 RW 01, Jawa Tengah ', '08922221112', 'ID', 340000, 0, 350000, '2024-11-20 13:55:49', '2024-11-20 13:57:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cart_detail`
--

INSERT INTO `cart_detail` (`id`, `cart_id`, `product_name`, `image`, `price`, `qty`, `total_price`) VALUES
(1, 1, 'Street Sneakers', 'assets/media/products/11.png', 90000, 2, 180000),
(2, 1, 'Smartwatch', 'assets/media/products/1.png', 160000, 1, 160000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_payment`
--

CREATE TABLE `log_payment` (
  `id` int(11) NOT NULL,
  `trx_code` varchar(191) DEFAULT NULL,
  `req_type` varchar(20) DEFAULT NULL COMMENT 'Req_Payment,Check_status',
  `request` text DEFAULT NULL,
  `response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `log_payment`
--

INSERT INTO `log_payment` (`id`, `trx_code`, `req_type`, `request`, `response`, `created_at`, `updated_at`) VALUES
(175, 'INV-20241122161004', 'Payment', '{\"order\":{\"amount\":350000,\"invoice_number\":\"INV-20241122161004\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"AMOUNT NOT MATCH\"]}', '2024-11-22 16:10:04', '2024-11-22 16:10:04'),
(176, 'INV-20241122161523', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241122161523\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241122161523\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20241522231523714\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20241522231523714\",\"expired_date\":\"20241122234523\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241122231523678107192241243041817037,\"headers\":{\"request_id\":\"e7ba9f84-3911-4a07-9ea6-62f27da34deb\",\"signature\":\"HMACSHA256=LsaMe5TZYZw87iB9TxmN9uLwZLbWfhEDaJaRFyZEgmI=\",\"date\":\"2024-11-22T16:15:23Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-22 16:15:23', '2024-11-22 16:15:23'),
(177, 'INV-20241122161623', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241122161623\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241122161623\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20241622231624082\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20241622231624082\",\"expired_date\":\"20241122234623\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241122231624041107192241499041973405,\"headers\":{\"request_id\":\"d76f0ae3-684c-48ca-a359-f2c2d5356a54\",\"signature\":\"HMACSHA256=utvRAVyewRGoxUTai04xz4E8xw9Ez0ExUVLMvg8hXE0=\",\"date\":\"2024-11-22T16:16:23Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-22 16:16:24', '2024-11-22 16:16:24'),
(178, 'INV-20241122161735', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241122161735\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241122161735\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20241722231735947\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20241722231735947\",\"expired_date\":\"20241122234735\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241122231735916107192241638042125392,\"headers\":{\"request_id\":\"a41b7495-c38a-4d31-9a9a-05e23a98a285\",\"signature\":\"HMACSHA256=vvxplz2kgyMsNqwDQAwxyokaYLdgfP/mcbauZKpakAA=\",\"date\":\"2024-11-22T16:17:35Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-22 16:17:35', '2024-11-22 16:17:35'),
(179, 'INV-20241122162804', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241122162804\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241122162804\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20242822232804705\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20242822232804705\",\"expired_date\":\"20241122235804\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241122232804668107192241591042856417,\"headers\":{\"request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\",\"signature\":\"HMACSHA256=QDhV6HGrhJtY4fK/8NOggX1wxLxRUBuWIjRX48QTlNk=\",\"date\":\"2024-11-22T16:28:04Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-22 16:28:04', '2024-11-22 16:28:04'),
(180, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:30:35', '2024-11-22 16:30:35'),
(181, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:40:08', '2024-11-22 16:40:08'),
(182, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:42:52', '2024-11-22 16:42:52'),
(183, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:43:28', '2024-11-22 16:43:28'),
(184, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:44:57', '2024-11-22 16:44:57'),
(185, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:45:23', '2024-11-22 16:45:23'),
(186, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:45:38', '2024-11-22 16:45:38'),
(187, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:46:09', '2024-11-22 16:46:09'),
(188, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:46:24', '2024-11-22 16:46:24'),
(189, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:46:31', '2024-11-22 16:46:31'),
(190, 'INV-20241122162804', 'Check_Status', '', '{\"order\":{\"invoice_number\":\"INV-20241122162804\",\"amount\":340000},\"transaction\":{\"status\":\"SUCCESS\",\"type\":\"PAYMENT\",\"date\":\"2024-11-22T16:30:11Z\",\"original_request_id\":\"7196cfff-12ad-4467-a953-d50f22742e1e\"},\"service\":{\"id\":\"VIRTUAL_ACCOUNT\"},\"acquirer\":{\"id\":\"BANK_DANAMON\",\"name\":\"Bank Danamon\"},\"channel\":{\"id\":\"VIRTUAL_ACCOUNT_BANK_DANAMON\"},\"virtual_account_info\":{\"virtual_account_number\":\"8922600000021859\",\"created_date\":\"20241122232923\",\"expired_date\":\"20241122235923\",\"reusable_status\":false},\"virtual_account_inquiry\":{\"status\":\"USED\",\"date\":\"20241122233008\",\"reference_number\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\",\"inquiry_request_id\":\"4mX1HuGtKREzNH5XfNK2y21yDi6k83hhlJEvOlhg\"},\"virtual_account_payment\":{\"identifier\":[{\"name\":\"USER_REF_NO\",\"value\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},{\"name\":\"PAY_ACCOUNT\",\"value\":\"892338328157\"},{\"name\":\"PAY_BANK\",\"value\":\"Danamon\"},{\"name\":\"PAY_DESC\",\"value\":\"Payment Simulator for 8922600000021859\"},{\"name\":\"PAY_AMOUNT\",\"value\":\"340000\"},{\"name\":\"BILL_AMOUNT\",\"value\":\"340000\"}],\"reference_number\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\",\"date\":\"20241122233011\",\"status\":\"SUCCESS\",\"payment_request_id\":\"fGsYPiFbxQXPHG196Qn7NrQz8Mq0WDQjjhAvCOv7\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"api_format\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"quantity\":2.0,\"price\":\"90000\",\"name\":\"Street Sneakers\"},{\"quantity\":1.0,\"price\":\"160000\",\"name\":\"Smartwatch\"}]}}', '2024-11-22 16:48:11', '2024-11-22 16:48:11'),
(191, 'TRX-20241122165153', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241122165153\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241122165153\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20245122235155306\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20245122235155306\",\"expired_date\":\"20241123002153\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241122235155277107192241362057332995,\"headers\":{\"request_id\":\"1981ed3f-fa54-4cac-8d69-6aa938335e42\",\"signature\":\"HMACSHA256=9F4KGtCycB78X8LLqRcqxBlQU/4dqJQfhqGat53aFJY=\",\"date\":\"2024-11-22T16:51:53Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-22 16:51:55', '2024-11-22 16:51:55'),
(192, 'TRX-20241122165522', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241122165522\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241122165522\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20245522235523031\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20245522235523031\",\"expired_date\":\"20241123002522\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241122235523001107192241937062107596,\"headers\":{\"request_id\":\"5b68df44-9fc8-4d83-8963-880313ac43c8\",\"signature\":\"HMACSHA256=1zj/ZNhdy7w0TLhLK4t2WP1uOxlpP2/QO2aklcM65cA=\",\"date\":\"2024-11-22T16:55:22Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-22 16:55:23', '2024-11-22 16:55:23'),
(193, 'TRX-20241123030319', 'Payment', '{\"order\":{\"amount\":340000,\"invoice_number\":\"INV-20241123030319\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http:\\/\\/localhost\\/simple_checkout\\/public\\/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"price\":90000,\"quantity\":2},{\"name\":\"Smartwatch\",\"price\":160000,\"quantity\":1}]},\"payment\":{\"payment_due_date\":\"30\"},\"customer\":{\"name\":\"Dono\",\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"}}', '{\"message\":[\"SUCCESS\"],\"response\":{\"order\":{\"amount\":\"340000\",\"invoice_number\":\"INV-20241123030319\",\"currency\":\"IDR\",\"session_id\":\"SU5WFDferd561dfasfasdfae123c\",\"callback_url\":\"http://localhost/simple_checkout/public/\",\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"payment\":{\"payment_method_types\":[\"CREDIT_CARD\",\"PERMATA_NET\",\"EMONEY_OVO\",\"DIRECT_DEBIT_BRI\",\"JENIUS_PAY\",\"ONLINE_TO_OFFLINE_ALFA\",\"VIRTUAL_ACCOUNT_BANK_DANAMON\",\"PEER_TO_PEER_INDODANA\",\"ONLINE_TO_OFFLINE_INDOMARET\",\"EMONEY_SHOPEE_PAY\",\"PEER_TO_PEER_KREDIVO\",\"VIRTUAL_ACCOUNT_DOKU\",\"KLIKPAY_BCA\",\"EMONEY_DOKU\",\"VIRTUAL_ACCOUNT_BANK_SYARIAH_MANDIRI\",\"PEER_TO_PEER_AKULAKU\",\"EPAY_BRI\",\"DANAMON_ONLINE_BANKING\",\"VIRTUAL_ACCOUNT_BANK_MANDIRI\",\"EMONEY_LINKAJA\",\"VIRTUAL_ACCOUNT_BRI\",\"OCTO_CLICKS\",\"VIRTUAL_ACCOUNT_BNI\",\"VIRTUAL_ACCOUNT_BANK_PERMATA\",\"VIRTUAL_ACCOUNT_BANK_CIMB\",\"VIRTUAL_ACCOUNT_BNC\",\"VIRTUAL_ACCOUNT_BCA\"],\"payment_due_date\":30,\"token_id\":\"SU5WFDferd561dfasfasdfae123c20240323100320002\",\"url\":\"https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20240323100320002\",\"expired_date\":\"20241123103319\"},\"customer\":{\"email\":\"dono@mail.com\",\"phone\":\"08922221112\",\"name\":\"Dono\",\"address\":\"Purwokerto RT 01 RW 01, Jawa Tengah \",\"country\":\"ID\"},\"additional_info\":{\"origin\":{\"product\":\"CHECKOUT\",\"system\":\"mid-jokul-checkout-system\",\"apiFormat\":\"JOKUL\",\"source\":\"direct\"},\"line_items\":[{\"name\":\"Street Sneakers\",\"quantity\":2,\"price\":\"90000\"},{\"name\":\"Smartwatch\",\"quantity\":1,\"price\":\"160000\"}]},\"uuid\":2225241123100319951107192241907097117944,\"headers\":{\"request_id\":\"b54eb093-9813-4a49-b87c-bfc07957eb20\",\"signature\":\"HMACSHA256=RnCjKKad6Iqd2jMth0gXIr/RY9UeEmHJQ7Pi1FQ8SYA=\",\"date\":\"2024-11-23T03:03:19Z\",\"client_id\":\"BRN-0239-1669127868676\"}}}', '2024-11-23 03:03:20', '2024-11-23 03:03:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `trx_code` varchar(20) DEFAULT NULL,
  `pay_code` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `country` varchar(3) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL,
  `delivery_fee` int(11) DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending' COMMENT 'Pending,Berhasil,Expired',
  `payment_url` varchar(200) DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`id`, `trx_code`, `pay_code`, `name`, `email`, `address`, `phone_number`, `country`, `total_price`, `delivery_fee`, `grand_total`, `status`, `payment_url`, `expired_date`, `created_at`, `updated_at`) VALUES
(3, 'INV-20241122162804', 'INV-20241122162804', 'Dono', 'dono@mail.com', 'Purwokerto RT 01 RW 01, Jawa Tengah ', '08922221112', 'ID', 340000, 0, 350000, 'Berhasil', 'https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20242822232804705', NULL, '2024-11-22 16:28:04', '2024-11-22 16:28:04'),
(4, 'TRX-20241122165153', NULL, 'Dono', 'dono@mail.com', 'Purwokerto RT 01 RW 01, Jawa Tengah ', '08922221112', 'ID', 340000, 0, 350000, 'Pending', 'https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20245122235155306', NULL, '2024-11-22 16:51:53', '2024-11-22 16:51:53'),
(5, 'TRX-20241122165522', 'INV-20241122165522', 'Dono', 'dono@mail.com', 'Purwokerto RT 01 RW 01, Jawa Tengah ', '08922221112', 'ID', 340000, 0, 350000, 'Pending', 'https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20245522235523031', '2024-11-23 00:25:22', '2024-11-22 16:55:22', '2024-11-22 16:55:22'),
(6, 'TRX-20241123030319', 'INV-20241123030319', 'Dono', 'dono@mail.com', 'Purwokerto RT 01 RW 01, Jawa Tengah ', '08922221112', 'ID', 340000, 0, 350000, 'Pending', 'https://sandbox.doku.com/checkout-link-v2/SU5WFDferd561dfasfasdfae123c20240323100320002', '2024-11-23 10:33:19', '2024-11-23 03:03:19', '2024-11-23 03:03:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_name`, `image`, `price`, `qty`, `total_price`) VALUES
(1, 3, 'Street Sneakers', 'assets/media/products/11.png', 90000, 2, 180000),
(2, 3, 'Smartwatch', 'assets/media/products/1.png', 160000, 1, 160000),
(3, 4, 'Street Sneakers', 'assets/media/products/11.png', 90000, 2, 180000),
(4, 4, 'Smartwatch', 'assets/media/products/1.png', 160000, 1, 160000),
(5, 5, 'Street Sneakers', 'assets/media/products/11.png', 90000, 2, 180000),
(6, 5, 'Smartwatch', 'assets/media/products/1.png', 160000, 1, 160000),
(7, 6, 'Street Sneakers', 'assets/media/products/11.png', 90000, 2, 180000),
(8, 6, 'Smartwatch', 'assets/media/products/1.png', 160000, 1, 160000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_payment`
--
ALTER TABLE `log_payment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log_payment`
--
ALTER TABLE `log_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
