-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dasdeutschebistro
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dasdeutschebistro` ;

-- -----------------------------------------------------
-- Schema dasdeutschebistro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dasdeutschebistro` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `dasdeutschebistro` ;

USE `dasdeutschebistro` ;

-- -----------------------------------------------------
-- function initcap
-- -----------------------------------------------------

USE `dasdeutschebistro`;
DROP function IF EXISTS `dasdeutschebistro`.`initcap`;

DELIMITER $$
USE `dasdeutschebistro`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `initcap`(input VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
BEGIN
	DECLARE len INT;
	DECLARE i INT;

	SET len   = CHAR_LENGTH(input);
	SET input = LOWER(input);
	SET i = 0;

	WHILE (i < len) DO
		IF (MID(input,i,1) = ' ' OR i = 0) THEN
			IF (i < len) THEN
				SET input = CONCAT(
					LEFT(input,i),
					UPPER(MID(input,i + 1,1)),
					RIGHT(input,len - i - 1)
				);
			END IF;
		END IF;
		SET i = i + 1;
	END WHILE;

	RETURN input;
    END$$

DELIMITER ;

-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`currencies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`currencies` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`currencies` (
  `cur_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'Sequence ID of currency',
  `cur_name` VARCHAR(200) NOT NULL COMMENT 'Full name of Currency',
  `cur_iso_code` VARCHAR(3) NOT NULL COMMENT 'ISO Alpha3 code of currency',
  `created_by` INT(11) NOT NULL DEFAULT '-7' COMMENT 'User who created the currency',
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of currency creation',
  `updated_by` INT(11) NULL DEFAULT NULL COMMENT 'Last user who updated currency',
  `update_date` TIMESTAMP NULL DEFAULT NULL COMMENT 'Last update date',
  PRIMARY KEY (`cur_id`),
  UNIQUE INDEX `cur_id` (`cur_id` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('UAE Dirham', 'AED');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Afghani', 'AFN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Lek', 'ALL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Armenian Dram', 'AMD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Netherlands Antillian Guilder', 'ANG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kwanza', 'AOA');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Argentine Peso', 'ARS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Austrian schilling', 'ATS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Australian Dollar', 'AUD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Aruban Guilder', 'AWG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Azerbaijanian Manat', 'AZN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Convertible Marks', 'BAM');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Barbados Dollar', 'BBD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Taka', 'BDT');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Belgian franc', 'BEF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Bulgarian Lev', 'BGN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Bahraini Dinar', 'BHD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Burundi Franc', 'BIF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Bermudian Dollar (customarily known as Bermuda Dollar)', 'BMD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Brunei Dollar', 'BND');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Boliviano', 'BOB');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Mvdol', 'BOV');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Brazilian Real', 'BRL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Bahamian Dollar', 'BSD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Ngultrum', 'BTN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Pula', 'BWP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Belarussian Ruble', 'BYR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Belize Dollar', 'BZD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Canadian Dollar', 'CAD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Congolese Franc', 'CDF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('WIR Euro', 'CHE');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Swiss Franc', 'CHF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('WIR Franc', 'CHW');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Unidades de fomento', 'CLF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Chilean Peso', 'CLP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Yuan Renminbi', 'CNY');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Colombian Peso', 'COP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Unidad de Valor Real', 'COU');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Costa Rican Colon', 'CRC');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Peso Convertible', 'CUC');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Cuban Peso', 'CUP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Cape Verde Escudo', 'CVE');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Cypriot pound', 'CYP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Czech Koruna', 'CZK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('German mark', 'DEM');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Djibouti Franc', 'DJF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Danish Krone', 'DKK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Dominican Peso', 'DOP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Algerian Dinar', 'DZD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kroon', 'EEK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Egyptian Pound', 'EGP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Nakfa', 'ERN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Spanish peseta', 'ESP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Ethiopian Birr', 'ETB');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Euro', 'EUR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Finnish markka', 'FIM');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Fiji Dollar', 'FJD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Falkland Islands Pound', 'FKP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('French franc', 'FRF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Pound Sterling', 'GBP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Lari', 'GEL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Cedi', 'GHS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Gibraltar Pound', 'GIP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Dalasi', 'GMD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Guinea Franc', 'GNF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Greek drachma', 'GRD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Quetzal', 'GTQ');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Guinea-Bissau Peso', 'GWP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Guyana Dollar', 'GYD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Hong Kong Dollar', 'HKD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Lempira', 'HNL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Croatian Kuna', 'HRK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Gourde', 'HTG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Forint', 'HUF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Rupiah', 'IDR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Irish pound', 'IEP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('New Israeli Sheqel', 'ILS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Indian Rupee', 'INR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Iraqi Dinar', 'IQD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Iranian Rial', 'IRR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Iceland Krona', 'ISK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Italian lira', 'ITL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Jamaican Dollar', 'JMD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Jordanian Dinar', 'JOD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Yen', 'JPY');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kenyan Shilling', 'KES');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Som', 'KGS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Riel', 'KHR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Comoro Franc', 'KMF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('North Korean Won', 'KPW');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Won', 'KRW');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kuwaiti Dinar', 'KWD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Cayman Islands Dollar', 'KYD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Tenge', 'KZT');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kip', 'LAK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Lebanese Pound', 'LBP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Sri Lanka Rupee', 'LKR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Liberian Dollar', 'LRD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Loti', 'LSL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Lithuanian Litas', 'LTL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Luxembourg franc', 'LUF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Latvian Lats', 'LVL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Libyan Dinar', 'LYD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Moroccan Dirham', 'MAD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Moldovan Leu', 'MDL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Malagasy Ariary', 'MGA');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Denar', 'MKD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kyat', 'MMK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Tugrik', 'MNT');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Pataca', 'MOP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Ouguiya', 'MRO');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Maltese lira', 'MTL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Mauritius Rupee', 'MUR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Rufiyaa', 'MVR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kwacha', 'MWK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Mexican Peso', 'MXN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Mexican Unidad de Inversion (UDI)', 'MXV');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Malaysian Ringgit', 'MYR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Metical', 'MZN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Namibia Dollar', 'NAD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Naira', 'NGN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Cordoba Oro', 'NIO');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Dutch guilder', 'NLG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Norwegian Krone', 'NOK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Nepalese Rupee', 'NPR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('New Zealand Dollar', 'NZD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Rial Omani', 'OMR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Balboa', 'PAB');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Nuevo Sol', 'PEN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Kina', 'PGK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Philippine Peso', 'PHP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Pakistan Rupee', 'PKR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Zloty', 'PLN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Portuguese escudo', 'PTE');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Guarani', 'PYG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Qatari Rial', 'QAR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('New Leu', 'RON');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Serbian Dinar', 'RSD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Russian Ruble', 'RUB');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Rwanda Franc', 'RWF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Saudi Riyal', 'SAR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Solomon Islands Dollar', 'SBD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Seychelles Rupee', 'SCR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Sudanese Pound', 'SDG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Swedish Krona', 'SEK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Singapore Dollar', 'SGD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Saint Helena Pound', 'SHP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Slovak koruna', 'SKK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Leone', 'SLL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Somali Shilling', 'SOS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Surinam Dollar', 'SRD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Dobra', 'STD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('El Salvador Colon', 'SVC');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Syrian Pound', 'SYP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Lilangeni', 'SZL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Baht', 'THB');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Somoni', 'TJS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Turkmenistani manat', 'TMM');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Manat', 'TMT');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Tunisian Dinar', 'TND');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Pa''anga', 'TOP');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Turkish lira A/05', 'TRL');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Turkish Lira', 'TRY');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Trinidad and Tobago Dollar', 'TTD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('New Taiwan Dollar', 'TWD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Tanzanian Shilling', 'TZS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Hryvnia', 'UAH');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Uganda Shilling', 'UGX');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('US Dollar', 'USD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('US Dollar (Next day)', 'USN');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('US Dollar (Same day)', 'USS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Uruguay Peso en Unidades Indexadas', 'UYI');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Peso Uruguayo', 'UYU');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Uzbekistan Sum', 'UZS');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Bolivar Fuerte', 'VEF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Dong', 'VND');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Vatu', 'VUV');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Tala', 'WST');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('CFA Franc BEAC ‡', 'XAF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Silver', 'XAG');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Gold', 'XAU');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Bond Markets Units European Composite Unit (EURCO)', 'XBA');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('European Monetary Unit (E.M.U.-6)', 'XBB');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('European Unit of Account 9(E.U.A.-9)', 'XBC');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('European Unit of Account 17(E.U.A.-17)', 'XBD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('East Caribbean Dollar', 'XCD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('SDR', 'XDR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('UIC-Franc', 'XFU');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('CFA Franc BCEAO †', 'XOF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Palladium', 'XPD');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('CFP Franc', 'XPF');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Platinum', 'XPT');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Yemeni Rial', 'YER');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Yugoslav dinar A/2003', 'YUM');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Rand', 'ZAR');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Zambian Kwacha', 'ZMK');
insert into `dasdeutschebistro`.`currencies` (CUR_NAME, CUR_ISO_CODE)
values ('Zimbabwe Dollar', 'ZWL');
update `dasdeutschebistro`.`currencies` a set a.cur_name = `dasdeutschebistro`.initcap(a.cur_name);
commit;

-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`currency_conversion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`currency_conversion` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`currency_conversion` (
  `cur_id_t` INT(10) NOT NULL COMMENT 'Target Currency in Conversion',
  `cur_id_b` INT(10) NOT NULL COMMENT 'Base Currency in Conversion',
  `ccv_bdate` DATE NOT NULL COMMENT 'Conversion Date',
  `ccv_rate` DOUBLE NOT NULL COMMENT 'Conversion Rate',
  `created_by` INT(11) NOT NULL DEFAULT '-7' COMMENT 'User who created the rate',
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of rate creation',
  `updated_by` INT(11) NULL DEFAULT NULL COMMENT 'Last user who updated rate',
  `update_date` TIMESTAMP NULL DEFAULT NULL COMMENT 'Last update date',
  PRIMARY KEY (`cur_id_t`, `cur_id_b`, `ccv_bdate`),
  INDEX `cur_id_b` (`cur_id_b` ASC),
  CONSTRAINT `currency_conversion_ibfk_1`
    FOREIGN KEY (`cur_id_t`)
    REFERENCES `dasdeutschebistro`.`currencies` (`cur_id`),
  CONSTRAINT `currency_conversion_ibfk_2`
    FOREIGN KEY (`cur_id_b`)
    REFERENCES `dasdeutschebistro`.`currencies` (`cur_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`users` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`users` (
  `user_id` INT(50) NOT NULL AUTO_INCREMENT,
  `user_login` VARCHAR(100) NOT NULL,
  `user_password` VARCHAR(100) NOT NULL,
  `user_fname` VARCHAR(50) NOT NULL,
  `user_lname` VARCHAR(50) NOT NULL,
  `user_dob` DATE NOT NULL,
  `user_currency` INT(10) NULL DEFAULT NULL,
  `created_by` INT(5) NOT NULL DEFAULT '-7',
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_currency` (`user_currency` ASC),
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`user_currency`)
    REFERENCES `dasdeutschebistro`.`currencies` (`cur_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into dasdeutschebistro.users(
  user_login,
  user_password,
  user_fname,
  user_lname,
  user_dob,
  user_currency
)
select 'RM97','testpass','Rabih','Melko', '1997-09-07', c.cur_id
  from dasdeutschebistro.currencies c
where c.cur_iso_code = 'LBP';
commit;


-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`ref_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`ref_status` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`ref_status` (
  `status_id` INT(10) NOT NULL AUTO_INCREMENT,
  `status_name` VARCHAR(100) NOT NULL,
  `created_by` INT(5) NOT NULL DEFAULT '-7',
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

  insert into dasdeutschebistro.ref_status(status_name) 
select "Active" 
  from dual 
  union 
select "Processed" 
  from dual
  union
  select "Deleted" 
  from dual ;
commit;


-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`carts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`carts` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`carts` (
  `cart_id` INT(50) NOT NULL AUTO_INCREMENT,
  `user_id` INT(50) NOT NULL,
  `cart_status` INT(10) NOT NULL,
  `cart_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` INT(5) NULL DEFAULT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `user_id` (`user_id` ASC),
  INDEX `cart_status` (`cart_status` ASC),
  CONSTRAINT `carts_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `dasdeutschebistro`.`users` (`user_id`),
  CONSTRAINT `carts_ibfk_2`
    FOREIGN KEY (`cart_status`)
    REFERENCES `dasdeutschebistro`.`ref_status` (`status_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;



-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`meal_categs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`meal_categs` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`meal_categs` (
  `meal_categ_id` INT(3) NOT NULL AUTO_INCREMENT COMMENT 'ID of Categ',
  `meal_categ_name` VARCHAR(50) NOT NULL COMMENT 'Category name',
  `created_by` INT(5) NOT NULL DEFAULT '-7',
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`meal_categ_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into dasdeutschebistro.meal_categs(meal_categ_name) 
select "Appetizers" 
  from dual 
  union 
select "Salads" 
  from dual
  union
  select "Burgers" 
  from dual 
  union
  select "Platters" 
  from dual 
  union
  select "Drinks" 
  from dual 
  union
  select "Desserts" 
  from dual;
commit;


-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`meals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`meals` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`meals` (
  `meal_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'ID of meal',
  `meal_name` VARCHAR(200) NOT NULL COMMENT 'meal name',
  `meal_desc` VARCHAR(1000) NOT NULL COMMENT 'meal description',
  `meal_price` DOUBLE NOT NULL COMMENT 'meal price in LBP',
  `meal_category` INT(3) NOT NULL COMMENT 'Category of Meal',
  `created_by` INT(5) NOT NULL DEFAULT '-7',
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`meal_id`),
  INDEX `meal_category` (`meal_category` ASC),
  CONSTRAINT `meals_ibfk_1`
    FOREIGN KEY (`meal_category`)
    REFERENCES `dasdeutschebistro`.`meal_categs` (`meal_categ_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Belgische Pommes (Frites Belges)',"Assortiment de Pommes de Terre Idaho, russet et Yukon Gold baignées dans de l'huile de Canola et assaisonnées avec du paprika Hongrois et du sel marin et accompagnées d'une sauce maison",34000,1);
insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Deustcher Schweineschnitzel (Schnitzel de porc Allemand)',"4 côtelettes de porc assaisonnées avec du poivre noir et du sel marin, baignées dans de l'huile à goût neutre et accompagnées d'une Spaetzle maison",69000,4);
insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Deutscher Frikadellen (Burger Allemand)',"LA recette traditionnelle du burger: mixture de viande de boeuf et de porc assaisonée avec des oignons, du persil, paprika, sel et poivre noir. Servie dans un Kaiser Roll accompagnées de Belgische Pommes",89000,3);
insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Ofenkartoffel (Pomme de terre cuite)',"Pomme de Terre cuite sur charbon, assaisonée et personnalisable",45000,1);
insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Käsespätzle',"Couches de Spätzle avec du fromage râpé еt onions frits. Servies avec une sauce à base de pomme",53000,1);
insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Currywurst',"Le met d'excellence des rues de Berlin. Saucisses hâchées, Belgische Pommes et une sauce ketchup épicée",47000,1);
  insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Rouladen',"Le plat de célebrations familiales. Cornichons et bacon roulés dans de fines tranches de boeuf. Servies avec une sauce maison, boulettes, purée de pommes de terre et choux",91000,4);
  insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Eintopf',"Sauce, pommes de terre, assortiment de légumes et viande. Servie mit Brot",38000,4);
insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Sauerbraten',"Viande de boeuf ou de porc mariné durant 3 semaines dans une sauce sucrée et amère, rotie sur feu de bois",120000,4);
  insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Brezel (Pretzel)',"Long rouleau de pâte nouée, boullie puis cuite. Parfumée au choix de sel, grains ou fromage et servie avec une sauce moutarde douce",14000,1);
  insert into dasdeutschebistro.meals(meal_name, meal_desc, meal_price, meal_category)
  values('Schwarzwälder Kirschtorte (Forêt Noire)',"Gateau spongieux comprenant cerises, crème fraiche et confiture",31000,6);
  commit;


-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`cart_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`cart_items` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`cart_items` (
  `cart_item_id` INT(50) NOT NULL AUTO_INCREMENT,
  `cart_id` INT(50) NULL DEFAULT NULL,
  `meal_id` INT(10) NULL DEFAULT NULL,
  `meal_qty` INT(10) NULL DEFAULT NULL,
  `created_by` INT(5) NULL DEFAULT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  INDEX `cart_id` (`cart_id` ASC),
  INDEX `meal_id` (`meal_id` ASC),
  CONSTRAINT `cart_items_ibfk_1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `dasdeutschebistro`.`carts` (`cart_id`),
  CONSTRAINT `cart_items_ibfk_2`
    FOREIGN KEY (`meal_id`)
    REFERENCES `dasdeutschebistro`.`meals` (`meal_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;




-- -----------------------------------------------------
-- Table `dasdeutschebistro`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dasdeutschebistro`.`orders` ;

CREATE TABLE IF NOT EXISTS `dasdeutschebistro`.`orders` (
  `order_id` INT(50) NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `order_cart` INT(50) NULL DEFAULT NULL,
  `delivery_zip` VARCHAR(10) NULL DEFAULT NULL,
  `delivery_street` VARCHAR(100) NULL DEFAULT NULL,
  `delivery_city` VARCHAR(100) NULL DEFAULT NULL,
  `created_by` INT(5) NULL DEFAULT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT(5) NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `order_cart` (`order_cart` ASC),
  CONSTRAINT `orders_ibfk_1`
    FOREIGN KEY (`order_cart`)
    REFERENCES `dasdeutschebistro`.`carts` (`cart_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

USE `dasdeutschebistro` ;

-- -----------------------------------------------------
-- function initcap
-- -----------------------------------------------------

USE `dasdeutschebistro`;
DROP function IF EXISTS `dasdeutschebistro`.`initcap`;

DELIMITER $$
USE `dasdeutschebistro`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `initcap`(input VARCHAR(255)) RETURNS varchar(255) CHARSET latin1
BEGIN
	DECLARE len INT;
	DECLARE i INT;

	SET len   = CHAR_LENGTH(input);
	SET input = LOWER(input);
	SET i = 0;

	WHILE (i < len) DO
		IF (MID(input,i,1) = ' ' OR i = 0) THEN
			IF (i < len) THEN
				SET input = CONCAT(
					LEFT(input,i),
					UPPER(MID(input,i + 1,1)),
					RIGHT(input,len - i - 1)
				);
			END IF;
		END IF;
		SET i = i + 1;
	END WHILE;

	RETURN input;
    END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
