-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 18, 2024 at 05:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c237_footballapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Arsenal 2024/2025 Home Jersey', 'A clean look for a young squad who have their sights set on the very top. Standing out over those timeless home colors, a simple embroidered crest is the star of this Arsenal jersey from adidas. Moisture-managing AEROREADY and soft interlock fabric combine to keep soccer fans comfortable while they enjoy the ride.This product is made with 100% recycled materials. By reusing materials that have already been created, we help to reduce waste and our reliance on finite resources and reduce the footprint of the products we make.', 115.00, 'arsenal.png'),
(2, 'Barcelona 2023/2024 Home Jersey', 'The FC Barcelona 2023/24 Home kit honors the 30-year journey of the Women’s squad being incorporated into the club. The crest has a hidden diamond shape that was historically used by the Women\'s team, and the classic stripes have a diamond pattern along the edges. Our Match collection pairs authentic design details with lightweight, quick-drying technology to help keep the world’s biggest soccer stars cool and comfortable on the field.', 199.00, 'barcelona.png'),
(3, 'Chelsea F.C. 2023/2024 Away Jersey', 'Who doesn\'t love an early 2000s throwback? Coming to you all the way from 2002, the 2023/24 Chelsea Away kit mixes classic colours and an all-over digital graphic with blue accents on the collar and sleeves. Inside, you will find a hidden London Chelsea F.C. design on the inner pride. Our Stadium collection pairs replica design details with sweat-wicking technology to give you a game-ready look inspired by your favourite team.', 89.00, 'chelsea.png'),
(4, 'Liverpool FC 2024/2025 Home Jersey', 'Liverpool FC 2024/25 Match Home\r\nMen\'s Nike Dri-FIT ADV Soccer Authentic Jersey\r\nOur Match collection pairs authentic design details with lightweight, quick-drying technology to help keep the world’s biggest soccer stars cool and comfortable on the field.', 199.00, 'liverpool.png'),
(5, 'Manchester United 2024/2025 Home Jersey', 'Manchester United at Old Trafford. Home fans adore them and even rivals can\'t ignore them. In 24/25, the club\'s timeless home jerseys shout even louder with bright red inserts on the sides and a subtle gradient design on the front and back. This adidas authentic version includes ventilating HEAT.RDY and lightweight details for confident football.This product is made with 100% recycled materials. By reusing materials that have already been created, we help to reduce waste and our reliance on finite resources and reduce the footprint of the products we make.', 189.00, 'manutd.png'),
(6, 'Manchester City 2024/2025 Home Jersey', 'Gear up for the Etihad with this men\'s Manchester City FC 2024/25 Home Shirt from PUMA. Paying tribute the iconic city, this stadium shirt features 0161-inspired graphics on the collar and cuffs, while City hits the nape. It\'s made from breathable polyester knit, with sweat-wicking dryCELL tech keeping you cool and comfy. Landing in the signature Team Light Blue colourway, this shirt is finished off with the City crest and PUMA Cat badge woven to the chest. Machine washable', 204.00, 'mancity.png'),
(7, 'Predator Accuracy Injection 1 Low Firm Ground Boots', 'Lace up and feel ready for action in the Predator Accuracy Injection.1 Low Firm Ground Boots. With a legacy of supporting players when it matters most, these boots are designed to give you the confidence to create game-defining moments.', 339.00, 'predator.png'),
(8, 'Predator Elite Laceless Firm Ground Boots', 'Make the difference with the Predator Elite Laceless Firm Ground Football boots, designed for players who demand precision and control. The Hybridtouch2.0 synthetic suede and grippy rubber elements enhance ball control as you dribble past defenders, while the Controlframe2.0 firm ground outsole provides comfort and stability even at high speeds. Accelerate into open space and experience the adaptive support for quick changes of direction with the stretchy PRIMEKNIT collar and laceless closure. Own the opposition with the new Predator boots.', 349.00, 'predator2.png'),
(9, 'Nike Mercurial Superfly 10 Elite Blueprint', 'Obsessed with speed? We engineered the Air Zoom unit in the Superfly 10 Elite to the exact specifications of championship athletes. It gives you the propulsive feel you need to break through the back line. The result is the most responsive Mercurial we\'ve ever made, because you demand greatness from yourself and your footwear.', 409.00, 'mercurial.png'),
(10, 'Nike Phantom GX 2 Elite', 'Obsessed with perfecting your craft? We made this for you. In the middle of the storm, with chaos swirling all around you, you\'ve calmly found the final third of the pitch, thanks to your uncanny mix of on-ball guile and grace. Go finish the job in the Phantom GX 2 Elite. We design Elite boots for you and the world\'s biggest stars to give you high-level quality, because you demand greatness from yourself and your footwear.', 355.00, 'mercurial2.png'),
(11, 'Nike Dri-FIT Academy Men\'s Football Shorts', 'A training go-to, our sweat-wicking Academy Shorts return with a streamlined, lightweight design so you can stay quick on your feet. They\'re stretchy and breathable to help you get the most out of your moves on the pitch and beyond.', 39.90, 'shorts.png'),
(12, 'Nike Strike Men\'s Dri-FIT Football Shorts', 'Be your best with the Nike Strike Collection—apparel for both elite footballers and rising stars that helps keep the sweat away on the pitch. Breathable and sweat wicking, these shorts also have a gusset panel to keep your movement natural and unrestricted.', 65.00, 'shorts2.png'),
(14, 'Women\'s Nike Dri-Fit Replica Shirt (England Team)', 'The 2024/25 England Away Shirt toes the line between established and unconventional. We fused together their classic reds and blues for a purple kit that honours their history. More importantly, it celebrates the future of the squad. Shocking side panels and other unique details push it even further into the modern era of English football.', 115.00, 'women.png'),
(15, 'Brazil 2024 Home Women\'s Nike Dri-FIT Football ', 'We updated the most iconic kit in the football world with an all-over print that celebrates Brazil\'s architecture, music and natural wonders. Look inside the shirt for a hidden detail celebrating national pride.', 115.00, 'women2.png'),
(16, 'Korea 2024 Home Women\'s Nike Dri-FIT Football ', 'Our Stadium collection pairs replica design details with sweat-wicking technology to give you a game-ready look inspired by your favourite team.', 115.00, 'women3.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
