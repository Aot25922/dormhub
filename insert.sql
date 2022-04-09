INSERT INTO `dorm`(dormId, name, opentime, closeTime, description, rate) VALUES ('D0001', 'SUSURUN', null, null, null, 4.25);
INSERT INTO `dorm`(dormId, name, opentime, closeTime, description, rate) VALUES ('D0002', 'Neoarmstrong Canon', null, null, null, 5.00);

INSERT INTO `roomType`(roomTypeId, type) VALUES ('RT001', 'Small');
INSERT INTO `roomType`(roomTypeId, type) VALUES ('RT002', 'Big');

INSERT INTO `room`(roomId, roomNum, status, floors, price, description, dormId, roomTypeId) VALUES ('R0001', '101', 'Full', 1, 2500, null, 'D0001', 'RT001');
INSERT INTO `room`(roomId, roomNum, status, floors, price, description, dormId, roomTypeId) VALUES ('R0002', '102', 'Idle', 1, 2500, null, 'D0001', 'RT002');
INSERT INTO `room`(roomId, roomNum, status, floors, price, description, dormId, roomTypeId) VALUES ('R0003', '102', 'Idle', 1, 2500, null, 'D0002', 'RT001');

INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0001', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/549e9b77-4c90-4c7f-8d0e-772a4ba70576/d9tyf2k-81e3e921-c712-4e0e-88b8-c3169a910d93.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzU0OWU5Yjc3LTRjOTAtNGM3Zi04ZDBlLTc3MmE0YmE3MDU3NlwvZDl0eWYyay04MWUzZTkyMS1jNzEyLTRlMGUtODhiOC1jMzE2OWE5MTBkOTMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.l1dqqj8cs7o23NqsHxRygLJMalH5M3DCcazHyS_9V1k', null, 'D0001', null);
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0002', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/287eab66-0f73-4b97-8e74-849c5f06d542/ddrinx9-2e0cfe76-97c0-4008-8382-990d9f6f5af5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI4N2VhYjY2LTBmNzMtNGI5Ny04ZTc0LTg0OWM1ZjA2ZDU0MlwvZGRyaW54OS0yZTBjZmU3Ni05N2MwLTQwMDgtODM4Mi05OTBkOWY2ZjVhZjUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.SEU1kEIhjs4yhvyIYj7XLMOgyk47lkrK65cbsTXcDMk', null, 'D0002', null);
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0003', 'http://f.ptcdn.info/189/029/000/1425962771-gintama216-o.jpg', null, 'D0001', 'RT001');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0004', 'https://f.ptcdn.info/191/029/000/1425968149-2z3orpv-o.jpg', null, 'D0001', 'RT001');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0005', 'https://cdnmetv.metv.com/WzeFS-1619719775-16228-list_items-bugs_sunglasses.jpg', null, 'D0001', 'RT001');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0006', 'https://cdnmetv.metv.com/AO512-1619719640-16224-list_items-chungus.jpg', null, 'D0001', 'RT001');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0007', 'https://cdnmetv.metv.com/A7Uev-1619719796-16229-list_items-bugs_wish.jpg', null, 'D0001', 'RT002');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0008', 'https://cdnmetv.metv.com/z50xp-1619719725-16226-list_items-no.jpg', null, 'D0001', 'RT002');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0009', 'https://cdnmetv.metv.com/AGKJm-1619719750-16227-list_items-bugs_gun.jpg', null, 'D0002', 'RT001');
INSERT INTO `source`(sourceId, path, name, dormId, roomTypeId) VALUES ('S0010', 'https://cdnmetv.metv.com/Vpf7q-1619719679-16225-list_items-bugs-commy.jpg', null, 'D0002', 'RT001');

INSERT INTO `region`(regionId, region, city, state, district, country, zipCode, sourceId) VALUES ('RG001', 'Center', 'Bangkok', 'state1', 'distrint1', 'Thailand', '10150', null);
INSERT INTO `region`(regionId, region, city, state, district, country, zipCode, sourceId) VALUES ('RG002', 'North', 'Changmai', 'state2', 'distrint2', 'Thailand', '10456', null);

INSERT INTO `address`(addressId, number, street, alley, regionId, dormId) VALUES ('AD0001', '192/168', 'St.Road1', null, 'RG001', 'D0001');
INSERT INTO `address`(addressId, number, street, alley, regionId, dormId) VALUES ('AD0002', '1/168', 'St.Road2', null, 'RG002', 'D0002');

INSERT INTO `user`(email, password, fname, lname, sex, phone, role, addressId, agreementId) VALUES ('dorm1@mail.com', 'test', 'Dorm1', 'Lname1', 'Male', '1234567890', 'Dorm Manage', 'AD0001', null);
INSERT INTO `user`(email, password, fname, lname, sex, phone, role, addressId, agreementId) VALUES ('dorm2@mail.com', 'test', 'Dorm2', 'Lname2', 'Female', '1234567899', 'Dorm Manage', 'AD0002', null);

-- SELECT * FROM int365_dormhub.address;
-- SELECT * FROM int365_dormhub.region;
-- SELECT * FROM int365_dormhub.user;
-- SELECT * FROM int365_dormhub.dorm;