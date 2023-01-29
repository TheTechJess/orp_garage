-- Owned Vehicles:
ALTER TABLE `owned_vehicles`
ADD `model` varchar(60) NOT NULL,
ADD `date` varchar(255) DEFAULT NULL AFTER `model`,
ADD `paidprice` int(11) NOT NULL DEFAULT '0' AFTER `date`,
ADD `finance` longtext DEFAULT NULL AFTER `paidprice`;