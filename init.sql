DROP SCHEMA IF EXISTS `int365_dormhub` ;
CREATE SCHEMA IF NOT EXISTS `int365_dormhub` DEFAULT CHARACTER SET utf8 ;
USE int365_dormhub;
DROP TABLE IF EXISTS `media`;
DROP TABLE IF EXISTS `roomFacility`;
DROP TABLE IF EXISTS `facility`;
DROP TABLE IF EXISTS `room`;
DROP TABLE IF EXISTS `dormHasRoomType`;
DROP TABLE IF EXISTS `roomType`;
DROP TABLE IF EXISTS `booking`;
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
	regionId		CHAR(1)				NOT NULL,
    name			VARCHAR(50)			NOT NULL,
    CONSTRAINT regionId_pk PRIMARY KEY ( regionId )
);

CREATE TABLE `province` (
    provinceId		VARCHAR(2)			NOT NULL,
    name			VARCHAR(50)			NOT NULL,
    img				VARCHAR(1000)		NOT NULL,
    regionId		CHAR(1)				NOT NULL,
    CONSTRAINT provinceId_pk PRIMARY KEY ( provinceId ),
    CONSTRAINT regionId_fk FOREIGN KEY ( regionId ) REFERENCES `region` ( regionId )
);

CREATE TABLE `district` (
    districtId		VARCHAR(4)			NOT NULL,
    name			VARCHAR(50)			NOT NULL,
    provinceId		VARCHAR(2)			NOT NULL,
    CONSTRAINT districtId_pk PRIMARY KEY ( districtId ),
    CONSTRAINT provinceId_fk FOREIGN KEY ( provinceId ) REFERENCES `province` ( provinceId )
);

CREATE TABLE `subDistrict` (
    subDistrictId	VARCHAR(4)			NOT NULL,
    name			VARCHAR(50)			NOT NULL,
	zipCodeId		CHAR(5)				NOT NULL,
    districtId		VARCHAR(4)			NOT NULL,
    CONSTRAINT subDistrictId_pk PRIMARY KEY ( subDistrictId ),
    CONSTRAINT districtId_fk FOREIGN KEY ( districtId ) REFERENCES `district` ( districtId )
);

CREATE TABLE `address` (
	addressId		VARCHAR(6)				NOT NULL,
    number			VARCHAR(20)			NOT NULL,
    street			VARCHAR(30)			NOT NULL,
    alley			VARCHAR(50),
    subDistrictId	VARCHAR(4)			NOT NULL,
    CONSTRAINT addressId_pk PRIMARY KEY ( addressId ),
    CONSTRAINT subDistrictId_addr_fk FOREIGN KEY ( subDistrictId ) REFERENCES `subDistrict` ( subDistrictId )
);

CREATE TABLE `userAccount` (
	userId			VARCHAR(5)			NOT NULL,
	email			VARCHAR(50)			NOT NULL,
    password		VARCHAR(100)		NOT NULL,
    fname			VARCHAR(50)			NOT NULL,
    lname			VARCHAR(50)			NOT NULL,
    sex				VARCHAR(20)			NOT NULL,
    phone			CHAR(10)			NOT NULL,
    role			VARCHAR(20)			NOT NULL,
    addressId		VARCHAR(10),
    CONSTRAINT userId_pk PRIMARY KEY ( userId ),
    CONSTRAINT contact_uc UNIQUE (phone, email),
    CONSTRAINT addressId_user_fk FOREIGN KEY ( addressId ) REFERENCES `address` ( addressId )
);

CREATE TABLE `dorm` (
	dormId			VARCHAR(5)			NOT NULL,
	name			VARCHAR(50)			NOT NULL,
    openTime		TIME,
    closeTime 		TIME,
    description 	VARCHAR(200),
    rating			DECIMAL(3, 2)		NOT NULL,
    acceptPercent	DECIMAL(5, 2)		NOT NULL,
    elecPerUnit		DECIMAL(3, 2)		NOT NULL,
    waterPerUnit	DECIMAL(3, 2)		NOT NULL,
    addressId		VARCHAR(5)			NOT NULL,
    CONSTRAINT dorm_pk PRIMARY KEY ( dormId, addressId ),
	CONSTRAINT addressId_dorm_fk FOREIGN KEY ( addressId ) REFERENCES `address` ( addressId )
);

CREATE TABLE `dormHasOwner` (
	dormId			VARCHAR(5)			NOT NULL,
    ownerId			VARCHAR(5)			NOT NULl,
    CONSTRAINT dormId_owner_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT ownerId_fk FOREIGN KEY ( ownerId ) REFERENCES `userAccount` ( userId )
);

CREATE TABLE `bank` (
	bankId			VARCHAR(3)			NOT NULL,
    name			VARCHAR(30)			NOT NULL,
    logo			VARCHAR(1000)		NOT NULL,
    CONSTRAINT bankId PRIMARY KEY ( bankId )
);

CREATE TABLE `bankAccount` (
	bankAccId		VARCHAR(5)			NOT NULL,
    accountNum		CHAR(10)			NOT NULL,
    qrCode			VARCHAR(1000),
    dormId			VARCHAR(5)			NOT NULL,
    bankId			VARCHAR(3)			NOT NULL,
    CONSTRAINT bankId PRIMARY KEY ( bankAccId ),
    CONSTRAINT dormId_bankAcc_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT bankId_fk FOREIGN KEY ( bankId ) REFERENCES `bank` ( bankId )
);

CREATE TABLE `booking` (
	bookingId		VARCHAR(6)			NOT NULL,
    fname			VARCHAR(50)			NOT NULL,
    lname			VARCHAR(50)			NOT NULL,
    phone			CHAR(10)			NOT NULL,
	payDate			DATETIME			NOT NULL,
    startDate		DATETIME			NOT NULL,
    endDate			DATETIME			NOT NULL,
    status			VARCHAR(10)			NOT NULL,
    deposit			INT					NOT NULL,
    description		VARCHAR(120),
    userId			VARCHAR(5),
    bankAccId		VARCHAR(5)			NOT NULL,
    CONSTRAINT bookingId_pk PRIMARY KEY ( bookingId ),
    CONSTRAINT userId_fk FOREIGN KEY ( userId ) REFERENCES `userAccount` ( userId ),
    CONSTRAINT bankAccId_fk FOREIGN KEY ( bankAccId ) REFERENCES `bankAccount` ( bankAccId )
);

CREATE TABLE `roomType` (
	roomTypeId		VARCHAR(5)			NOT NULL,
    type			VARCHAR(50)			NOT NULL,
    CONSTRAINT roomTypeId_pk PRIMARY KEY ( roomTypeId )
);

CREATE TABLE `dormHasRoomType` (
	dormId			VARCHAR(5)			NOT NULL,
    roomTypeId		VARCHAR(5)			NOT NULL,
	price			INT					NOT NULL,
	area			DECIMAL(5, 2)		NOT NULL,
	deposit			INT					NOT NULL,
    CONSTRAINT dormRoomType_pk PRIMARY KEY ( dormId, roomTypeId ),
    CONSTRAINT dormId_dormRoomType_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_dormRoomType_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);

CREATE TABLE `room` (
	roomId			VARCHAR(5)			NOT NULL,
    roomNum			VARCHAR(50)			NOT NULL,
    status			VARCHAR(10)			NOT NULL,
    floors			INT					NOT NULL,
    description		VARCHAR(200),
    dormId			VARCHAR(5)			NOT NULL,
    roomTypeId		VARCHAR(5)			NOT NULL,
    bookingId		VARCHAR(6),
    CONSTRAINT roomId_pk PRIMARY KEY ( roomId ),
    CONSTRAINT dormId_room_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_room_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId ),
    CONSTRAINT bookingId_fk FOREIGN KEY ( bookingId ) REFERENCES `booking` ( bookingId )
);

CREATE TABLE `facility` (
	facilityId		VARCHAR(5)			NOT NULL,
    name			VARCHAR(50)			NOT NULL,
    description		VARCHAR(200),
    CONSTRAINT detailId_pk PRIMARY KEY ( facilityId )
);

CREATE TABLE `roomFacility` (
	roomTypeId		VARCHAR(5)				NOT NULL,
    facilityId		VARCHAR(5)				NOT NULL,
    CONSTRAINT roomTypeId_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId ),
    CONSTRAINT facilityId_fk FOREIGN KEY ( facilityId ) REFERENCES `facility` ( facilityId )
);

CREATE TABLE `media` (
	mediaId			VARCHAR(5)			NOT NULL,
	path			VARCHAR(1000)		NOT NULL,
    name			VARCHAR(50),
    dormId			CHAR(5)				NOT NULL,
    roomTypeId		CHAR(5),
    CONSTRAINT mediaId_pk PRIMARY KEY ( mediaId ),
    CONSTRAINT dormId_md_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_md_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);
