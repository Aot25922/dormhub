INSERT INTO `region`(regionId, name) VALUES ('1', 'ภาคกลาง');
INSERT INTO `region`(regionId, name) VALUES ('2', 'ภาคเหนือ');
INSERT INTO `region`(regionId, name) VALUES ('3', 'ภาคใต้');
INSERT INTO `region`(regionId, name) VALUES ('4', 'ภาคตะวันตก');
INSERT INTO `region`(regionId, name) VALUES ('5', 'ภาคตะวันออกฉียงเหนือ');

INSERT INTO `province`(provinceId, name, img, regionId) VALUES ('1', 'กรุงเทพ', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fbrandinside.asia%2Fbangkok-global-destination-city-of-the-world%2F&psig=AOvVaw3F1V2JO070BfwN9iR-LzZ0&ust=1649741940858000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCKC4iOili_cCFQAAAAAdAAAAABAD', '1');
INSERT INTO `province`(provinceId, name, img, regionId) VALUES ('2', 'เชียงใหม่', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fth.hotels.com%2Fgo%2Fthailand%2Fchiang-mai&psig=AOvVaw3xMi7P1mZxNxJk9uxTC_vL&ust=1649741963727000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCIDTrfGli_cCFQAAAAAdAAAAABAD', '2');
INSERT INTO `province`(provinceId, name, img, regionId) VALUES ('3', 'ยะลา', 'https://www.southdeepoutlook.com/editorial_thumbnail/5c128f0a26cbf52474a7c3a24383c093_image_650x415.jpg', '3');
INSERT INTO `province`(provinceId, name, img, regionId) VALUES ('4', 'ตาก', 'https://paimayang.com/wp-content/uploads/2020/07/%E0%B8%AD%E0%B8%B1%E0%B8%9E%E0%B9%80%E0%B8%94%E0%B8%97%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B9%80%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7%E0%B8%95%E0%B8%B2%E0%B8%81-840x560.jpg', '4');
INSERT INTO `province`(provinceId, name, img, regionId) VALUES ('5', 'บุรีรัมย์', 'https://images.squarespace-cdn.com/content/v1/58c0c62bd2b8574cf9ae84f9/1567429048413-VIBBT0PNKZR9TA99IIDZ/Banner_regis-%E0%B8%9A%E0%B8%B8%E0%B8%A3%E0%B8%B5%E0%B8%A3%E0%B8%B1%E0%B8%A1%E0%B8%A2%E0%B9%8C.jpg?format=1000w', '5');

INSERT INTO `district`(districtId, name, provinceId) VALUES ('1', 'state1', '1');
INSERT INTO `district`(districtId, name, provinceId) VALUES ('2', 'state2', '2');

INSERT INTO `subDistrict`(subDistrictId, name, districtId, zipCodeId) VALUES ('1', 'subDistrict1', '1','10120');
INSERT INTO `subDistrict`(subDistrictId, name, districtId, zipCodeId) VALUES ('2', 'subDistrict2', '2','10130');

INSERT INTO `address`(addressId, number, street, alley, subDistrictId) VALUES ('1', '192/168', 'St.Road1', null, '1');
INSERT INTO `address`(addressId, number, street, alley, subDistrictId) VALUES ('2', '1/168', 'St.Road2', null, '2');
INSERT INTO `address`(addressId, number, street, alley, subDistrictId) VALUES ('3', '1/169', 'St.Road2', null, '2');

INSERT INTO `userAccount`(userId, email, password, fname, lname, sex, phone, role, addressId) VALUES ('1', 'dorm1@mail.com', 'test', 'Fname1', 'Lname1', 'Male', '1234567890', 'Dorm Manage', null);
INSERT INTO `userAccount`(userId, email, password, fname, lname, sex, phone, role, addressId) VALUES ('2', 'dorm2@mail.com', 'test', 'Fname2', 'Lname2', 'Female', '1234567899', 'Dorm Manage', null);
INSERT INTO `userAccount`(userId, email, password, fname, lname, sex, phone, role, addressId) VALUES ('3', 'dorm3@mail.com', 'test', 'Fname3', 'Lname3', 'Male', '1234567999', 'Dorm Manage', null);
INSERT INTO `userAccount`(userId, email, password, fname, lname, sex, phone, role, addressId) VALUES ('4', 'dorm4@mail.com', 'test', 'Fname4', 'Lname4', 'Female', '1234567879', 'User', '3');

INSERT INTO `dorm`(dormId, name, opentime, closeTime, description, rating, acceptPercent, elecPerUnit, waterPerUnit, addressId) VALUES ('1', 'SUSURUN', null, null, null, 3.25, 90.00, 3.25, 1.23,'1');
INSERT INTO `dorm`(dormId, name, opentime, closeTime, description, rating, acceptPercent, elecPerUnit, waterPerUnit, addressId) VALUES ('2', 'Neoarmstrong Canon', null, null, null, 4.33, 72.26, 4.00, 2.01, '2');

INSERT INTO `dormHasOwner`(dormId, ownerId) VALUES ('1', '1');
INSERT INTO `dormHasOwner`(dormId, ownerId) VALUES ('2', '2');
INSERT INTO `dormHasOwner`(dormId, ownerId) VALUES ('2', '3');

INSERT INTO `roomType`(roomTypeId, type) VALUES ('1', 'Small');
INSERT INTO `roomType`(roomTypeId, type) VALUES ('2', 'Big');

INSERT INTO `dormHasRoomType`(dormId, roomTypeId, price, area, deposit) VALUES ('1', '1', 2500, 50.25, 3000);
INSERT INTO `dormHasRoomType`(dormId, roomTypeId, price, area, deposit) VALUES ('1', '2', 4000, 80.50, 5500);
INSERT INTO `dormHasRoomType`(dormId, roomTypeId, price, area, deposit) VALUES ('2', '1', 3000, 60.00, 3000);

INSERT INTO `room`(roomId, roomNum, status, floors, description, dormId, roomTypeId) VALUES ('1', '101', 'Full', 1, null, '1', '1');
INSERT INTO `room`(roomId, roomNum, status, floors, description, dormId, roomTypeId) VALUES ('2', '102', 'Idle', 1, null, '1', '2');
INSERT INTO `room`(roomId, roomNum, status, floors, description, dormId, roomTypeId) VALUES ('3', '101', 'Idle', 1, null, '2', '1');

INSERT INTO `facility`(facilityId, name, description) VALUES ('1', 'เตียงเล็ก', 'อันเท่านี่');
INSERT INTO `facility`(facilityId, name, description) VALUES ('2', 'เตียงเใหญ่', 'บะฮึ่มๆเลย');
INSERT INTO `facility`(facilityId, name, description) VALUES ('3', 'ตู้เสื้อผ้า', null);
INSERT INTO `facility`(facilityId, name, description) VALUES ('4', 'โทรทัศน์', '69นิ้ว');

INSERT INTO `roomFacility`(roomTypeId, facilityId) VALUES ('1', '1');
INSERT INTO `roomFacility`(roomTypeId, facilityId) VALUES ('1', '3');
INSERT INTO `roomFacility`(roomTypeId, facilityId) VALUES ('2', '2');
INSERT INTO `roomFacility`(roomTypeId, facilityId) VALUES ('2', '4');

INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('1', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/549e9b77-4c90-4c7f-8d0e-772a4ba70576/d9tyf2k-81e3e921-c712-4e0e-88b8-c3169a910d93.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzU0OWU5Yjc3LTRjOTAtNGM3Zi04ZDBlLTc3MmE0YmE3MDU3NlwvZDl0eWYyay04MWUzZTkyMS1jNzEyLTRlMGUtODhiOC1jMzE2OWE5MTBkOTMuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.l1dqqj8cs7o23NqsHxRygLJMalH5M3DCcazHyS_9V1k', null, '1', null);
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('2', 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/287eab66-0f73-4b97-8e74-849c5f06d542/ddrinx9-2e0cfe76-97c0-4008-8382-990d9f6f5af5.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzI4N2VhYjY2LTBmNzMtNGI5Ny04ZTc0LTg0OWM1ZjA2ZDU0MlwvZGRyaW54OS0yZTBjZmU3Ni05N2MwLTQwMDgtODM4Mi05OTBkOWY2ZjVhZjUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.SEU1kEIhjs4yhvyIYj7XLMOgyk47lkrK65cbsTXcDMk', null, '2', null);
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('3', 'http://f.ptcdn.info/189/029/000/1425962771-gintama216-o.jpg', null, '1', '1');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('4', 'https://f.ptcdn.info/191/029/000/1425968149-2z3orpv-o.jpg', null, '1', '1');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('5', 'https://cdnmetv.metv.com/WzeFS-1619719775-16228-list_items-bugs_sunglasses.jpg', null, '1', '1');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('6', 'https://cdnmetv.metv.com/AO512-1619719640-16224-list_items-chungus.jpg', null, '1', '1');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('7', 'https://cdnmetv.metv.com/A7Uev-1619719796-16229-list_items-bugs_wish.jpg', null, '1', '2');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('8', 'https://cdnmetv.metv.com/z50xp-1619719725-16226-list_items-no.jpg', null, '1', '2');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('9', 'https://cdnmetv.metv.com/AGKJm-1619719750-16227-list_items-bugs_gun.jpg', null, '2', '1');
INSERT INTO `media`(mediaId, path, name, dormId, roomTypeId) VALUES ('10', 'https://cdnmetv.metv.com/Vpf7q-1619719679-16225-list_items-bugs-commy.jpg', null, '2', '1');

-- SELECT * FROM int365_dormhub.address;
-- SELECT * FROM int365_dormhub.region;
-- SELECT * FROM int365_dormhub.user;
-- SELECT * FROM int365_dormhub.dorm;