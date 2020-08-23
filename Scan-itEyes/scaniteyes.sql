-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Aug 23, 2020 at 01:20 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scaniteyes`
--

-- --------------------------------------------------------

--
-- Table structure for table `jnct`
--

CREATE TABLE `jnct` (
  `Jnc_ID` int(11) NOT NULL,
  `O_FK` int(11) NOT NULL,
  `M_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jnct`
--

INSERT INTO `jnct` (`Jnc_ID`, `O_FK`, `M_FK`) VALUES
(201, 501, 106),
(202, 502, 107),
(203, 503, 101),
(205, 503, 103),
(206, 503, 104),
(207, 503, 106),
(208, 503, 105),
(209, 504, 116),
(210, 504, 110),
(211, 505, 116),
(212, 505, 101);

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE `material` (
  `M_ID` int(10) NOT NULL,
  `M_Name` text NOT NULL,
  `Survival` text DEFAULT 'No data available for now.',
  `Example` text DEFAULT NULL,
  `Sanitize` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`M_ID`, `M_Name`, `Survival`, `Example`, `Sanitize`) VALUES
(101, 'Metal', '5-7 days', 'Doorknobs, Jewelry, Silverware, etc.', 'Clean them using disinfectant wipes, or from diluted household bleach solution, alcohol solution (with at least 70% alcohol) and most common EPA-registered household disinfectants should be effective.\r\n\r\nSurfaces must be cleaned with water and soap or a detergent first to remove dirt, followed by disinfection.\r\n\r\nCleaning should always start from the least soiled (cleanest) area to the most soiled (dirtiest) area in order to not spread the dirty to areas that are less soiled.'),
(102, 'Stainless Steel', '3-7 days', 'Refrigerators, Sinks, Water Bottles, etc.', 'Clean them using disinfectant wipes, or from diluted household bleach solution, alcohol solution (with at least 70% alcohol) and most common EPA-registered household disinfectants should be effective.\r\n\r\nSurfaces must be cleaned with water and soap or a detergent first to remove dirt, followed by disinfection.\r\n\r\nCleaning should always start from the least soiled (cleanest) area to the most soiled (dirtiest) area in order to not spread the dirty to areas that are less soiled.'),
(103, 'Copper', '4 hours', 'Pennies, Tea Kettles, Cookware, etc.', 'Clean them using disinfectant wipes, or from diluted household bleach solution, alcohol solution (with at least 70% alcohol) and most common EPA-registered household disinfectants should be effective.\r\n\r\nSurfaces must be cleaned with water and soap or a detergent first to remove dirt, followed by disinfection.\r\n\r\nCleaning should always start from the least soiled (cleanest) area to the most soiled (dirtiest) area in order to not spread the dirty to areas that are less soiled.'),
(104, 'Aluminium', '8 hours', 'Soda Cans, Tinfoil, Water Bottles, etc.', 'Clean them using disinfectant wipes, or from diluted household bleach solution, alcohol solution (with at least 70% alcohol) and most common EPA-registered household disinfectants should be effective.\r\n\r\nSurfaces must be cleaned with water and soap or a detergent first to remove dirt, followed by disinfection.\r\n\r\nCleaning should always start from the least soiled (cleanest) area to the most soiled (dirtiest) area in order to not spread the dirty to areas that are less soiled.'),
(105, 'Wood', '2-4 days', 'Furniture, Decking, Tabletops, etc.', 'Clean them using disinfectant wipes, or from diluted household bleach solution, alcohol solution (with at least 70% alcohol) and most common EPA-registered household disinfectants should be effective. Hold the bottle six to eight inches from the furniture and spray the piece until it is covered with a light mist, do not wipe off the disinfectant solution from the surface; let it dry on its own. \r\n\r\nWipe down tabletops, end tables, wooden arms and other hard surfaces of your furniture with a cloth soaked in the homemade disinfectant to sanitize them. The surface should stay wet for at least a minute to fully disinfect the piece. Wipe down surfaces more frequently if someone in your house is sick. \r\n\r\nOtherwise, once or twice a week is fine. Be extra careful with furniture having multiple coats of finish as it can be damaged by repeated application of harsh detergents or alcohol-based disinfectants. So ensure you do not go overboard with disinfecting such sensitive surfaces.\r\n\r\nSunshine and clean air can work wonders, and the ultraviolet rays kill a lot of other bacteria and germs. Keep your movable furniture in the sun for a few hours to get rid of any foul smell. Make sure you don’t keep any wooden furniture in the sun for long hours to avoid any fading or discoloration.\r\n'),
(106, 'Plastics', '3-7 days', 'ATM Card, Milk Containers and Bottles, Subway and Bus Seats, Elevator Buttons, Switches, etc.', 'Cleaning should always start from the least soiled (cleanest) area to the most soiled (dirtiest) area in order to not spread the dirty to areas that are less soiled.\r\n\r\nClean by soaking in a soapy water solution and rinsing off with water and disinfect them using disinfectant products.'),
(107, 'Cardboard', '24 hours', ' Shipping Boxes, Carton Boxes, etc.', 'Wipe down a cardboard box/package before opening it, and wash your hands well after disposing of the box/package.\r\n\r\nDisinfect the surface, for instance, if you set the box/package down on your kitchen counter while opening it, disinfect the counter using diluted household bleach solution, alcohol solution (with at least 70% alcohol) and most common EPA-registered household disinfectants.'),
(108, 'Glass', '4-5 days', 'Drinking Glasses, Measuring ups, Mirrors, Windows, Eyeglasses, Screens of: TVs, computers, and smartphones, etc.', 'Use soap and water for cleaning, then rinse and dry. Household disinfecting wipes should be OK to use occasionally. \r\n\r\nFor electronic devices, unplug the device first and then clean the screen with a soft slightly damp lint-free microfiber cloth, can also dampen the corner of the cloth to wipe the screen and use the dry corner to remove excess moisture left on the screen. Now use a disinfecting wipe to make it germs free after you are done cleaning. In case if you don’t have disinfecting wipes, you can use rubbing alcohol. Prepare a solution with 70 per cent isopropyl and spray it on to a microfiber cloth. Now gently wipe the screen before the solution dries out.'),
(109, 'Ceramics', '5 days', ' Dishes, Pottery, Mugs, etc.', 'Clean with powdered and liquid detergent and warm water. Scrub them with a little baking soda or salt and boil hot water in them to clean. Rinse with hot water to get rid of any traces of odors. Air dry or wipe dry with clean disposable paper towels or a clean towel or cloth.'),
(110, 'Paper', 'Up to 4 days', 'Mail, Newspaper, Books, etc.', 'Wash your hands before and after handling the paper.\r\n\r\nPapers can’t be disinfected, well not without ruining the paper and any effective chemical will at best smudge the text, at worst burn through the paper. So, it is better to practice proper hygiene practices, and if possible, keep papers away for at least 4 days and then can use them, but it’s always recommended that under no circumstances touch your face at any time. You just need to avoid touching your face and make sure you clean your hands properly.\r\n'),
(111, 'Food', 'No conclusive evidence.', 'Pizza, Burger, Fries, etc.', 'Coronavirus doesn\'t seem to spread through food according to FDA, but they also note that it’s still important to follow proper food safety practices. The FDA also does not recommend using soap or detergents, and says clean running water is sufficient.\r\n\r\nIt\'s a good idea to wash fruits and vegetables under running water before you eat them. Scrub them with a brush or your hands to remove any germs that might be on the surface. Wipe down take-out containers or grocery items and let them air dry. Keeping a few items outside for long can spoil them. In this case, wash the packets with soapy water and immediately dispose of the outer packet. Remove any unnecessary packaging and dispose into a waste bin with a lid. Packaging like cans can be wiped clean with a disinfectant before being opened or stored. \r\n\r\nWash your hands thoroughly with soap and water for at least 20 seconds before preparing any food. Wash your hands with soap and water for at least 20 seconds before eating also. \r\n\r\nWash your hands, kitchen utensils, and food preparation surfaces, including chopping boards and countertops, before and after preparing fruits and vegetables. Always use clean utensils and plates.\r\n'),
(112, 'Water', 'No conclusive evidence.', 'Liquid Products, Cold Drinks, Beverages, Mineral Water, etc.', 'Coronavirus hasn\'t been found in drinking water. \r\n\r\nThe virus that causes COVID-19 has not been detected in treated drinking water. Water treatment plants use filters and disinfectants to remove or kill germs.'),
(113, 'Fabric', 'No conclusive evidence.', 'Clothes, Linens, etc.', 'It is currently unclear how long the COVID-19 virus can survive on fabric, but many items of clothing have plastic and metal elements on which it might live for a few hours to several days.\r\n\r\nWhen doing laundry at home, killing the virus shouldn’t take any additional effort. Most household detergents are sufficient. \r\n\r\nDon’t shake dirty laundry to minimize the possibility of dispersing the virus through the air.'),
(114, 'Shoes', 'No conclusive evidence.', 'All kind of footwears', 'A new study published by the CDC suggests that the novel coronavirus can live on the soles of shoes. In the study, researchers took samples from the soles of shoes worn by members of the medical staff in the ICU at a hospital in Wuhan, China. They found that half the samples tested positive for COVID-19. These findings have led researchers to suggest that the soles of medical staff shoes might function as carriers of the disease. \r\n\r\nTaking off your shoes and cleaning them before you enter your home would be advisable. This will prevent you from introducing virus into your home from a simple trip to the grocery store. Just make sure you clean them outside your home or apartment, and let them dry naturally.'),
(115, 'Skin and hair', 'No conclusive evidence.', NULL, 'There’s no research yet on exactly how long the virus can live on your skin or hair.\r\n\r\nRhinoviruses, which cause colds, survive for hours. That’s why it’s important to wash or disinfect your hands, which are most likely to come into contact with contaminated surfaces.'),
(116, 'Money', 'No conclusive evidence.', 'Currency notes and coins', 'There is currently no evidence to confirm or disprove that coronavirus can be transmitted through coins or banknotes, as confirmed by WHO (WHO reported this on 17th April, 2020). \r\n\r\nBut it’s advisable to take precautions and wash your hands regularly and thoroughly after touching any frequently touched surface or object, including coins or banknotes.');

-- --------------------------------------------------------

--
-- Table structure for table `object`
--

CREATE TABLE `object` (
  `O_ID` int(10) NOT NULL,
  `O_Name` text NOT NULL,
  `Tips` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `object`
--

INSERT INTO `object` (`O_ID`, `O_Name`, `Tips`) VALUES
(501, 'Remote', 'Advisable to disinfect them occasionally. Clean your hands before and after touching remote controls, as they are frequently touched. Disinfect the remote case properly too.'),
(502, 'Carton Box', 'No Data Available'),
(503, 'Door Knob/Handle', 'Door knobs and handles are frequently touched by everyone, so it’s advisable to open doors with an elbow or back of a hand is another suggestions from infectious disease experts.'),
(504, 'Currency Notes', 'Online payment is advisable or Card payment too, it is probably lower risk because you retain the card and don’t have to touch other people. But wherever possible, contact-free bank transfers would pose the least risk.'),
(505, 'Coins', 'Experts suggest, more caution must be exercised while handling coins, as the virus could be resting on it for longer than on currency notes. People handling currency regularly such as shopkeepers should be more careful.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jnct`
--
ALTER TABLE `jnct`
  ADD PRIMARY KEY (`Jnc_ID`),
  ADD KEY `O_FK` (`O_FK`),
  ADD KEY `M_FK` (`M_FK`);

--
-- Indexes for table `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`M_ID`),
  ADD UNIQUE KEY `M_Name` (`M_Name`) USING HASH;

--
-- Indexes for table `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`O_ID`),
  ADD UNIQUE KEY `O_Name` (`O_Name`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jnct`
--
ALTER TABLE `jnct`
  MODIFY `Jnc_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jnct`
--
ALTER TABLE `jnct`
  ADD CONSTRAINT `jnct_ibfk_1` FOREIGN KEY (`M_FK`) REFERENCES `material` (`M_ID`),
  ADD CONSTRAINT `jnct_ibfk_2` FOREIGN KEY (`O_FK`) REFERENCES `object` (`O_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
