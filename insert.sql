START TRANSACTION;

-- INSERT INTO `address`(number, street, alley, subDistrict_id) VALUES ('192/168', 'St.Road1', null, '100101');
-- INSERT INTO `address`(number, street, alley, subDistrict_id) VALUES ('1/168', 'St.Road2', null, '100102');
-- INSERT INTO `address`(number, street, alley, subDistrict_id) VALUES ('1/169', 'St.Road2', null, '100102');

-- INSERT INTO `address`(number, street, alley, subDistrict, district, province, region, zipcode) VALUES ('192/168', 'St.Road1', null, 'subDistrict-1', 'district-1', 'กรุงเทพ', 'ภาคกลาง', '10150');
-- INSERT INTO `address`(number, street, alley, subDistrict, district, province, region, zipcode) VALUES ('1/168', 'St.Road2', null, 'subDistrict-2', 'district-2', 'เชียงใหม่', 'ภาคเหนือ', '10510');
-- INSERT INTO `address`(number, street, alley, subDistrict, district, province, region, zipcode) VALUES ('1/169', 'St.Road2', null, 'subDistrict-3', 'district-3', 'ยะลา', 'ภาคใต้', '10450');

-- INSERT INTO `userAccount`(email, password, fname, lname, sex, phone, role) VALUES ('dorm1@mail.com', 'test', 'Fname1', 'Lname1', 'Male', '1234567890', 'Owner');
-- INSERT INTO `userAccount`(email, password, fname, lname, sex, phone, role) VALUES ('dorm2@mail.com', 'test', 'Fname2', 'Lname2', 'Female', '1234567899', 'Owner');
-- INSERT INTO `userAccount`(email, password, fname, lname, sex, phone, role) VALUES ('dorm3@mail.com', 'test', 'Fname3', 'Lname3', 'Male', '1234567999', 'Owner');
-- INSERT INTO `userAccount`(email, password, fname, lname, sex, phone, role) VALUES ('dorm4@mail.com', 'test', 'Fname4', 'Lname4', 'Female', '1234567879', 'Customer');

-- INSERT INTO `dorm`(name, opentime, closeTime, description, rating, acceptPercent, elecPerUnit, waterPerUnit, addressId, ownerId) VALUES ('SUSURUN', null, null, null, 3.25, 90.00, 3.25, 1.23, 2, 1);
-- INSERT INTO `dorm`(name, opentime, closeTime, description, rating, acceptPercent, elecPerUnit, waterPerUnit, addressId, ownerId) VALUES ('Neoarmstrong Canon', null, null, null, 4.33, 72.26, 4.00, 2.01, 3, 2);

-- INSERT INTO `roomType`(type, description) VALUES ('Small', 'เตียง โต๊ะ เก้าอี้');
-- INSERT INTO `roomType`(type, description) VALUES ('Big', 'เตียง โต๊ะ เก้าอี้ บ้านของเรา');

-- INSERT INTO `dormHasRoomType`(dormId, roomTypeId, price, area, deposit) VALUES ('1', '1', 2500, 50.25, 3000);
-- INSERT INTO `dormHasRoomType`(dormId, roomTypeId, price, area, deposit) VALUES ('1', '2', 4000, 80.50, 5500);
-- INSERT INTO `dormHasRoomType`(dormId, roomTypeId, price, area, deposit) VALUES ('2', '1', 3000, 60.00, 3000);

-- INSERT INTO `room`(roomNum, status, floors, description, dormId, roomTypeId) VALUES ('101', 'Full', 1, null, '1', '1');
-- INSERT INTO `room`(roomNum, status, floors, description, dormId, roomTypeId) VALUES ('102', 'Idle', 1, null, '1', '2');
-- INSERT INTO `room`(roomNum, status, floors, description, dormId, roomTypeId) VALUES ('101', 'Idle', 1, null, '2', '1');

INSERT INTO `bank`(name, logo) VALUES ('กรุงเทพ', '1');
INSERT INTO `bank`(name, logo) VALUES ('กรุงไทย', '2');
INSERT INTO `bank`(name, logo) VALUES ('กรุงศรีอยุธยา', '3');
INSERT INTO `bank`(name, logo) VALUES ('กสิกรไทย', '4');
INSERT INTO `bank`(name, logo) VALUES ('เกียรตินาคินภัทร', '5');
INSERT INTO `bank`(name, logo) VALUES ('ซีไอเอ็มบี', '6');
INSERT INTO `bank`(name, logo) VALUES ('ทหารไทยธนชาต', '7');
INSERT INTO `bank`(name, logo) VALUES ('ทิสโก้', '8');
INSERT INTO `bank`(name, logo) VALUES ('ไทยพาณิชย์', '9');
INSERT INTO `bank`(name, logo) VALUES ('ยูโอบี', '10');
INSERT INTO `bank`(name, logo) VALUES ('แลนด์ แอนด์ เฮ้าส์', '11');
INSERT INTO `bank`(name, logo) VALUES ('สแตนดาร์ดชาร์เตอร์ด (ไทย)', '12');
INSERT INTO `bank`(name, logo) VALUES ('ไอซีบีซี (ไทย)', '13');

-- INSERT INTO `bankAccount`(accountNum, accountName, qrcode, dormId, bankId) VALUES ('1234567890', 'Dummy Name', null, 1, 1);
-- INSERT INTO `bankAccount`(accountNum, accountName, qrcode, dormId, bankId) VALUES ('1234567891', 'Dummy Name', null, 1, 2);
-- INSERT INTO `bankAccount`(accountNum, accountName, qrcode, dormId, bankId) VALUES ('1000000001', 'Name Maimee', null, 2, 2);
-- INSERT INTO `bankAccount`(accountNum, accountName, qrcode, dormId, bankId) VALUES ('1000000002', 'Name Maimee', null, 2, 3);

-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/549e9b77-4c90-4c7f-8d0e-772a4ba70576/d9tyf2k-81e3e921-c712-4e0e-88b8-c3169a910d93.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzU0OWU5Yjc3LTRjOTAtNGM3Zi04ZDBlLTc3MmE0YmE3MDU3NlwvZDl0eWYyay04MWUzZTkyMS1jNzEyLTRlMGUtODhiOC1jMzE2OWE5MTBkOTMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.l1dqqj8cs7o23NqsHxRygLJMalH5M3DCcazHyS_9V1k', null, '1', null);
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/287eab66-0f73-4b97-8e74-849c5f06d542/ddrinx9-2e0cfe76-97c0-4008-8382-990d9f6f5af5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI4N2VhYjY2LTBmNzMtNGI5Ny04ZTc0LTg0OWM1ZjA2ZDU0MlwvZGRyaW54OS0yZTBjZmU3Ni05N2MwLTQwMDgtODM4Mi05OTBkOWY2ZjVhZjUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.SEU1kEIhjs4yhvyIYj7XLMOgyk47lkrK65cbsTXcDMk', null, '2', null);
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('http://f.ptcdn.info/189/029/000/1425962771-gintama216-o.jpg', null, '1', '1');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://f.ptcdn.info/191/029/000/1425968149-2z3orpv-o.jpg', null, '1', '1');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://cdnmetv.metv.com/WzeFS-1619719775-16228-list_items-bugs_sunglasses.jpg', null, '1', '1');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://cdnmetv.metv.com/AO512-1619719640-16224-list_items-chungus.jpg', null, '1', '1');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://cdnmetv.metv.com/A7Uev-1619719796-16229-list_items-bugs_wish.jpg', null, '1', '2');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://cdnmetv.metv.com/z50xp-1619719725-16226-list_items-no.jpg', null, '1', '2');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://cdnmetv.metv.com/AGKJm-1619719750-16227-list_items-bugs_gun.jpg', null, '2', '1');
-- INSERT INTO `media`(path, name, dormId, roomTypeId) VALUES ('https://cdnmetv.metv.com/Vpf7q-1619719679-16225-list_items-bugs-commy.jpg', null, '2', '1');

COMMIT;