-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 06:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farm_marketplace`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `farmer_id`, `title`, `content`, `created_at`) VALUES
(1, 2, 'Tips for Growing Basmati Rice', 'Use well-drained soil and proper irrigation...', '2025-04-15 04:00:00'),
(2, 3, 'Organic Vegetable Farming', 'Avoid chemical fertilizers to keep produce natural...', '2025-04-16 05:00:00'),
(3, 4, 'Basics of Dairy Farming', 'Maintain clean environment and regular feeding schedule...', '2025-04-17 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `business_buyers`
--

CREATE TABLE `business_buyers` (
  `buyer_id` int(11) NOT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `trade_license_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_buyers`
--

INSERT INTO `business_buyers` (`buyer_id`, `business_name`, `trade_license_number`) VALUES
(2, 'Green Farm Ltd', 'TL-001'),
(5, 'AgroTrade Inc', 'TL-002'),
(8, 'Soisob Kichuri House', '420');

-- --------------------------------------------------------

--
-- Table structure for table `buyers`
--

CREATE TABLE `buyers` (
  `buyer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `buyer_type` enum('household','business','restaurant') DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buyers`
--

INSERT INTO `buyers` (`buyer_id`, `user_id`, `buyer_type`, `phone`, `address`) VALUES
(1, 5, 'household', '01711111111', 'Dhaka, Bangladesh'),
(2, 6, 'business', '01722222222', 'Chittagong, Bangladesh'),
(3, 7, 'restaurant', '01733333333', 'Sylhet, Bangladesh'),
(4, 8, 'household', '01744444444', 'Barishal, Bangladesh'),
(5, 9, 'business', '01755555555', 'Khulna, Bangladesh'),
(6, 10, 'restaurant', '01766666666', 'Rajshahi, Bangladesh'),
(8, 12, 'business', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `delivery_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `delivery_status` varchar(50) DEFAULT NULL,
  `estimated_delivery_date` date DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `delivery_partner` varchar(100) DEFAULT NULL,
  `delivery_fee` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`delivery_id`, `order_id`, `delivery_status`, `estimated_delivery_date`, `tracking_number`, `delivery_partner`, `delivery_fee`) VALUES
(1, 1, 'delivered', '2025-04-22', 'TRK123', 'Pathao', 100.00),
(2, 2, 'ready for pickup', '2025-04-20', 'PICKUP02', 'In-person', 0.00),
(3, 3, 'shipped', '2025-04-23', 'TRK456', 'RedX', 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `farmers`
--

CREATE TABLE `farmers` (
  `farmer_id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `farm_size` varchar(50) DEFAULT NULL,
  `farm_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `farmers`
--

INSERT INTO `farmers` (`farmer_id`, `full_name`, `phone`, `address`, `farm_size`, `farm_type`) VALUES
(2, 'Joe Farmer', '01611111111', 'Gazipur, Bangladesh', '5 acres', 'Rice'),
(3, 'Jane Farmer', '01622222222', 'Mymensingh, Bangladesh', '3 acres', 'Vegetables'),
(4, 'Sam Farmer', '01633333333', 'Tangail, Bangladesh', '2 acres', 'Dairy');

-- --------------------------------------------------------

--
-- Table structure for table `household_buyers`
--

CREATE TABLE `household_buyers` (
  `buyer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `nid_number` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `household_buyers`
--

INSERT INTO `household_buyers` (`buyer_id`, `first_name`, `last_name`, `nid_number`) VALUES
(1, 'Alice', 'Smith', '1234567890'),
(4, 'Bob', 'Brown', '0987654321');

-- --------------------------------------------------------

--
-- Table structure for table `market_prices`
--

CREATE TABLE `market_prices` (
  `price_id` int(11) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `market_prices`
--

INSERT INTO `market_prices` (`price_id`, `product_name`, `price`, `date`) VALUES
(1, 'Rice', 55.00, '2025-04-18'),
(2, 'Rice', 56.00, '2025-04-19'),
(3, 'Rice', 57.00, '2025-04-20'),
(4, 'Tomato', 30.00, '2025-04-18'),
(5, 'Tomato', 32.00, '2025-04-19'),
(6, 'Tomato', 31.00, '2025-04-20'),
(7, 'Milk', 60.00, '2025-04-18'),
(8, 'Milk', 62.00, '2025-04-19'),
(9, 'Milk', 61.00, '2025-04-20');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `message`, `timestamp`) VALUES
(1, 5, 2, 'Hi Joe, is your rice organic?', '2025-04-19 08:00:00'),
(2, 2, 5, 'Yes, all my rice is 100% organic.', '2025-04-19 08:05:00'),
(3, 6, 3, 'Hello Jane, can I buy 100kg tomatoes?', '2025-04-19 08:10:00'),
(4, 3, 6, 'Sure, I have 300kg available.', '2025-04-19 08:15:00'),
(5, 3, 2, 'j', '2025-04-23 18:31:36'),
(6, 3, 2, 'j', '2025-04-23 18:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `delivery_method` varchar(50) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `buyer_id`, `total_price`, `payment_status`, `delivery_method`, `order_status`, `created_at`) VALUES
(1, 1, 5250.00, 'paid', 'home_delivery', 'delivered', '2025-04-20 02:00:00'),
(2, 2, 4250.00, 'pending', 'pickup', 'pending', '2025-04-20 03:00:00'),
(3, 3, 9000.00, 'paid', 'home_delivery', 'shipped', '2025-04-20 04:00:00'),
(4, 5, 150.00, 'pending', 'home_delivery', 'pending', '2025-04-22 16:55:28'),
(7, 5, 400.00, 'Paid', 'home_delivery', 'pending', '2025-04-22 17:05:52'),
(8, 5, 150.00, 'Paid', 'pickup', 'pending', '2025-04-22 17:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `subtotal_price`) VALUES
(1, 1, 1, 50, 2750.00),
(2, 1, 2, 50, 2500.00),
(3, 2, 3, 100, 3000.00),
(4, 2, 4, 50, 1250.00),
(5, 3, 5, 100, 6000.00),
(6, 3, 6, 20, 3000.00),
(7, 4, 6, 1, 150.00),
(10, 7, 2, 8, 400.00),
(11, 8, 6, 1, 150.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_status`, `payment_method`, `amount`, `transaction_id`, `created_at`) VALUES
(1, 1, 'completed', 'bKash', 5250.00, 'TXN1001', '2025-04-20 02:05:00'),
(2, 2, 'pending', 'Nagad', 0.00, NULL, '2025-04-20 03:05:00'),
(3, 3, 'completed', 'SSLCommerz', 9000.00, 'TXN1003', '2025-04-20 04:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `farmer_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price_per_unit` decimal(10,2) DEFAULT NULL,
  `unit_type` varchar(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `harvest_date` date DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `farmer_id`, `name`, `category`, `price_per_unit`, `unit_type`, `quantity`, `harvest_date`, `expiration_date`, `description`, `image_url`, `status`, `created_at`) VALUES
(1, 2, 'Basmati Rice', 'Grains', 55.00, 'kg', 100, '2025-04-10', '2025-10-10', 'High quality Basmati rice', 'Basmati-Rice.webp\n', 'available', '2025-04-19 07:00:00'),
(2, 2, 'Brown Rice', 'Grains', 50.00, 'kg', 200, '2025-04-12', '2025-10-12', 'Organic brown rice', 'Organic_Brown_Rice_1200x1200.webp', 'available', '2025-04-19 07:10:00'),
(3, 3, 'Tomato', 'Vegetables', 30.00, 'kg', 300, '2025-04-15', '2025-05-15', 'Fresh organic tomatoes', 'tomato-iStock-174932787.jpg', 'available', '2025-04-19 07:20:00'),
(4, 3, 'Carrot', 'Vegetables', 25.00, 'kg', 150, '2025-04-14', '2025-05-14', 'Crunchy carrots', 'Feature-IMage-tempate-15.webp', 'available', '2025-04-19 07:30:00'),
(5, 4, 'Milk', 'Dairy', 60.00, 'liter', 200, '2025-04-18', '2025-04-25', 'Fresh cow milk', '10865.jpg', 'available', '2025-04-19 07:40:00'),
(6, 4, 'Cheese', 'Dairy', 150.00, 'kg', 49, '2025-04-17', '2025-06-17', 'Natural cheese', 'Robyn_Cheese-From-Scratch_6_MKN.jpg', 'available', '2025-04-19 07:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_buyers`
--

CREATE TABLE `restaurant_buyers` (
  `buyer_id` int(11) NOT NULL,
  `restaurant_name` varchar(100) DEFAULT NULL,
  `tin_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_buyers`
--

INSERT INTO `restaurant_buyers` (`buyer_id`, `restaurant_name`, `tin_number`) VALUES
(3, 'Farm-to-Table', 'TIN-1001'),
(6, 'Fresh Bites', 'TIN-1002');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `reviewer_id` int(11) DEFAULT NULL,
  `reviewee_id` int(11) DEFAULT NULL,
  `reviewer_type` enum('farmer','buyer') DEFAULT NULL,
  `reviewee_type` enum('farmer','buyer') DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `reviewer_id`, `reviewee_id`, `reviewer_type`, `reviewee_type`, `rating`, `review_text`, `created_at`) VALUES
(1, 5, 2, 'buyer', 'farmer', 5, 'Great rice quality!', '2025-04-19 09:00:00'),
(2, 6, 3, 'buyer', 'farmer', 4, 'Tomatoes were very fresh.', '2025-04-19 09:10:00'),
(3, 3, 6, 'farmer', 'buyer', 5, 'Quick payment, thank you!', '2025-04-19 09:20:00'),
(4, 7, 4, 'buyer', 'farmer', 5, 'Milk was delivered very fresh!', '2025-04-20 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('farmer','buyer','admin') NOT NULL,
  `status` enum('pending','approved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `role`, `status`, `created_at`) VALUES
(1, 'admin', 'sukantamajumder66@gmail.com', 'adminpass', 'admin', 'approved', '2025-04-18 02:00:00'),
(2, 'farmerjoe', 'sukanta.majumder.cse@ulab.edu.bd', 'joe123', 'farmer', 'approved', '2025-04-18 03:15:00'),
(3, 'farmerjane', 'jane@example.com', 'jane123', 'farmer', 'approved', '2025-04-18 04:20:00'),
(4, 'farmersam', 'sam@example.com', 'sam123', 'farmer', 'approved', '2025-04-18 05:30:00'),
(5, 'household1', 'house1@example.com', 'housepass', 'buyer', 'approved', '2025-04-19 06:00:00'),
(6, 'business1', 'biz1@example.com', 'bizpass', 'buyer', 'approved', '2025-04-19 06:10:00'),
(7, 'restaurant1', 'rest1@example.com', 'restpass', 'buyer', 'approved', '2025-04-19 06:20:00'),
(8, 'household2', 'house2@example.com', 'house2pass', 'buyer', 'approved', '2025-04-19 06:30:00'),
(9, 'business2', 'biz2@example.com', 'biz2pass', 'buyer', 'approved', '2025-04-19 06:40:00'),
(10, 'restaurant2', 'rest2@example.com', 'rest2pass', 'buyer', 'approved', '2025-04-19 06:50:00'),
(12, 'fardin.ahmed.cse', 'fardin.ahmed.cse@ulab.edu.bd', 'sisu124', 'buyer', 'approved', '2025-04-24 02:50:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `business_buyers`
--
ALTER TABLE `business_buyers`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `buyers`
--
ALTER TABLE `buyers`
  ADD PRIMARY KEY (`buyer_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `farmers`
--
ALTER TABLE `farmers`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `household_buyers`
--
ALTER TABLE `household_buyers`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `market_prices`
--
ALTER TABLE `market_prices`
  ADD PRIMARY KEY (`price_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `farmer_id` (`farmer_id`);

--
-- Indexes for table `restaurant_buyers`
--
ALTER TABLE `restaurant_buyers`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviewer_id` (`reviewer_id`),
  ADD KEY `reviewee_id` (`reviewee_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buyers`
--
ALTER TABLE `buyers`
  MODIFY `buyer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `delivery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `market_prices`
--
ALTER TABLE `market_prices`
  MODIFY `price_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`farmer_id`);

--
-- Constraints for table `business_buyers`
--
ALTER TABLE `business_buyers`
  ADD CONSTRAINT `business_buyers_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`buyer_id`) ON DELETE CASCADE;

--
-- Constraints for table `buyers`
--
ALTER TABLE `buyers`
  ADD CONSTRAINT `buyers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `farmers`
--
ALTER TABLE `farmers`
  ADD CONSTRAINT `farmers_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `household_buyers`
--
ALTER TABLE `household_buyers`
  ADD CONSTRAINT `household_buyers_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`buyer_id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`buyer_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`farmer_id`);

--
-- Constraints for table `restaurant_buyers`
--
ALTER TABLE `restaurant_buyers`
  ADD CONSTRAINT `restaurant_buyers_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyers` (`buyer_id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`reviewee_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
