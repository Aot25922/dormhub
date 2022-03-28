INSERT INTO `address`(addressId, number, street, alley) VALUES ('AD00001', '192/168', 'St.Road', null);

INSERT INTO `region`(regionId, region, city, state, district, country, zipCode, addressId, sourceId) VALUES ('RG001', 'North', 'Bangkok', 'state', 'distrint', 'Thailand', '10150', 'AD00001', null);

INSERT INTO `user`(email, password, fname, lname, sex, phone, role, addressId, agreementId) VALUES ('dorm1@mail.com', 'test', 'Dorm1', 'Lname', 'Male', '1234567890' 'Dorm Managemnt', 'AD00001', null);

INSERT INTO `dorm`(dormId, name, opentime, closeTime, description, rate, addressId) VALUES ('D0001', 'SUSURUN', null, null, null, 4.25, 'AD00001');