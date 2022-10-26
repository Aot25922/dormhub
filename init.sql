-- DROP SCHEMA IF EXISTS `int365_dormhub` ;
-- CREATE SCHEMA IF NOT EXISTS `int365_dormhub` DEFAULT CHARACTER SET utf8 ;
START TRANSACTION;

USE int365_dormhub;
DROP TABLE IF EXISTS `media`;
DROP TABLE IF EXISTS `booking`;
DROP TABLE IF EXISTS `room`;
DROP TABLE IF EXISTS `dormHasRoomType`;
DROP TABLE IF EXISTS `roomType`;
DROP TABLE IF EXISTS `bankAccount`;
DROP TABLE IF EXISTS `bank`;
DROP TABLE IF EXISTS `dorm`;
DROP TABLE IF EXISTS `userAccount`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `subDistricts`;
DROP TABLE IF EXISTS `districts`;
DROP TABLE IF EXISTS `provinces`;
DROP TABLE IF EXISTS `geographies`;

CREATE TABLE IF NOT EXISTS `geographies` (
	id 			INT 			NOT NULL AUTO_INCREMENT,
	name 		VARCHAR(255) 	NOT NULL,
   CONSTRAINT geographies_id_pk PRIMARY KEY ( id )
);

CREATE TABLE IF NOT EXISTS `provinces` (
	id 				INT 			NOT NULL AUTO_INCREMENT,
	code 			INT 			NOT NULL,
	name_th 		VARCHAR(150) 	NOT NULL,
	name_en 		VARCHAR(150) 	NOT NULL,
	img				VARCHAR(1000), 
	geography_id 	INT 			NOT NULL,
  CONSTRAINT provinces_id_pk PRIMARY KEY ( id ),
  CONSTRAINT geography_id_fk FOREIGN KEY ( geography_id ) REFERENCES `geographies` ( id )
);

CREATE TABLE IF NOT EXISTS `districts` (
	id 				INT 			NOT NULL AUTO_INCREMENT,
	code 			INT				NOT NULL,
	name_th 		VARCHAR(150)	NOT NULL,
	name_en 		VARCHAR(150)	NOT NULL,
	province_id	 	INT				NOT NULL,
  CONSTRAINT districts_id_pk PRIMARY KEY ( id ),
  CONSTRAINT province_id_fk FOREIGN KEY ( province_id ) REFERENCES `provinces` ( id )
);

CREATE TABLE IF NOT EXISTS `subDistricts` (
	id 				INT				NOT NULL AUTO_INCREMENT,
	zip_code 		INT 			NOT NULL,
	name_th 		VARCHAR(150)	NOT NULL,
	name_en 		VARCHAR(150)	NOT NULL,
	districts_id 	INT 			NOT NULL,
  CONSTRAINT subDistricts_id_pk PRIMARY KEY ( id ),
  CONSTRAINT districts_id_fk FOREIGN KEY ( districts_id ) REFERENCES `districts` ( id )
);

CREATE TABLE `address` (
	id				INT					NOT NULL AUTO_INCREMENT,
    number			VARCHAR(20)			NOT NULL,
    street			VARCHAR(30)			NOT NULL,
    alley			VARCHAR(50),
    subDistrict_id	INT					NOT NULL,
    CONSTRAINT address_id_pk PRIMARY KEY ( id ),
    CONSTRAINT subDistrict_id_fk FOREIGN KEY ( subDistrict_id ) REFERENCES `subDistricts` ( id )
);


-- CREATE TABLE `address` (
-- 	addressId		INT					NOT NULL AUTO_INCREMENT,
--     number			VARCHAR(20)			NOT NULL,
--     street			VARCHAR(30)			NOT NULL,
--     alley			VARCHAR(50),
--     subDistrict		VARCHAR(50)			NOT NULL,
--     district		VARCHAR(50)			NOT NULL,
--     province		VARCHAR(50)			NOT NULL,
--     region			VARCHAR(50)			NOT NULL,
--     zipcode			CHAR(5)				NOT NULL,
--     CONSTRAINT addressId_pk PRIMARY KEY ( addressId )
-- );

CREATE TABLE `userAccount` (
	userId			INT					NOT NULL AUTO_INCREMENT,
	email			VARCHAR(50)			NOT NULL,
    password		VARCHAR(100)		NOT NULL,
    fname			VARCHAR(50)			NOT NULL,
    lname			VARCHAR(50)			NOT NULL,
    sex				VARCHAR(20)			NOT NULL,
    phone			CHAR(10)			NOT NULL,
    role			VARCHAR(20)			NOT NULL,
    CONSTRAINT userId_pk PRIMARY KEY ( userId ),
    CONSTRAINT contact_uc UNIQUE (phone, email)
);

CREATE TABLE `dorm` (
	dormId			INT					NOT NULL AUTO_INCREMENT,
	name			VARCHAR(50)			NOT NULL,
    openTime		VARCHAR(10),
    closeTime 		VARCHAR(10),
    description 	VARCHAR(200),
    rating			DECIMAL(3, 2)		NOT NULL,
    acceptPercent	DECIMAL(5, 2)		NOT NULL,
    elecPerUnit		DECIMAL(3, 2)		NOT NULL,
    waterPerUnit	DECIMAL(3, 2)		NOT NULL,
    addressId		INT					NOT NULL,
    ownerId			INT					NOT NULL,
    CONSTRAINT dorm_pk PRIMARY KEY ( dormId, addressId ),
	CONSTRAINT addressId_dorm_fk FOREIGN KEY ( addressId ) REFERENCES `address` ( id ),
    CONSTRAINT ownerId_fk FOREIGN KEY ( ownerId ) REFERENCES `userAccount` ( userId )
);

CREATE TABLE `bank` (
	bankId			INT					NOT NULL AUTO_INCREMENT,
    name			VARCHAR(30)			NOT NULL,
    logo			VARCHAR(1000)		NOT NULL,
    CONSTRAINT bankId PRIMARY KEY ( bankId )
);

CREATE TABLE `bankAccount` (
	bankAccId		INT					NOT NULL AUTO_INCREMENT,
    accountNum		CHAR(10)			NOT NULL,
    accountName		VARCHAR(50)			NOT NULL,
    qrCode			VARCHAR(1000),
    dormId			INT					NOT NULL,
    bankId			INT					NOT NULL,
    CONSTRAINT bankId PRIMARY KEY ( bankAccId ),
    CONSTRAINT dormId_bankAcc_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT bankId_fk FOREIGN KEY ( bankId ) REFERENCES `bank` ( bankId )
);

CREATE TABLE `roomType` (
	roomTypeId		INT					NOT NULL AUTO_INCREMENT,
    type			VARCHAR(50)			NOT NULL,
    description		VARCHAR(200),
    CONSTRAINT roomTypeId_pk PRIMARY KEY ( roomTypeId )
);

CREATE TABLE `dormHasRoomType` (
	dormId			INT					NOT NULL AUTO_INCREMENT,
    roomTypeId		INT					NOT NULL,
	price			INT					NOT NULL,
	area			DECIMAL(5, 2)		NOT NULL,
	deposit			INT					NOT NULL,
    CONSTRAINT dormRoomType_pk PRIMARY KEY ( dormId, roomTypeId ),
    CONSTRAINT dormId_dormRoomType_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_dormRoomType_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);

CREATE TABLE `room` (
	roomId			INT					NOT NULL AUTO_INCREMENT,
    roomNum			VARCHAR(50)			NOT NULL,
    status			VARCHAR(50)			NOT NULL,
    floors			INT					NOT NULL,
    description		VARCHAR(200),
    dormId			INT					NOT NULL,
    roomTypeId		INT					NOT NULL,
    CONSTRAINT roomId_pk PRIMARY KEY ( roomId ),
    CONSTRAINT dormId_room_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_room_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);

CREATE TABLE `booking` (
	bookingId		INT					NOT NULL AUTO_INCREMENT,
	payDate			VARCHAR(50)			NOT NULL,
    startDate		VARCHAR(50)			NOT NULL,
    endDate			VARCHAR(50)			NOT NULL,
    status			VARCHAR(50)			NOT NULL,
    description		VARCHAR(120),
    moneySlip		VARCHAR(1000)		NOT NULL,
    userId			INT					NOT NULL,
    bankAccId		INT					NOT NULL,
    roomId			INT					NOT NULL,
    CONSTRAINT bookingId_pk PRIMARY KEY ( bookingId ),
    CONSTRAINT userId_fk FOREIGN KEY ( userId ) REFERENCES `userAccount` ( userId ),
    CONSTRAINT bankAccId_fk FOREIGN KEY ( bankAccId ) REFERENCES `bankAccount` ( bankAccId ),
    CONSTRAINT roomId_fk FOREIGN KEY ( roomId ) REFERENCES `room` ( roomId )
);

CREATE TABLE `media` (
	mediaId			INT					NOT NULL AUTO_INCREMENT,
	path			VARCHAR(1000)		NOT NULL,
    name			VARCHAR(50),
    dormId			INT					NOT NULL,
    roomTypeId		INT,
    CONSTRAINT mediaId_pk PRIMARY KEY ( mediaId ),
    CONSTRAINT dormId_md_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_md_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);

COMMIT;