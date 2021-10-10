#cleansing
set foreign_key_checks = 0;

drop table if exists dasdeutschebistro.meal_categs;
drop table if exists dasdeutschebistro.meals;
drop table if exists dasdeutschebistro.orders;
drop table if exists dasdeutschebistro.cart_items;
drop table if exists dasdeutschebistro.carts;

drop table if exists dasdeutschebistro.users;
drop table if exists `dasdeutschebistro`.`currency_conversion`;
drop table if exists `dasdeutschebistro`.`currencies`;
drop table if exists dasdeutschebistro.ref_status;

#currencies
CREATE TABLE `dasdeutschebistro`.`currencies` (
  `cur_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Sequence ID of currency',
  `cur_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Full name of Currency',
  `cur_iso_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ISO Alpha3 code of currency',
  `created_by` int(11) NOT NULL DEFAULT '-7' COMMENT 'User who created the currency',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of currency creation',
  `updated_by` int(11) DEFAULT NULL COMMENT 'Last user who updated currency',
  `update_date` timestamp NULL DEFAULT NULL COMMENT 'Last update date',
  PRIMARY KEY (`cur_id`),
  UNIQUE KEY `cur_id` (`cur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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

#currency conversion
create table `dasdeutschebistro`.`currency_conversion` (
`cur_id_t` int(10) NOT NULL COMMENT 'Target Currency in Conversion',
`cur_id_b` int(10) NOT NULL COMMENT 'Base Currency in Conversion',
 `ccv_bdate` date  NOT NULL COMMENT 'Conversion Date',
 `ccv_rate` double not null comment 'Conversion Rate',
 `created_by` int(11) NOT NULL DEFAULT '-7' COMMENT 'User who created the rate',
 `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of rate creation',
 `updated_by` int(11) DEFAULT NULL COMMENT 'Last user who updated rate',
 `update_date` timestamp NULL DEFAULT NULL COMMENT 'Last update date',
  PRIMARY KEY (`cur_id_t`,`cur_id_b`,`ccv_bdate`),
  FOREIGN KEY (`cur_id_t`) references `dasdeutschebistro`.`currencies` (`cur_id`),
  FOREIGN KEY (`cur_id_b`) references `dasdeutschebistro`.`currencies` (`cur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#meal categ

create table dasdeutschebistro.meal_categs(
meal_categ_id int(3) not null AUTO_INCREMENT comment "ID of Categ",
meal_categ_name varchar(50) not null comment "Category name",
 created_by int(5) not null default -7,
  creation_date timestamp not null default current_timestamp,
  updated_by int(5) default NULL,
  update_date timestamp default NULL,
  primary key(meal_categ_id));
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

#meals

create table dasdeutschebistro.meals(
  meal_id int(10) not null AUTO_INCREMENT comment 'ID of meal',
  meal_name varchar(200) not null comment 'meal name',
  meal_desc varchar(1000) not null comment 'meal description',
  meal_price double not null comment 'meal price in LBP',
  meal_category int(3) not null comment 'Category of Meal',
  created_by int(5) not null default -7,
  creation_date timestamp not null default current_timestamp,
  updated_by int(5) default NULL,
  update_date timestamp default NULL,
  primary key (meal_id),
  foreign key(meal_category) references dasdeutschebistro.meal_categs(meal_categ_id)
);
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
  #status

  create table dasdeutschebistro.ref_status(
    status_id int(10) not null auto_increment,
    status_name varchar(100) not null,
    created_by int(5) not null default -7,
	creation_date timestamp not null default current_timestamp,
    updated_by int(5) default NULL,
	update_date timestamp default NULL,
  primary key (status_id)
  );
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

#users
create table dasdeutschebistro.users(
  user_id int(50) primary key auto_increment,
  user_login varchar(100) not null,
  user_password varchar(100) not null,
  user_fname varchar(50) not null,
  user_lname varchar(50) not null,
  user_dob date not null,
  user_currency int(10),
  foreign key(user_currency) references dasdeutschebistro.currencies(cur_id),
  created_by int(5) not null default -7,
  creation_date timestamp not null default current_timestamp,
  updated_by int(5) default NULL,
  update_date timestamp default NULL
);

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

#carts and orders

create table dasdeutschebistro.carts(
  cart_id int(50) not null auto_increment,
  user_id int(50) not null,
  cart_status int(10) not null,
  cart_date timestamp default current_timestamp,
  created_by int(5) ,
  creation_date timestamp not null default current_timestamp,
  updated_by int(5) default NULL,
  update_date timestamp default NULL,
  primary key(cart_id),
  foreign key(user_id) references dasdeutschebistro.users(user_id),
  foreign key(cart_status) references dasdeutschebistro.ref_status(status_id)
);
create table dasdeutschebistro.orders(
  order_id int(50) primary key auto_increment,
  order_date date not null,
  order_cart int(50),
  delivery_zip varchar(10),
  delivery_street varchar(100),
  delivery_city varchar(100),
  created_by int(5) ,
  creation_date timestamp not null default current_timestamp,
  updated_by int(5) default NULL,
  update_date timestamp default NULL,
  foreign key (order_cart) references dasdeutschebistro.carts(cart_id)
);
create table dasdeutschebistro.cart_items(
cart_item_id int(50) primary key auto_increment,
cart_id int(50),
meal_id int(10),
meal_qty int(10),
created_by int(5) ,
  creation_date timestamp not null default current_timestamp,
  updated_by int(5) default NULL,
  update_date timestamp default NULL,
foreign key (cart_id) references dasdeutschebistro.carts(cart_id),
foreign key (meal_id) references dasdeutschebistro.meals(meal_id)
);

set foreign_key_checks = 1;
