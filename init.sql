DROP SCHEMA IF EXISTS `int365_dormhub` ;
CREATE SCHEMA IF NOT EXISTS `int365_dormhub` DEFAULT CHARACTER SET utf8 ;
USE int365_dormhub;
DROP TABLE IF EXISTS `media`;
DROP TABLE IF EXISTS `roomFacility`;
DROP TABLE IF EXISTS `facility`;
DROP TABLE IF EXISTS `booking`;
DROP TABLE IF EXISTS `room`;
DROP TABLE IF EXISTS `dormHasRoomType`;
DROP TABLE IF EXISTS `roomType`;
DROP TABLE IF EXISTS `bankAccount`;
DROP TABLE IF EXISTS `bank`;
DROP TABLE IF EXISTS `dormHasOwner`;
DROP TABLE IF EXISTS `dorm`;
DROP TABLE IF EXISTS `userAccount`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `subDistrict`;
DROP TABLE IF EXISTS `district`;
DROP TABLE IF EXISTS `province`;
DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
	regionId		INT					NOT NULL AUTO_INCREMENT,
    name			VARCHAR(50)			NOT NULL,
    CONSTRAINT regionId_pk PRIMARY KEY ( regionId )
);

CREATE TABLE `province` (
    provinceId		INT					NOT NULL AUTO_INCREMENT,
    name			VARCHAR(50)			NOT NULL,
    img				VARCHAR(1000)		NOT NULL,
    regionId		INT					NOT NULL,
    CONSTRAINT provinceId_pk PRIMARY KEY ( provinceId ),
    CONSTRAINT regionId_fk FOREIGN KEY ( regionId ) REFERENCES `region` ( regionId )
);

CREATE TABLE `district` (
    districtId		INT					NOT NULL AUTO_INCREMENT,
    name			VARCHAR(50)			NOT NULL,
    provinceId		INT					NOT NULL,
    CONSTRAINT districtId_pk PRIMARY KEY ( districtId ),
    CONSTRAINT provinceId_fk FOREIGN KEY ( provinceId ) REFERENCES `province` ( provinceId )
);

CREATE TABLE `subDistrict` (
    subDistrictId	INT					NOT NULL AUTO_INCREMENT,
    name			VARCHAR(50)			NOT NULL,
	zipCodeId		CHAR(5)				NOT NULL,
    districtId		INT					NOT NULL,
    CONSTRAINT subDistrictId_pk PRIMARY KEY ( subDistrictId ),
    CONSTRAINT districtId_fk FOREIGN KEY ( districtId ) REFERENCES `district` ( districtId )
);

CREATE TABLE `address` (
	addressId		INT					NOT NULL AUTO_INCREMENT,
    number			VARCHAR(20)			NOT NULL,
    street			VARCHAR(30)			NOT NULL,
    alley			VARCHAR(50),
    subDistrictId	INT					NOT NULL,
    CONSTRAINT addressId_pk PRIMARY KEY ( addressId ),
    CONSTRAINT subDistrictId_addr_fk FOREIGN KEY ( subDistrictId ) REFERENCES `subDistrict` ( subDistrictId )
);

CREATE TABLE `userAccount` (
	userId			INT					NOT NULL AUTO_INCREMENT,
	email			VARCHAR(50)			NOT NULL,
    password		VARCHAR(100)		NOT NULL,
    fname			VARCHAR(50)			NOT NULL,
    lname			VARCHAR(50)			NOT NULL,
    sex				VARCHAR(20)			NOT NULL,
    phone			CHAR(10)			NOT NULL,
    role			VARCHAR(20)			NOT NULL,
    addressId		INT,
    CONSTRAINT userId_pk PRIMARY KEY ( userId ),
    CONSTRAINT contact_uc UNIQUE (phone, email),
    CONSTRAINT addressId_user_fk FOREIGN KEY ( addressId ) REFERENCES `address` ( addressId )
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
    CONSTRAINT dorm_pk PRIMARY KEY ( dormId, addressId ),
	CONSTRAINT addressId_dorm_fk FOREIGN KEY ( addressId ) REFERENCES `address` ( addressId )
);

CREATE TABLE `dormHasOwner` (
	dormId			INT					NOT NULL,
    ownerId			INT					NOT NULl,
    CONSTRAINT dormId_owner_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
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
    status			VARCHAR(10)			NOT NULL,
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
    fname			VARCHAR(50)			NOT NULL,
    lname			VARCHAR(50)			NOT NULL,
    phone			CHAR(10)			NOT NULL,
	payDate			DATETIME			NOT NULL,
    startDate		DATETIME			NOT NULL,
    endDate			DATETIME			NOT NULL,
    status			VARCHAR(10)			NOT NULL,
    deposit			INT					NOT NULL,
    description		VARCHAR(120),
    userId			INT,
    bankAccId		INT					NOT NULL,
    roomId			INT					NOT NULL,
    CONSTRAINT bookingId_pk PRIMARY KEY ( bookingId ),
    CONSTRAINT userId_fk FOREIGN KEY ( userId ) REFERENCES `userAccount` ( userId ),
    CONSTRAINT bankAccId_fk FOREIGN KEY ( bankAccId ) REFERENCES `bankAccount` ( bankAccId ),
    CONSTRAINT roomId_fk FOREIGN KEY ( roomId ) REFERENCES `room` ( roomId )
);

CREATE TABLE `facility` (
	facilityId		INT					NOT NULL AUTO_INCREMENT,
    name			VARCHAR(50)			NOT NULL,
    description		VARCHAR(200),
    CONSTRAINT detailId_pk PRIMARY KEY ( facilityId )
);

CREATE TABLE `roomFacility` (
	roomTypeId		INT					NOT NULL,
    facilityId		INT					NOT NULL,
    CONSTRAINT roomTypeId_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId ),
    CONSTRAINT facilityId_fk FOREIGN KEY ( facilityId ) REFERENCES `facility` ( facilityId )
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
