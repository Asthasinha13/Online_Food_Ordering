/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.5.4-MariaDB : Database - online_food_ordering
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`online_food_ordering` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

/*Table structure for table `actions` */

DROP TABLE IF EXISTS `actions`;

CREATE TABLE `actions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `module_id` int(5) DEFAULT NULL,
  `action_name` enum('add','edit','delete','view') DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `action_ibfk_1` (`module_id`),
  CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `actions` */

/*Table structure for table `authorizations` */

DROP TABLE IF EXISTS `authorizations`;

CREATE TABLE `authorizations` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `role_id` int(5) DEFAULT NULL,
  `user_id` int(5) DEFAULT NULL,
  `action_id` int(5) DEFAULT NULL,
  `permission` tinyint(1) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_authorization_ibfk_1` (`role_id`),
  KEY `role_authorization_ibfk_2` (`user_id`),
  CONSTRAINT `authorizations_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authorizations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `authorizations` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) DEFAULT NULL,
  `food_item_id` int(5) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `status` binary(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `food_item_id` (`food_item_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`food_item_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

/*Table structure for table `customer_addresses` */

DROP TABLE IF EXISTS `customer_addresses`;

CREATE TABLE `customer_addresses` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) DEFAULT NULL,
  `address_type` varchar(64) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `customer_addresses` */

insert  into `customer_addresses`(`id`,`customer_id`,`address_type`,`address`) values (1,30,'Home','North Shiv Shakti Nagar,\r\nSandalpur\r\nBazar Samiti'),(2,30,'Work','Divyan Bhawan, Kankarbagh Colony more, Patna'),(3,30,'Others','Khemnichak, NH-30 New Bypass, Patna');

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'customer id',
  `customer_name` varchar(50) DEFAULT NULL,
  `contact_no` bigint(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('female','male') DEFAULT NULL,
  `password` longtext DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(6) DEFAULT NULL,
  `modified_by` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

insert  into `customers`(`id`,`customer_name`,`contact_no`,`email`,`dob`,`gender`,`password`,`address`,`photo`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (20,'rupam kumari1',923346274,'rupam.1998@gmail.com','2022-05-06','female',NULL,'bihar',NULL,NULL,NULL,NULL,NULL),(21,'madhu kumari',675419543,'madhu@gmail.com','1994-02-02','female',NULL,'patna, bihar',NULL,NULL,NULL,NULL,NULL),(22,'yati singh',79034176,'yatisingh1103@gmail.com','2023-10-11','female',NULL,'bailey road',NULL,NULL,NULL,NULL,NULL),(23,'astha',981672345,'asasa@gmail.com','1998-04-04','female',NULL,'patna',NULL,NULL,NULL,NULL,NULL),(24,'khushbu nayan',983528654,'khushboo@97gmail.com','2018-08-06','female',NULL,'city,patna',NULL,NULL,NULL,NULL,NULL),(25,'sapna',1222222,'sapna12@gmail.com','2022-05-05','female',NULL,'kankerbhag',NULL,NULL,NULL,NULL,NULL),(30,'ram',7876655,'ram2@gmail.com','2019-08-17','female','81dc9bdb52d04dc20036dbd8313ed055','hajipur',NULL,NULL,NULL,NULL,NULL),(31,'riya',45372468,'riya@123gmail.com','2022-05-31','female',NULL,'fcfdddxdxdxdxdfcgfxfdxdxdxdx',NULL,NULL,NULL,NULL,NULL),(32,'hffv',43455,'ddxfeedd@gmail.com','2022-05-30','female',NULL,'gfcfcfcf','/assets/customer/1654513372760hffv.jpeg',NULL,NULL,NULL,NULL),(33,'Rakesh Roshan',9334455066,'ricky.it.expert@gmail.com','1988-09-27','male',NULL,'North Shiv Shakti Nagar,\nSandalpur\nBazar Samiti',NULL,NULL,NULL,NULL,NULL),(34,'Lovely Kumari',9334455266,'lovely.kumari.0504@gmail.com','1995-04-05','female',NULL,'Bazar Samiti\nPatna',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `delivery_staffs` */

DROP TABLE IF EXISTS `delivery_staffs`;

CREATE TABLE `delivery_staffs` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `contact_no` int(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `delivery_staffs` */

insert  into `delivery_staffs`(`id`,`staff_name`,`role`,`contact_no`,`email`,`location`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (6,'raju','staff',329765145,'adsfs@gmail.com','patna',NULL,NULL,NULL,NULL),(7,'khush','manegar',678543219,'khush@gmail.com','city',NULL,NULL,NULL,NULL),(9,'yati','staff',977543297,'yatiraj@gmail.com','boaring road',NULL,NULL,NULL,NULL),(10,'Ramu','manegar',876429514,'ramu22@gamil.com','hajipur',NULL,NULL,NULL,NULL),(12,'feviu','staff',496594,'fbewvu@gmqail.com','guwef8',NULL,NULL,NULL,NULL);

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL,
  `price` decimal(4,0) DEFAULT NULL,
  `half_price` decimal(4,0) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `restaurant_id` int(5) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`id`,`item_name`,`price`,`half_price`,`description`,`photo`,`restaurant_id`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (23,'Special Chicken Crispy Magic Momos [8 pieces]',220,110,'momos with chichen stuf',NULL,17,NULL,NULL,NULL,NULL),(24,'Paneer Momo [8 pcs]',150,75,'.momos',NULL,17,NULL,NULL,NULL,NULL),(25,'Paneer Tandoori Cocktail Momo [8pcs]',220,110,'.tandoori momos',NULL,17,NULL,NULL,NULL,NULL),(26,'Paneer Panfried Momo [8pcs]',220,110,'.pan fried momos with paneer stuff',NULL,17,NULL,NULL,NULL,NULL),(27,'Paneer Tandoori Tikka Afgani Momos [8pcs]',240,120,'.afgani momos',NULL,17,NULL,NULL,NULL,NULL),(28,'jhffyfc',235,140,'.',NULL,6,NULL,NULL,NULL,NULL),(29,'duv',30,20,'.',NULL,6,NULL,NULL,NULL,NULL),(30,'Onions & Capsicum Pizza',119,NULL,'A delectable combination of freshly cooked onions & capsicum with our in house sauce',NULL,13,NULL,NULL,NULL,NULL),(31,'Tomatoes Pizza',89,NULL,'thinly cut fresh tomatoes on a cheesy base with in house sauce',NULL,13,NULL,NULL,NULL,NULL),(32,'Capsicum , Paneer & Red Paprika Pizza',149,NULL,'Flavorful trio of juicy Paneer ,Crisp Capsicum with Spicy Red Paprika',NULL,13,NULL,NULL,NULL,NULL),(33,'Onions & Paneer Pizza',129,NULL,'A delectable combination of freshly cooked onions & paneer with our in house sauce',NULL,13,NULL,NULL,NULL,NULL),(34,'Onions Pizza',89,NULL,'caramelised onions on a cheesy base with in house sauce',NULL,13,NULL,NULL,NULL,NULL),(35,'Chicken Seekh & Chiken Salami Pizza',135,NULL,'Smokey Chicken Sheek & Chicken Salami Topped on Fresh Pan Crust Pizza',NULL,13,NULL,NULL,NULL,NULL),(36,'Keema & Onion Pizza',145,NULL,'Perfect blend of Keema & Onion Prepared in our in House Sauce',NULL,13,NULL,NULL,NULL,NULL),(37,'Jalapenos & Olives Pizza',135,NULL,'Remarkable blend of Jalapenos and Black Olives',NULL,13,NULL,NULL,NULL,NULL),(38,'Veg Tamer Pizza ',245,NULL,'Hot passion on a pizza , jalapenos , mushroom , red paprika , fresh Tomatoes with cheese & jalapeno Dip ',NULL,13,NULL,NULL,NULL,NULL),(39,'Texas Bbq\'ed Pizza',205,NULL,'A special Fusion of Onion Capsicum & BBQ Chicken',NULL,13,NULL,NULL,NULL,NULL),(40,'Rasgulla [ 1kg ]',152,77,'sweets',NULL,14,NULL,NULL,NULL,NULL),(41,'Gulab Jamun [1kg]',267,133,'sweets',NULL,14,NULL,NULL,NULL,NULL),(42,'Rasmalai [10 Piece]',362,181,'sweets',NULL,14,NULL,NULL,NULL,NULL),(43,'Kaju Burfi [1 kg]',257,129,'sweets',NULL,14,NULL,NULL,NULL,NULL),(44,'Kathi Roll [2 Piece]',152,76,'spicy',NULL,14,NULL,NULL,NULL,NULL),(45,'Black Fortest Cake ',360,NULL,'cake',NULL,14,NULL,NULL,NULL,NULL),(46,'Butter Scotch Cake',360,NULL,'cake',NULL,14,NULL,NULL,NULL,NULL),(47,'Chocolate Mud Cake',381,NULL,'cake',NULL,14,NULL,NULL,NULL,NULL),(48,'Chocolate Truffle Cake',424,NULL,'cake',NULL,14,NULL,NULL,NULL,NULL),(49,'Pineapple Cake (Eggless)',339,NULL,'Eggless cakes',NULL,14,NULL,NULL,NULL,NULL),(50,'white Forest Cake (Eggless)',360,NULL,'Eggless Cake',NULL,14,NULL,NULL,NULL,NULL),(51,'jalebi [1kg]',112,56,'sweets',NULL,15,NULL,NULL,NULL,NULL),(52,'Dhokla',71,36,'baked',NULL,15,NULL,NULL,NULL,NULL),(53,'Samosa [2 Pices]',27,13,'spicy',NULL,15,NULL,NULL,NULL,NULL),(54,'Samosa Chaat [1 Plate ]',67,33,'spicy',NULL,15,NULL,NULL,NULL,NULL),(55,'Dahi Bhalla [1 Plate]',86,4286,'spicy',NULL,15,NULL,NULL,NULL,NULL),(56,'Pav Bhaji [1 plate]',124,62,'spicy',NULL,15,NULL,NULL,NULL,NULL),(57,'Masala Dosa',150,NULL,'spicy',NULL,15,NULL,NULL,NULL,NULL),(58,'Baked Litti [2 pc]',38,19,'baked',NULL,15,NULL,NULL,NULL,NULL),(59,'South Indian Platter',290,NULL,'mini masala dosa , 1pc idli ,1 pc vada , mini uttappam.',NULL,15,NULL,NULL,NULL,NULL),(60,'Wednesday Strips Bucket',350,NULL,'Flat 55% off on 12 pc chicken strips served with 4  delicious dips',NULL,16,NULL,NULL,NULL,NULL),(61,'Wednesday Bucket',699,NULL,'Flat 39% off on 10 pcs of hot & crispy Chicken',NULL,16,NULL,NULL,NULL,NULL),(62,'10pc Strips with Dynamite Sauce',639,NULL,'Dipping combo of 10pc Chicken strips & our new Dynamite Spicy Mayo Sauce Bottle.',NULL,16,NULL,NULL,NULL,NULL),(63,'Friendship Bucket with Dynamite Sauce ',879,NULL,'3pc Hot & Crispy , 3wings , 3 strips Large Popcorn & our new Dynamite Mayo Bottle ',NULL,16,NULL,NULL,NULL,NULL),(64,'Family Feast',829,NULL,'Family Deal of 3 chicken zingers , a medium popcorn , medium fries & a chilled pepsi ',NULL,16,NULL,NULL,NULL,NULL),(65,'Bucket for Two ',599,NULL,'flat Rs.64 off with this variety combo of 2pc hot & crispy chicken , 2 pc smoky red chicken & a large popcorn ',NULL,16,NULL,NULL,NULL,NULL),(66,'Big 8',685,NULL,'save 29% on this variety bucket of 4pc Hot & Crispy chicken & 4pc Smoky red chicken',NULL,16,NULL,NULL,NULL,NULL),(67,'Ultimate Saving Bucket',699,NULL,'save 35% on our signature bucket of 4pc Hot & crispy chicken ,6 Wings , 4 strips, 2 Dips & a pepsi',NULL,16,NULL,NULL,NULL,NULL),(68,'5pc Smoky Red chicken',499,NULL,'Flat 20% off on 5pc Smoky red grilled chicken ',NULL,16,NULL,NULL,NULL,NULL),(69,'Popcorn Chicken Biryani Bucket-Large',475,NULL,'Large portions of our new Hyderabadi style Briyani rice served with double portions of popcorn &spicy Gravies',NULL,16,NULL,NULL,NULL,NULL),(70,'Smoky Griled Briyani Bucket',230,NULL,'New Hyderabadi style Biryani rice served with 1pc smoky Red Chicken & a spicy Gravy',NULL,16,NULL,NULL,NULL,NULL),(71,'Buddy popcorn Nachos Meal',449,NULL,'Two ka crunch ,in one munch for 2! combo of 2 new popcorn Nachos & pepsi ',NULL,16,NULL,NULL,NULL,NULL),(72,'chicken Lolipop',280,NULL,'spicy',NULL,17,NULL,NULL,NULL,NULL),(73,'Chicken Garilc',250,NULL,'spicy',NULL,17,NULL,NULL,NULL,NULL),(74,'veg Pan Fried Momo [8 pcs]',170,85,'spicy momos',NULL,17,NULL,NULL,NULL,NULL),(75,'Veg Schzewan Momo [8pcs]',170,85,'spicy schzewan momos',NULL,17,NULL,NULL,NULL,NULL),(76,'Special Veg Crispy Magic Momos [8 pices]',170,85,'crispy momos ',NULL,17,NULL,NULL,NULL,NULL),(77,'Chicken Biryani Special',257,129,'spicy biryani with 2 leg pc ,one egg',NULL,4,NULL,NULL,NULL,NULL),(78,'Chicken Biryani',190,100,'A delicious savory rice dish that is loaded with spicy marinated chicken ,caramelized onions and flavorful saffron rice .',NULL,4,NULL,NULL,NULL,NULL),(79,'Chicken Egg Biryani',200,100,'an authentic dum biryani recipe in Hyderabad style made using eggs.',NULL,4,NULL,NULL,NULL,NULL),(80,'Mutton Biryani Special',286,143,'exotic tender mutton marinated first and cooked with half-cooked rice in layers.',NULL,4,NULL,NULL,NULL,NULL),(81,'Mutton Kassa [2pcs]',191,100,'A delicious spicy Bengali Mutton Curry Which is full of flavours from mutton , spices and mudtard oil.',NULL,4,NULL,NULL,NULL,NULL),(82,'Mutton Rogan Josh',219,110,'pieces of lamb or mutton braised with a gravy flavoured with garlic , ginger and aromatic spices and incorporatin onoions or yogut',NULL,4,NULL,NULL,NULL,NULL),(83,'Fiery Chicken Wings [12 Nos] ',609,305,'Nothing better than a spicy & juicy chicken wing. these perennial party favorite spicy whole wings served with mint chutney & onion rings will make you crave for more',NULL,5,NULL,NULL,NULL,NULL),(84,'Fiery Chicken drumsticks [6 Nos]',609,305,'spicy drumsticks marinated in indian spices and hung curd cooked in clay oven - Tandoor and served with salad mix and mint chutney',NULL,5,NULL,NULL,NULL,NULL),(85,'Mutton Biryani',409,205,'Succulent pieces of mutton slow cooked on bed of aromatic rice with in- house blend of spices and seasonings and served with raita.',NULL,5,NULL,NULL,NULL,NULL);

/*Table structure for table `modules` */

DROP TABLE IF EXISTS `modules`;

CREATE TABLE `modules` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `modules` */

insert  into `modules`(`id`,`module_name`,`status`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (6,'user',1,NULL,NULL,NULL,NULL),(7,'Delivery staff',1,NULL,NULL,NULL,NULL),(8,'order',1,NULL,NULL,NULL,NULL),(9,'Restaurent',1,NULL,NULL,NULL,NULL),(10,'Menu',1,NULL,NULL,NULL,NULL),(11,'payment',1,NULL,NULL,NULL,NULL);

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `order_id` int(5) DEFAULT NULL,
  `menu_id` int(5) DEFAULT NULL,
  `unit` decimal(5,0) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `quantity` decimal(5,0) DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_ibfk_1` (`order_id`),
  KEY `order_details_ibfk_2` (`menu_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

/*Data for the table `order_details` */

insert  into `order_details`(`id`,`order_id`,`menu_id`,`unit`,`price`,`quantity`,`total_amount`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (39,45,27,NULL,240,3,720,NULL,NULL,NULL,NULL),(40,46,25,NULL,220,3,660,NULL,NULL,NULL,NULL),(41,47,25,NULL,220,1,220,NULL,NULL,NULL,NULL),(42,47,33,NULL,129,1,129,NULL,NULL,NULL,NULL),(43,48,25,NULL,220,1,220,NULL,NULL,NULL,NULL),(44,48,33,NULL,129,1,129,NULL,NULL,NULL,NULL),(45,48,36,NULL,145,2,290,NULL,NULL,NULL,NULL),(46,48,35,NULL,135,2,270,NULL,NULL,NULL,NULL),(47,49,25,NULL,220,1,220,NULL,NULL,NULL,NULL),(48,49,33,NULL,129,1,129,NULL,NULL,NULL,NULL),(49,49,36,NULL,145,2,290,NULL,NULL,NULL,NULL),(50,49,35,NULL,135,2,270,NULL,NULL,NULL,NULL),(51,50,25,NULL,220,1,220,NULL,NULL,NULL,NULL),(52,50,33,NULL,129,1,129,NULL,NULL,NULL,NULL),(53,50,36,NULL,145,2,290,NULL,NULL,NULL,NULL),(54,50,35,NULL,135,1,135,NULL,NULL,NULL,NULL);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` int(5) DEFAULT NULL,
  `restaurant_id` int(5) DEFAULT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `billed_amount` decimal(5,2) DEFAULT NULL,
  `taxes` decimal(5,2) DEFAULT NULL,
  `grand_total` int(5) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_ibfk_1` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

/*Data for the table `orders` */

insert  into `orders`(`id`,`customer_id`,`restaurant_id`,`order_date`,`billed_amount`,`taxes`,`grand_total`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (45,30,NULL,'2022-07-07 08:27:09',720.00,147.00,965,NULL,NULL,NULL,NULL),(46,30,17,'2022-07-07 08:31:11',660.00,135.00,884,NULL,NULL,NULL,NULL),(47,30,17,'2022-07-07 08:41:40',349.00,77.00,503,NULL,NULL,NULL,NULL),(48,30,17,'2022-07-07 08:42:23',909.00,174.00,1140,NULL,NULL,NULL,NULL),(49,30,17,'2022-07-07 08:43:09',909.00,179.00,1173,NULL,NULL,NULL,NULL),(50,30,17,'2022-07-07 08:44:06',774.00,143.00,940,NULL,NULL,NULL,NULL);

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `order_id` int(5) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `transaction_method` varchar(50) DEFAULT NULL,
  `processed_by` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

/*Data for the table `payments` */

/*Table structure for table `restaurants` */

DROP TABLE IF EXISTS `restaurants`;

CREATE TABLE `restaurants` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `pin_code` char(7) DEFAULT NULL,
  `contact_number` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `cuisine_types` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `licence` char(15) DEFAULT NULL,
  `fssai_licence` char(15) DEFAULT NULL,
  `gst_no` char(15) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(6) DEFAULT NULL,
  `modified_by` int(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `restaurants` */

insert  into `restaurants`(`id`,`restaurant_name`,`address`,`pin_code`,`contact_number`,`email`,`cuisine_types`,`description`,`licence`,`fssai_licence`,`gst_no`,`photo`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (4,'Biryani Mahal','\nKankarbagh\nPatna','800020','9735282467','biryanimahal@gmail.com',NULL,'Mughial, Chinese','123572','239362','49',NULL,NULL,NULL,NULL,NULL),(5,'Barbeque Nation','patna','800015','981753245','bbq@gamil.com',NULL,'best restaurant','123485','123443','23',NULL,NULL,NULL,NULL,NULL),(6,'Bawarchi ','kankarbagh, MIGH rd','800020','863452045','bawarchi@gmail.com',NULL,'family and friendly Restaurant','65743','43752','3424',NULL,NULL,NULL,NULL,NULL),(7,'Foresto Paradise','patna one mall ,fraser Road','800001','954823456','forestoparadise.patna@gmail.com',NULL,'north indian,Chinese & Continental Cuisine Served in a Rooftop Restaurant with City views.','2434','7654','1324',NULL,NULL,NULL,NULL,NULL),(8,'FreshBox','N.P.Tower, 3rd Floor, opposite Jalan Shop ,Kankarbagh Colony More , Patna, Bihar \n','800020','09199767666','freshbox@13gmail.com',NULL,'Amazing food and great packaging , great service and amazing food options','23753','82345','2563',NULL,NULL,NULL,NULL,NULL),(11,'Tulsi Restaurant ( Hotel Radhika inn )','BAILY ROAD RUKANPURA, BAILY ROAD RUKANPURA',NULL,'9372897431','rajesh4132',NULL,'.','.','.','GST',NULL,NULL,NULL,NULL,NULL),(12,'Hungry Hope','Kankarbagh, Bankman Colony','.','9999999999','bjxbunni',NULL,'.','.','.','GST',NULL,NULL,NULL,NULL,NULL),(13,'La Pino\'z Pizza','Kankarbagh','800020','983462578','lapinoz@.gmail.com',NULL,'Pizzas','562348','483627','22',NULL,NULL,NULL,NULL,NULL),(14,'Bikaner Sweets And Pastry Shop ','Sri Krishna Puri ,patna ','800001','9813457638','Bikaner@gmail.com',NULL,'Bakery and Sweets','654386','983472','76',NULL,NULL,NULL,NULL,NULL),(15,'Harilal ','kankarbagh , Patrakar Nagar ','800020','9825433534','harilal@gmail.com',NULL,'Bakery ,sweets','541836','904826','87',NULL,NULL,NULL,NULL,NULL),(16,'KFC','Bankman Colony ,kankarbagh ','800020','9812864573','kfc@gmail.com',NULL,'American , Snacks','729463','459273','56',NULL,NULL,NULL,NULL,NULL),(17,'MOMO Magic Cafe','Chitragupta Nagar patna','800020','9523541907','momomagiccafe@gmail.com',NULL,'Quick Service Restaurant ','927163','057392','93',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`status`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (11,'payment',1,NULL,NULL,NULL,NULL),(12,'delivery',1,NULL,NULL,NULL,NULL),(13,'order ',1,NULL,NULL,NULL,NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `user_password` longtext DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `creation_time` datetime DEFAULT NULL,
  `modification_time` datetime DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `modified_by` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`user_password`,`role_id`,`creation_time`,`modification_time`,`created_by`,`modified_by`) values (7,'Aastha1','asthasinha@gmail.com','sssss',NULL,NULL,NULL,NULL,NULL),(8,NULL,'asthasinha2','astha',NULL,NULL,NULL,NULL,NULL),(9,NULL,'gvvvvvvvv','yatiiii',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `actions_sys` */

DROP TABLE IF EXISTS `actions_sys`;

/*!50001 DROP VIEW IF EXISTS `actions_sys` */;
/*!50001 DROP TABLE IF EXISTS `actions_sys` */;

/*!50001 CREATE TABLE  `actions_sys`(
 `id` int(5) ,
 `action_name` enum('add','edit','delete','view') ,
 `module_id` int(5) ,
 `module_name` varchar(50) ,
 `status` tinyint(1) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `authorizations_sys` */

DROP TABLE IF EXISTS `authorizations_sys`;

/*!50001 DROP VIEW IF EXISTS `authorizations_sys` */;
/*!50001 DROP TABLE IF EXISTS `authorizations_sys` */;

/*!50001 CREATE TABLE  `authorizations_sys`(
 `id` int(5) ,
 `role_id` int(5) ,
 `name` varchar(50) ,
 `action_id` int(5) ,
 `action_name` enum('add','edit','delete','view') ,
 `module_id` int(5) ,
 `module_name` varchar(50) ,
 `permission` tinyint(1) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `cart_sys` */

DROP TABLE IF EXISTS `cart_sys`;

/*!50001 DROP VIEW IF EXISTS `cart_sys` */;
/*!50001 DROP TABLE IF EXISTS `cart_sys` */;

/*!50001 CREATE TABLE  `cart_sys`(
 `id` int(5) ,
 `user_id` int(5) ,
 `customer_name` varchar(50) ,
 `food_item_id` int(5) ,
 `item_name` varchar(50) ,
 `date_time` datetime ,
 `status` binary(1) 
)*/;

/*Table structure for table `customers_sys` */

DROP TABLE IF EXISTS `customers_sys`;

/*!50001 DROP VIEW IF EXISTS `customers_sys` */;
/*!50001 DROP TABLE IF EXISTS `customers_sys` */;

/*!50001 CREATE TABLE  `customers_sys`(
 `id` int(5) ,
 `customer_name` varchar(50) ,
 `contact_no` bigint(12) ,
 `email` varchar(50) ,
 `password` longtext ,
 `dob` date ,
 `gender` enum('female','male') ,
 `address` varchar(100) ,
 `photo` varchar(100) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(6) ,
 `modified_by` int(6) 
)*/;

/*Table structure for table `customer_addresses_sys` */

DROP TABLE IF EXISTS `customer_addresses_sys`;

/*!50001 DROP VIEW IF EXISTS `customer_addresses_sys` */;
/*!50001 DROP TABLE IF EXISTS `customer_addresses_sys` */;

/*!50001 CREATE TABLE  `customer_addresses_sys`(
 `id` int(5) ,
 `customer_id` int(5) ,
 `customer_name` varchar(50) ,
 `email` varchar(50) ,
 `contact_no` bigint(12) ,
 `dob` date ,
 `gender` enum('female','male') ,
 `address_type` varchar(64) ,
 `address` longtext 
)*/;

/*Table structure for table `delivery_staffs_sys` */

DROP TABLE IF EXISTS `delivery_staffs_sys`;

/*!50001 DROP VIEW IF EXISTS `delivery_staffs_sys` */;
/*!50001 DROP TABLE IF EXISTS `delivery_staffs_sys` */;

/*!50001 CREATE TABLE  `delivery_staffs_sys`(
 `id` int(5) ,
 `staff_name` varchar(50) ,
 `role` varchar(50) ,
 `contact_no` int(12) ,
 `email` varchar(50) ,
 `location` longtext ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `menu_sys` */

DROP TABLE IF EXISTS `menu_sys`;

/*!50001 DROP VIEW IF EXISTS `menu_sys` */;
/*!50001 DROP TABLE IF EXISTS `menu_sys` */;

/*!50001 CREATE TABLE  `menu_sys`(
 `id` int(5) ,
 `item_name` varchar(50) ,
 `price` decimal(4,0) ,
 `half_price` decimal(4,0) ,
 `description` longtext ,
 `photo` varchar(100) ,
 `restaurant_id` int(5) ,
 `restaurant_name` varchar(50) ,
 `address` text ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `modules_sys` */

DROP TABLE IF EXISTS `modules_sys`;

/*!50001 DROP VIEW IF EXISTS `modules_sys` */;
/*!50001 DROP TABLE IF EXISTS `modules_sys` */;

/*!50001 CREATE TABLE  `modules_sys`(
 `id` int(5) ,
 `module_name` varchar(50) ,
 `status` tinyint(1) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `orders_sys` */

DROP TABLE IF EXISTS `orders_sys`;

/*!50001 DROP VIEW IF EXISTS `orders_sys` */;
/*!50001 DROP TABLE IF EXISTS `orders_sys` */;

/*!50001 CREATE TABLE  `orders_sys`(
 `id` int(5) ,
 `order_date` datetime ,
 `customer_id` int(5) ,
 `customer_name` varchar(50) ,
 `contact_no` bigint(12) ,
 `email` varchar(50) ,
 `restaurant_id` int(5) ,
 `restaurant_name` varchar(50) ,
 `address` text ,
 `contact_number` varchar(12) ,
 `billed_amount` decimal(5,2) ,
 `taxes` decimal(5,2) ,
 `grand_total` int(5) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `order_details_sys` */

DROP TABLE IF EXISTS `order_details_sys`;

/*!50001 DROP VIEW IF EXISTS `order_details_sys` */;
/*!50001 DROP TABLE IF EXISTS `order_details_sys` */;

/*!50001 CREATE TABLE  `order_details_sys`(
 `id` int(5) ,
 `order_id` int(5) ,
 `order_date` datetime ,
 `menu_id` int(5) ,
 `item_name` varchar(50) ,
 `unit` decimal(5,0) ,
 `price` float ,
 `quantity` decimal(5,0) ,
 `total_amount` float ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `payments_sys` */

DROP TABLE IF EXISTS `payments_sys`;

/*!50001 DROP VIEW IF EXISTS `payments_sys` */;
/*!50001 DROP TABLE IF EXISTS `payments_sys` */;

/*!50001 CREATE TABLE  `payments_sys`(
 `id` int(5) ,
 `order_id` int(5) ,
 `order_date` datetime ,
 `amount` float ,
 `payment_method` varchar(50) ,
 `payment_date` date ,
 `transaction_method` varchar(50) ,
 `processed_by` int(11) ,
 `customer_id` int(5) ,
 `customer_name` varchar(50) ,
 `contact_no` bigint(12) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `restaurants_sys` */

DROP TABLE IF EXISTS `restaurants_sys`;

/*!50001 DROP VIEW IF EXISTS `restaurants_sys` */;
/*!50001 DROP TABLE IF EXISTS `restaurants_sys` */;

/*!50001 CREATE TABLE  `restaurants_sys`(
 `id` int(5) ,
 `restaurant_name` varchar(50) ,
 `address` text ,
 `pin_code` char(7) ,
 `contact_number` varchar(12) ,
 `email` varchar(50) ,
 `description` longtext ,
 `licence` char(15) ,
 `fssai_licence` char(15) ,
 `gst_no` char(15) ,
 `photo` varchar(100) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(6) ,
 `modified_by` int(6) 
)*/;

/*Table structure for table `roles_sys` */

DROP TABLE IF EXISTS `roles_sys`;

/*!50001 DROP VIEW IF EXISTS `roles_sys` */;
/*!50001 DROP TABLE IF EXISTS `roles_sys` */;

/*!50001 CREATE TABLE  `roles_sys`(
 `id` int(5) ,
 `name` varchar(50) ,
 `status` tinyint(1) ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*Table structure for table `users_sys` */

DROP TABLE IF EXISTS `users_sys`;

/*!50001 DROP VIEW IF EXISTS `users_sys` */;
/*!50001 DROP TABLE IF EXISTS `users_sys` */;

/*!50001 CREATE TABLE  `users_sys`(
 `id` int(5) ,
 `name` varchar(128) ,
 `email` varchar(128) ,
 `user_password` longtext ,
 `creation_time` datetime ,
 `modification_time` datetime ,
 `created_by` int(5) ,
 `modified_by` int(5) 
)*/;

/*View structure for view actions_sys */

/*!50001 DROP TABLE IF EXISTS `actions_sys` */;
/*!50001 DROP VIEW IF EXISTS `actions_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `actions_sys` AS select `actions`.`id` AS `id`,`actions`.`action_name` AS `action_name`,`actions`.`module_id` AS `module_id`,`modules`.`module_name` AS `module_name`,`actions`.`status` AS `status`,`actions`.`creation_time` AS `creation_time`,`actions`.`modification_time` AS `modification_time`,`actions`.`created_by` AS `created_by`,`actions`.`modified_by` AS `modified_by` from (`actions` left join `modules` on(`modules`.`id` = `actions`.`module_id`)) */;

/*View structure for view authorizations_sys */

/*!50001 DROP TABLE IF EXISTS `authorizations_sys` */;
/*!50001 DROP VIEW IF EXISTS `authorizations_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `authorizations_sys` AS select `authorizations`.`id` AS `id`,`authorizations`.`role_id` AS `role_id`,`roles`.`name` AS `name`,`authorizations`.`action_id` AS `action_id`,`actions`.`action_name` AS `action_name`,`actions`.`module_id` AS `module_id`,`modules`.`module_name` AS `module_name`,`authorizations`.`permission` AS `permission`,`authorizations`.`creation_time` AS `creation_time`,`authorizations`.`modification_time` AS `modification_time`,`authorizations`.`created_by` AS `created_by`,`authorizations`.`modified_by` AS `modified_by` from (((`authorizations` left join `roles` on(`roles`.`id` = `authorizations`.`role_id`)) left join `actions` on(`actions`.`id` = `authorizations`.`action_id`)) left join `modules` on(`modules`.`id` = `actions`.`module_id`)) */;

/*View structure for view cart_sys */

/*!50001 DROP TABLE IF EXISTS `cart_sys` */;
/*!50001 DROP VIEW IF EXISTS `cart_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `cart_sys` AS select `cart`.`id` AS `id`,`cart`.`user_id` AS `user_id`,`customers`.`customer_name` AS `customer_name`,`cart`.`food_item_id` AS `food_item_id`,`menu`.`item_name` AS `item_name`,`cart`.`date_time` AS `date_time`,`cart`.`status` AS `status` from ((`cart` left join `customers` on(`customers`.`id` = `cart`.`user_id`)) left join `menu` on(`menu`.`id` = `cart`.`food_item_id`)) */;

/*View structure for view customers_sys */

/*!50001 DROP TABLE IF EXISTS `customers_sys` */;
/*!50001 DROP VIEW IF EXISTS `customers_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `customers_sys` AS select `customers`.`id` AS `id`,`customers`.`customer_name` AS `customer_name`,`customers`.`contact_no` AS `contact_no`,`customers`.`email` AS `email`,`customers`.`password` AS `password`,`customers`.`dob` AS `dob`,`customers`.`gender` AS `gender`,`customers`.`address` AS `address`,`customers`.`photo` AS `photo`,`customers`.`creation_time` AS `creation_time`,`customers`.`modification_time` AS `modification_time`,`customers`.`created_by` AS `created_by`,`customers`.`modified_by` AS `modified_by` from `customers` */;

/*View structure for view customer_addresses_sys */

/*!50001 DROP TABLE IF EXISTS `customer_addresses_sys` */;
/*!50001 DROP VIEW IF EXISTS `customer_addresses_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `customer_addresses_sys` AS select `customer_addresses`.`id` AS `id`,`customer_addresses`.`customer_id` AS `customer_id`,`customers`.`customer_name` AS `customer_name`,`customers`.`email` AS `email`,`customers`.`contact_no` AS `contact_no`,`customers`.`dob` AS `dob`,`customers`.`gender` AS `gender`,`customer_addresses`.`address_type` AS `address_type`,`customer_addresses`.`address` AS `address` from (`customer_addresses` left join `customers` on(`customer_addresses`.`customer_id` = `customers`.`id`)) */;

/*View structure for view delivery_staffs_sys */

/*!50001 DROP TABLE IF EXISTS `delivery_staffs_sys` */;
/*!50001 DROP VIEW IF EXISTS `delivery_staffs_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `delivery_staffs_sys` AS select `delivery_staffs`.`id` AS `id`,`delivery_staffs`.`staff_name` AS `staff_name`,`delivery_staffs`.`role` AS `role`,`delivery_staffs`.`contact_no` AS `contact_no`,`delivery_staffs`.`email` AS `email`,`delivery_staffs`.`location` AS `location`,`delivery_staffs`.`creation_time` AS `creation_time`,`delivery_staffs`.`modification_time` AS `modification_time`,`delivery_staffs`.`created_by` AS `created_by`,`delivery_staffs`.`modified_by` AS `modified_by` from `delivery_staffs` */;

/*View structure for view menu_sys */

/*!50001 DROP TABLE IF EXISTS `menu_sys` */;
/*!50001 DROP VIEW IF EXISTS `menu_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `menu_sys` AS select `menu`.`id` AS `id`,`menu`.`item_name` AS `item_name`,`menu`.`price` AS `price`,`menu`.`half_price` AS `half_price`,`menu`.`description` AS `description`,`menu`.`photo` AS `photo`,`menu`.`restaurant_id` AS `restaurant_id`,`restaurants`.`restaurant_name` AS `restaurant_name`,`restaurants`.`address` AS `address`,`menu`.`creation_time` AS `creation_time`,`menu`.`modification_time` AS `modification_time`,`menu`.`created_by` AS `created_by`,`menu`.`modified_by` AS `modified_by` from (`menu` left join `restaurants` on(`restaurants`.`id` = `menu`.`restaurant_id`)) */;

/*View structure for view modules_sys */

/*!50001 DROP TABLE IF EXISTS `modules_sys` */;
/*!50001 DROP VIEW IF EXISTS `modules_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `modules_sys` AS select `modules`.`id` AS `id`,`modules`.`module_name` AS `module_name`,`modules`.`status` AS `status`,`modules`.`creation_time` AS `creation_time`,`modules`.`modification_time` AS `modification_time`,`modules`.`created_by` AS `created_by`,`modules`.`modified_by` AS `modified_by` from `modules` */;

/*View structure for view orders_sys */

/*!50001 DROP TABLE IF EXISTS `orders_sys` */;
/*!50001 DROP VIEW IF EXISTS `orders_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `orders_sys` AS select `orders`.`id` AS `id`,`orders`.`order_date` AS `order_date`,`orders`.`customer_id` AS `customer_id`,`customers`.`customer_name` AS `customer_name`,`customers`.`contact_no` AS `contact_no`,`customers`.`email` AS `email`,`orders`.`restaurant_id` AS `restaurant_id`,`restaurants`.`restaurant_name` AS `restaurant_name`,`restaurants`.`address` AS `address`,`restaurants`.`contact_number` AS `contact_number`,`orders`.`billed_amount` AS `billed_amount`,`orders`.`taxes` AS `taxes`,`orders`.`grand_total` AS `grand_total`,`orders`.`creation_time` AS `creation_time`,`orders`.`modification_time` AS `modification_time`,`orders`.`created_by` AS `created_by`,`orders`.`modified_by` AS `modified_by` from ((`orders` left join `customers` on(`customers`.`id` = `orders`.`customer_id`)) left join `restaurants` on(`restaurants`.`id` = `orders`.`restaurant_id`)) */;

/*View structure for view order_details_sys */

/*!50001 DROP TABLE IF EXISTS `order_details_sys` */;
/*!50001 DROP VIEW IF EXISTS `order_details_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `order_details_sys` AS select `order_details`.`id` AS `id`,`order_details`.`order_id` AS `order_id`,`orders`.`order_date` AS `order_date`,`order_details`.`menu_id` AS `menu_id`,`menu`.`item_name` AS `item_name`,`order_details`.`unit` AS `unit`,`order_details`.`price` AS `price`,`order_details`.`quantity` AS `quantity`,`order_details`.`total_amount` AS `total_amount`,`order_details`.`creation_time` AS `creation_time`,`order_details`.`modification_time` AS `modification_time`,`order_details`.`created_by` AS `created_by`,`order_details`.`modified_by` AS `modified_by` from ((`order_details` left join `orders` on(`orders`.`id` = `order_details`.`order_id`)) left join `menu` on(`menu`.`id` = `order_details`.`menu_id`)) */;

/*View structure for view payments_sys */

/*!50001 DROP TABLE IF EXISTS `payments_sys` */;
/*!50001 DROP VIEW IF EXISTS `payments_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `payments_sys` AS select `payments`.`id` AS `id`,`payments`.`order_id` AS `order_id`,`orders_sys`.`order_date` AS `order_date`,`payments`.`amount` AS `amount`,`payments`.`payment_method` AS `payment_method`,`payments`.`payment_date` AS `payment_date`,`payments`.`transaction_method` AS `transaction_method`,`payments`.`processed_by` AS `processed_by`,`orders_sys`.`customer_id` AS `customer_id`,`orders_sys`.`customer_name` AS `customer_name`,`orders_sys`.`contact_no` AS `contact_no`,`payments`.`creation_time` AS `creation_time`,`payments`.`modification_time` AS `modification_time`,`payments`.`created_by` AS `created_by`,`payments`.`modified_by` AS `modified_by` from (`payments` left join `orders_sys` on(`orders_sys`.`id` = `payments`.`order_id`)) */;

/*View structure for view restaurants_sys */

/*!50001 DROP TABLE IF EXISTS `restaurants_sys` */;
/*!50001 DROP VIEW IF EXISTS `restaurants_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `restaurants_sys` AS select `restaurants`.`id` AS `id`,`restaurants`.`restaurant_name` AS `restaurant_name`,`restaurants`.`address` AS `address`,`restaurants`.`pin_code` AS `pin_code`,`restaurants`.`contact_number` AS `contact_number`,`restaurants`.`email` AS `email`,`restaurants`.`description` AS `description`,`restaurants`.`licence` AS `licence`,`restaurants`.`fssai_licence` AS `fssai_licence`,`restaurants`.`gst_no` AS `gst_no`,`restaurants`.`photo` AS `photo`,`restaurants`.`creation_time` AS `creation_time`,`restaurants`.`modification_time` AS `modification_time`,`restaurants`.`created_by` AS `created_by`,`restaurants`.`modified_by` AS `modified_by` from `restaurants` */;

/*View structure for view roles_sys */

/*!50001 DROP TABLE IF EXISTS `roles_sys` */;
/*!50001 DROP VIEW IF EXISTS `roles_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `roles_sys` AS select `roles`.`id` AS `id`,`roles`.`name` AS `name`,`roles`.`status` AS `status`,`roles`.`creation_time` AS `creation_time`,`roles`.`modification_time` AS `modification_time`,`roles`.`created_by` AS `created_by`,`roles`.`modified_by` AS `modified_by` from `roles` */;

/*View structure for view users_sys */

/*!50001 DROP TABLE IF EXISTS `users_sys` */;
/*!50001 DROP VIEW IF EXISTS `users_sys` */;

/*!50001 CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `users_sys` AS select `users`.`id` AS `id`,`users`.`name` AS `name`,`users`.`email` AS `email`,`users`.`user_password` AS `user_password`,`users`.`creation_time` AS `creation_time`,`users`.`modification_time` AS `modification_time`,`users`.`created_by` AS `created_by`,`users`.`modified_by` AS `modified_by` from `users` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
