DROP SCHEMA IF EXISTS `dormhub` ;
CREATE SCHEMA IF NOT EXISTS `dormhub` DEFAULT CHARACTER SET utf8 ;
USE dormhub;
DROP TABLE IF EXISTS `paymentMethod`;
DROP TABLE IF EXISTS `blog`;
DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `agreement`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `region`;
DROP TABLE IF EXISTS `source`;
DROP TABLE IF EXISTS `roomService`;
DROP TABLE IF EXISTS `service`;
DROP TABLE IF EXISTS `room`;
DROP TABLE IF EXISTS `roomType`;
DROP TABLE IF EXISTS `dorm`;

CREATE TABLE `dorm` (
	dormId			CHAR(5)				NOT NULL,
	name			VARCHAR(50)			NOT NULL,
    openTime		TIME,
    closeTime 		TIME,
    description 	VARCHAR(200),
    rate			DECIMAL(3, 2)		NOT NULL,
    CONSTRAINT dormId_pk PRIMARY KEY ( dormId )
);

CREATE TABLE `roomType` (
	roomTypeId		CHAR(5)				NOT NULL,
    type			VARCHAR(50)			NOT NULL,
    CONSTRAINT roomTypeId_pk PRIMARY KEY ( roomTypeId )
);

CREATE TABLE `room` (
	roomId			CHAR(5)				NOT NULL,
    roomNum			VARCHAR(50)			NOT NULL,
    status			VARCHAR(120)		NOT NULL,
    floors			INT					NOT NULL,
    price			INT					NOT NULL,
    description		VARCHAR(200),
    dormId			CHAR(5)				NOT NULL,
    roomTypeId		CHAR(5)				NOT NULL,
    CONSTRAINT roomId_pk PRIMARY KEY ( roomId ),
    CONSTRAINT dormId_room_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_room_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);

CREATE TABLE `service` (
	serviceId		CHAR(5)				NOT NULL,
    name			VARCHAR(50)			NOT NULL,
    price			INT,
    description		VARCHAR(200)		NOT NULL,
    CONSTRAINT serviceId_pk PRIMARY KEY ( serviceId )
);

CREATE TABLE `roomService` (
	rsId			CHAR(5)				NOT NULL,
	roomId			CHAR(5)				NOT NULL,
    serviceId		CHAR(5)				NOT NULL,
    typeName		VARCHAR(20)			NOT NULL,
    CONSTRAINT rsId_pk PRIMARY KEY ( rsId ),
    CONSTRAINT roomId_fk FOREIGN KEY ( roomId ) REFERENCES `room` ( roomId ),
    CONSTRAINT serviceId_fk FOREIGN KEY ( serviceId ) REFERENCES `service` ( serviceId )
);

CREATE TABLE `source` (
	sourceId		CHAR(5)				NOT NULL,
	path			VARCHAR(1000)		NOT NULL,
    name			VARCHAR(50),
    dormId			CHAR(5)				NOT NULL,
    roomTypeId		CHAR(5),
    CONSTRAINT sourceId_pk PRIMARY KEY ( sourceId ),
    CONSTRAINT dormId_source_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT roomTypeId_source_fk FOREIGN KEY ( roomTypeId ) REFERENCES `roomType` ( roomTypeId )
);

CREATE TABLE `region` (
	regionId		CHAR(5)				NOT NULL,
    region			VARCHAR(50)			NOT NULL,
    city			VARCHAR(30)			NOT NULL,
    state			VARCHAR(30)			NOT NULL,
    district		VARCHAR(30)			NOT NULL,
    country			VARCHAR(30)			NOT NULL,
    zipCode			CHAR(5)				NOT NULL,
    sourceId		CHAR(5),
    CONSTRAINT regionId_pk PRIMARY KEY ( regionId ),
    CONSTRAINT sourceId_fk FOREIGN KEY ( sourceId ) REFERENCES `source` ( sourceId )
);

CREATE TABLE `address` (
	addressId		CHAR(6)				NOT NULL,
    number			VARCHAR(20)			NOT NULL,
    street			VARCHAR(30)			NOT NULL,
    alley			VARCHAR(5),
    regionId		CHAR(5)				NOT NULL,
    dormId			CHAR(5),
    CONSTRAINT addressDorm_pk PRIMARY KEY ( addressId, dormId ),
    CONSTRAINT regionId_fk FOREIGN KEY ( regionId ) REFERENCES `region` ( regionId ),
    CONSTRAINT dormId_address_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId )
);

CREATE TABLE `agreement` (
	agreementId		CHAR(6)				NOT NULL,
	amount			DECIMAL(6, 2)		NOT NULL,
	payDate			DATETIME			NOT NULL,
    startDate		DATETIME			NOT NULL,
    endDate			DATETIME			NOT NULL,
    status			CHAR(10)			NOT NULL,
    description		VARCHAR(120),
    dormId			CHAR(5)				NOT NULL,
    CONSTRAINT agreementId_pk PRIMARY KEY ( agreementId ),
    CONSTRAINT dormId_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId )
);

CREATE TABLE `user` (
	email			VARCHAR(50)			NOT NULL,
    password		VARCHAR(100)		NOT NULL,
    fname			VARCHAR(50)			NOT NULL,
    lname			VARCHAR(50)			NOT NULL,
    sex				VARCHAR(20)			NOT NULL,
    phone			CHAR(10)			NOT NULL,
    role			VARCHAR(20)			NOT NULL,
    addressId		VARCHAR(10)			NOT NULL,
    agreementId		CHAR(6),
    CONSTRAINT email_pk PRIMARY KEY ( email ),
    CONSTRAINT phone_uc UNIQUE (phone),
    CONSTRAINT addressId_user_fk FOREIGN KEY ( addressId ) REFERENCES `address` ( addressId ),
    CONSTRAINT agreementId_fk FOREIGN KEY ( agreementId ) REFERENCES `agreement` ( agreementId )
);

CREATE TABLE `blog` (
	blogId			CHAR(5)				NOT NULL,
    description		VARCHAR(120)		NOT NULL,
    email			VARCHAR(50)			NOT NULL,
	dormId			CHAR(5)				NOT NULL,
    CONSTRAINT blogId_pk PRIMARY KEY ( blogId ),
    CONSTRAINT email_fk FOREIGN KEY ( email ) REFERENCES `user` ( email ),
    CONSTRAINT dormId_blog_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId )
);

CREATE TABLE `paymentMethod` (
	methodId		CHAR(5)				NOT NULL,
    dormId			CHAR(5)				NOT NULL,
    sourceId		CHAR(5)				NOT NULL,
    CONSTRAiNT methodId_pk PRIMARY KEY ( methodId ),
    CONSTRAINT dormId_paymnet_fk FOREIGN KEY ( dormId ) REFERENCES `dorm` ( dormId ),
    CONSTRAINT sourceId_payment_fk FOREIGN KEY ( sourceId ) REFERENCES `source` ( sourceId )
);
