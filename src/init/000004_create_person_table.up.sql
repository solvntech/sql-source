-- create table
CREATE TABLE IF NOT EXISTS people(
    id CHAR(36) PRIMARY KEY NOT NULL,
    no int not null,
    birth_name VARCHAR(255) NOT NULL,
    gene_name VARCHAR(255),
    second_name VARCHAR(255),
    birthday bigint,
    birthday_text VARCHAR(255),
    date_of_death bigint,
    date_of_death_text VARCHAR(255),
    father_id CHAR(36) DEFAULT NULL,
    mother_id CHAR(36) DEFAULT NULL,
    position_title_id CHAR(36) NOT NULL,
    email VARCHAR(225),
    phone_number VARCHAR(225),
    address VARCHAR(225),
    descriptions TEXT,
    status_id CHAR(36) NOT NULL,
    created_at BIGINT,
    updated_at BIGINT
);

-- before insert
CREATE TRIGGER before_people_insert
BEFORE INSERT
ON people FOR EACH ROW
BEGIN
    IF(LENGTH(NEW.father_id) <= 0) THEN
        SET NEW.father_id = NULL;
    END IF;
    IF(LENGTH(NEW.mother_id) <= 0) THEN
        SET NEW.mother_id = NULL;
    END IF;
END;

-- create relationship
ALTER TABLE people add constraint fk_father_id foreign key (father_id) references people(id);
ALTER TABLE people add constraint fk_mother_id foreign key (mother_id) references people(id);
ALTER TABLE people add constraint fk_status_id foreign key (status_id) references person_statuses(id);
ALTER TABLE people add constraint fk_position_title_id foreign key (position_title_id) references position_titles(id);


-- init data
-- insert into people (id, no, birth_name, second_name, birthday, date_of_death_text, father_id, position_title_id, status_id, gene_name, address) values
-- ('2507ae8a-936b-4ba7-b48a-ce1b7259050b', 1, 'Nguyễn Đức Tụy', null, null, null, null, 'truongnam', 'quadoi', null, null),
-- ('c42cd936-663a-4768-ae12-4e20348c8578', 1, 'Nguyễn Đức Thận', null, null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'truongnam', 'quadoi', null, null),
-- ('14e3bf59-9f4b-4921-84e7-9e352c94fce1', 1, 'Nguyễn Đức Hiểu', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'truongnam', 'quadoi', null, null),
-- ('705cc678-a4bd-4aa6-8666-4d1bfefeb435', 2, 'Nguyễn Đức Vô Danh', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('8bd031f6-b260-4adc-a52b-c3d66b58b9e8', 3, 'Nguyễn Đức Cược', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('d513ff86-f658-457f-b529-875ea0e21d0f', 4, 'Nguyễn Thị Cúc', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunu', 'quadoi', null, null),
-- ('fe317e46-fb13-4367-9402-94602a790530', 5, 'Nguyễn Thị Hòe', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunu', 'quadoi', null, null),
-- ('75fedade-2bb5-4c3c-bfa0-c6b53f3f9006', 6, 'Nguyễn Đức Quyền', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('1ce0b071-3db2-4203-ae0d-9350867e2319', 7, 'Nguyễn Đức Giáo', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('b00df06b-dd83-4fe8-826f-a81796190901', 8, 'Nguyễn Đức Xách', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('28df2e07-7188-48e3-8194-9678f2c39748', 9, 'Nguyễn Thị Quyền', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunu', 'quadoi', null, null),
-- ('d5b083f9-b735-4395-9881-da98eccc5c32', 10, 'Nguyễn Đức Hiếu', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('b684f35c-7255-46da-b62b-e411bac9bba4', 11, 'Nguyễn Đức Dư', null, null, null, 'c42cd936-663a-4768-ae12-4e20348c8578', 'thunam', 'quadoi', null, null),
-- ('7e7d011b-63e5-4bfa-b5da-6ecd63d46e8a', 2, 'Nguyễn Thị Thọ', null, null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'thunu', 'quadoi', null, null),
-- ('e4f9140c-a3b7-491b-91e5-5c18691576c3', 3, 'Nguyễn Thị Dị', null, null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'thunu', 'quadoi', null, null),
-- ('d034c327-22bc-4b46-a799-5ce5be7c1e2d', 4, 'Nguyễn Đức Thiện', 'tường', null, '26/7 âm lịch', '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'thunam', 'quadoi', null, null),
-- ('8c17b862-ffa5-431d-a7ad-253e4182ee86', 1, 'Nguyễn Đức Thoại', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'truongnam', 'quadoi', null, null),
-- ('4466fd63-5177-4f43-aab2-76e9d9d1bf53', 1, 'Nguyễn Đức Chương', null, null, null, '8c17b862-ffa5-431d-a7ad-253e4182ee86', 'truongnam', 'quadoi', null, null),
-- ('1a0eaa14-9bbf-451f-baaf-d635c465193e', 2, 'Nguyễn Thị Quỳnh', null, null, null, '8c17b862-ffa5-431d-a7ad-253e4182ee86', 'thunu', 'quadoi', null, null),
-- ('0572b00b-1d1f-42ec-83ab-ebe628e339a8', 3, 'Nguyễn Đức Đàm', null, null, null, '8c17b862-ffa5-431d-a7ad-253e4182ee86', 'thunam', 'quadoi', null, null),
-- ('c3c44518-e9e3-49bb-84cd-ff1c986352dd', 4, 'Nguyễn Thị Châu', null, null, null, '8c17b862-ffa5-431d-a7ad-253e4182ee86', 'utnu', 'quadoi', null, null),
-- ('cfca0414-2209-4571-ae50-9d83048601c7', 2, 'Nguyễn Thị Bờ', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'thunu', 'quadoi', null, null),
-- ('0356d077-612c-4194-a8b9-de6c6e9b4956', 3, 'Nguyễn Đức Cần', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'thunam', 'quadoi', null, null),
-- ('6ea182a7-6c93-4dd6-94cc-17e63d3f2c95', 4, 'Nguyễn Đức Mẫn', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'thunam', 'quadoi', null, null),
-- ('60e1fa73-6c14-45d2-ac4c-e4d4581f1575', 1, 'Nguyễn Thị Lịch', null, null, null, '6ea182a7-6c93-4dd6-94cc-17e63d3f2c95', 'truongnu', 'quadoi', null, null),
-- ('9ae0fa5e-1fc8-40b4-b08f-fceb8747b416', 2, 'Nguyễn Thị Mai', null, null, null, '6ea182a7-6c93-4dd6-94cc-17e63d3f2c95', 'thunu', 'quadoi', null, null),
-- ('975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 3, 'Nguyễn Đức Phước', null, null, '26/02 âm lich', '6ea182a7-6c93-4dd6-94cc-17e63d3f2c95', 'thunam', 'quadoi', null, null),
-- ('7033b30b-5fac-489d-934e-3ac7df3cf3c1', 1, 'Nguyễn Đức Cự', null, null, '08/10 âm lịch', '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'truongnam', 'quadoi', null, null),
-- ('df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 1, 'Nguyễn Đức Thự', 'Ô Như', null, '04/6 âm lịch', '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'truongnam', 'quadoi', null, null),
-- ('c9b3f996-5e03-40af-8de6-f9f42c0efcf6', 1, 'Nguyễn Đức Như', null, null, '10/02 âm lịch', 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'truongnam', 'quadoi', null, null),
-- ('92d7245c-a120-4c81-bb03-98aa1b912983', 2, 'Nguyễn Đức Chư', null, null, null, 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'thunam', 'quadoi', null, null),
-- ('b492f595-5d32-4f24-96f3-d88d38b6a6b6', 3, 'Nguyễn Thị Ky', null, null, null, 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'thunu', 'quadoi', null, null),
-- ('bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 4, 'Nguyễn Đức Húc', null, null, null, 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'thunam', 'quadoi', null, 'Duy Phước - Duy Xuyên - Quảng Nam'),
-- ('e5602342-b2c3-4106-940d-1976324542e0', 1, 'Nguyễn Đức Sum', null, null, null, 'bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 'truongnam', 'quadoi', null, 'Duy Phước - Duy Xuyên - Quảng Nam'),
-- ('cb8f1d80-5a1b-4550-bc38-d9bbfdb0f688', 2, 'Nguyễn vô danh', null, null, null, 'bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 'thunam', 'quadoi', null, null),
-- ('40bcd7c8-879c-4cc1-9c4b-0c345afa2813', 3, 'Nguyễn Thị Sô', null, null, null, 'bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 'thunu', 'quadoi', null, null),
-- ('abdf0a42-c837-4023-aa34-cb3ef3fa99d1', 4, 'Nguyễn Thị Lợi', null, null, null, 'bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 'thunu', 'quadoi', null, null),
-- ('20e1a450-3677-4f07-994b-cdc5e2818988', 5, 'Nguyễn Đức Hàng', null, -504950400000, null, 'bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 'thunam', 'quadoi', null, 'Duy Phước - Duy Xuyên - Quảng Nam'),
-- ('fd387e58-7f37-431f-877f-3adbdd16c3e5', 1, 'Nguyễn Đức Lảnh', null, 157737600000, null, '20e1a450-3677-4f07-994b-cdc5e2818988', 'truongnam', 'quadoi', null, null),
-- ('73f722bb-f0bf-459e-b325-940ebf7dfaa0', 2, 'Nguyễn Đức Linh', null, 220899600000, null, '20e1a450-3677-4f07-994b-cdc5e2818988', 'thunam', 'quadoi', null, null),
-- ('dd8b7f6a-4911-4bc0-ae3f-7ecb6ba97966', 3, 'Nguyễn Thị Thu Thuỷ', null, 441738000000, null, '20e1a450-3677-4f07-994b-cdc5e2818988', 'thunu', 'quadoi', null, null),
-- ('c3c2a639-aff2-436c-894e-9d6b23be60df', 4, 'Nguyễn Đức Sơn', null, 504896400000, null, '20e1a450-3677-4f07-994b-cdc5e2818988', 'utnam', 'quadoi', null, null),
-- ('a066b081-55e1-4f56-8915-a94cacab2330', 6, 'Nguyễn Đức Lục', null, null, null, 'bd63e5fc-46da-4e78-8ca9-8df8e7dd4224', 'utnam', 'quadoi', null, null),
-- ('479eaaab-4588-4fc9-bf2a-b76e5832903d', 5, 'Nguyễn Thị Cung', null, null, null, 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'thunu', 'quadoi', null, null),
-- ('0845405b-038f-488d-b1b2-fb280f6e1f08', 6, 'Nguyễn vô danh', null, null, null, 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'thunam', 'quadoi', null, null),
-- ('eec7486a-6ef6-4ef6-b701-a4b327e72382', 7, 'Nguyễn Đức Chanh', null, null, null, 'df66e9ca-fa9c-49d7-9c2d-c23fe57c6dfc', 'utnam', 'quadoi', null, null),
-- ('d05773ec-c717-47d1-bef0-12aa7a248799', 2, 'Nguyễn Đức Nhơn', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('5ac2bedc-3590-46da-8b0d-134982b1dbb0', 3, 'Nguyễn Thị Sữu', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunu', 'quadoi', null, null),
-- ('205e9293-d17e-42ea-b9a8-dc35c3b5f5c5', 4, 'Nguyễn Thị Dần', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunu', 'quadoi', null, null),
-- ('c06067a3-3a1a-428e-aa15-99ecb4b1310e', 5, 'Nguyễn Thị Sàn', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunu', 'quadoi', null, null),
-- ('f53e994b-007b-41a9-baea-d96ec0a658e3', 6, 'Nguyễn Đức Cây', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('6dbcfacc-5cad-4862-b623-ffe869671f54', 7, 'Nguyễn Đức Lá', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('c669837c-5246-495f-ac8a-d54a63f34ba0', 8, 'Nguyễn Đức Đài', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('9a3bdf1a-e376-4617-97d6-a74634b47073', 9, 'Nguyễn Đức Bài', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('d9323d31-2378-41a4-b0a3-4077d235d40a', 10, 'Nguyễn Đức Bặt', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('3f3be72b-2f79-4fbf-8239-1f16327dc8c5', 11, 'Nguyễn vô danh', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('193a6349-0883-4add-b3dc-dd7cd1ca5cba', 12, 'Nguyễn vô danh', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunam', 'quadoi', null, null),
-- ('f7181568-e710-4e14-99f3-a9ffe9cee399', 13, 'Nguyễn Thị Thôi', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'thunu', 'quadoi', null, null),
-- ('5b3698f8-dc12-4fd2-9818-b206598a1cd7', 14, 'Nguyễn Thị Thêm', null, null, null, '7033b30b-5fac-489d-934e-3ac7df3cf3c1', 'utnu', 'quadoi', null, null),
-- ('7235f1a4-f85f-46da-81d6-511fc1bf6540', 2, 'Nguyễn Thị Kiều', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('729275cb-0079-4a9d-99da-e04eccad53df', 3, 'Nguyễn Thị Phát', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('85784006-89e0-41a5-9aeb-a75ab06d64d7', 4, 'Nguyễn Đức Quỳ', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunam', 'quadoi', null, null),
-- ('4114994c-5fa0-49e6-a044-cf33b0c957c8', 5, 'Nguyễn Đức Kiên', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunam', 'quadoi', null, null),
-- ('1bd96ba0-16a6-41a6-aa6e-a56cf8c84ae1', 6, 'Nguyễn Đức Cường', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunam', 'quadoi', null, null),
-- ('9af0951b-3b66-4563-9573-d81edab9ecb2', 7, 'Nguyễn Thị Khánh', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('dd63552a-0966-49e0-add7-b84cb80402b4', 8, 'Nguyễn Thị Sĩ', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('6d79ce20-4459-40b6-b0d4-26c9639779bf', 9, 'Nguyễn Đức Trai', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunam', 'quadoi', null, null),
-- ('9be04543-b902-41b8-8a66-895bbefcceb3', 10, 'Nguyễn Thị Diện', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('92a5dba4-bd9b-454b-898c-59441fa1b269', 11, 'Nguyễn Thị Ngùn', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('6499d1dc-3dec-4485-b088-2c0cd4d4327f', 12, 'Nguyễn Thị Tụng', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunu', 'quadoi', null, null),
-- ('e2c28c98-b008-4787-a381-508fa289c377', 13, 'Nguyễn Đức Bành', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'thunam', 'quadoi', null, null),
-- ('f55d681a-c8de-4510-af49-fa1ac584be28', 14, 'Nguyễn Đức Long', null, null, null, '975c9c3e-e3ae-4949-bf3a-adf97939ce5b', 'utnam', 'quadoi', null, null),
-- ('971389fb-9db7-4ed9-b7ee-80ae3a1ebd21', 4, 'Nguyễn Đức Thành', null, null, null, '6ea182a7-6c93-4dd6-94cc-17e63d3f2c95', 'thunam', 'quadoi', null, null),
-- -- ('iuuid', 6, 'name', null, null, null, 'fatherid', 'thunam', 'quadoi', null, null),
-- ('8b81d893-e3c9-40c8-a442-ad7f2e962e08', 5, 'Nguyễn Đức Sơn', null, null, null, '6ea182a7-6c93-4dd6-94cc-17e63d3f2c95', 'utnam', 'quadoi', null, null),
-- ('bf5f9c19-b51b-4410-99d2-56259c2befa1', 1, 'Nguyễn Đức Khoa', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'truongnam', 'quadoi', null, null),
-- -- ('iuuid', 6, 'name', null, null, null, 'fatherid', 'thunam', 'quadoi', null, null),
-- ('80e270e3-1bd5-42d7-bb8e-b6620c53dcd5', 2, 'Nguyễn Đức Thanh', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'thunam', 'quadoi', null, null),
-- ('2e93c829-761b-49fc-b3f0-6406ef90ca03', 3, 'Nguyễn Thị Hành', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'thunu', 'quadoi', null, null),
-- ('53466254-d488-4863-8f72-d11d75ea5286', 4, 'Nguyễn Thị Hí', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'thunu', 'quadoi', null, null),
-- ('e00aad59-04a4-4341-a93f-2ad1069c2d83', 5, 'Nguyễn Đức Dủ', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'thunam', 'quadoi', null, null),
-- -- ('iuuid', 6, 'name', null, null, null, 'fatherid', 'thunam', 'quadoi', null, null),
-- ('a615d0bd-e98d-41b6-a044-b73bcc8f9689', 6, 'Nguyễn Thị Bé', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'thunu', 'quadoi', null, null),
-- ('19550802-987f-40d0-83c8-f7e007077ba9', 7, 'Nguyễn Đức Chúc', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'thunam', 'quadoi', null, null),
-- -- ('iuuid', 6, 'name', null, null, null, 'fatherid', 'thunam', 'quadoi', null, null),
-- ('5df2a7bf-76e0-40a1-8224-905417d43454', 8, 'Nguyễn Thị Đào', null, null, null, '8b81d893-e3c9-40c8-a442-ad7f2e962e08', 'utnu', 'quadoi', null, null),
-- ('e1abf839-91a2-4971-89a3-756ea3641ead', 5, 'Nguyễn Đức Sự', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'thunam', 'quadoi', null, null),
-- ('dff7e71a-087c-4014-954e-38255685abc8', 6, 'Nguyễn Đức Thông', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'thunam', 'quadoi', null, null),
-- ('9a84b881-d09f-496a-9dbb-e9a91206adad', 1, 'Nguyễn Thị Lý', null, null, null, 'dff7e71a-087c-4014-954e-38255685abc8', 'truongnu', 'quadoi', null, null),
-- ('c18a1351-f092-4e37-9351-99c676e8e8c2', 2, 'Nguyễn Đức Bền', null, null, null, 'dff7e71a-087c-4014-954e-38255685abc8', 'utnam', 'quadoi', null, null),
-- ('39c3b1ef-02f3-4494-b879-b2f5b204be38', 7, 'Nguyễn Đức Minh', null, null, null, 'd034c327-22bc-4b46-a799-5ce5be7c1e2d', 'utnam', 'quadoi', null, null),
-- ('6b6e7923-58cb-400c-a70c-4c0982f82555', 5, 'Nguyễn Thị Thu', null, null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'thunu', 'quadoi', null, null),
-- ('32a0261d-6526-4c76-abc3-57b08698d37f', 6, 'Nguyễn Đức Khoáng', null, null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'thunam', 'quadoi', null, null),
-- ('19511151-3e8a-4578-b0f7-df9602f19743', 1, 'Nguyễn Thị Ninh', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'truongnu', 'quadoi', null, null),
-- ('a2925efc-47d6-4b7c-bb38-10b16af8738d', 2, 'Nguyễn Thị Lợi', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunu', 'quadoi', null, null),
-- ('46cc1ff0-da54-432e-9553-9418bf972316', 3, 'Nguyễn Thị Lộc', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunu', 'quadoi', null, null),
-- ('2188e0e3-25c2-4707-b16a-6d1f8f185d96', 4, 'Nguyễn Đức Thái', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunam', 'quadoi', null, null),
-- ('1307c232-4539-43f1-a625-3b30443b2114', 5, 'Nguyễn Đức Trị', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunam', 'quadoi', null, null),
-- ('e148566d-a8fd-48ab-8ec6-69d719d51cc3', 6, 'Nguyễn Thị Huyễn', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunu', 'quadoi', null, null),
-- ('389c4c63-07b6-4130-b253-e2bf419389ba', 7, 'Nguyễn Đức Vĩnh', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunam', 'quadoi', null, null),
-- ('0887d257-d3d3-459e-adf4-3a2cdabfdaaf', 8, 'Nguyễn Đức Trường', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'thunam', 'quadoi', null, null),
-- ('edb60210-22b6-4a06-acae-073d7e8b3b3c', 9, 'Nguyễn Thị Thục', null, null, null, '32a0261d-6526-4c76-abc3-57b08698d37f', 'utnu', 'quadoi', null, null),
-- ('caf29f91-9f1d-481f-a48e-72851e408b20', 7, 'Nguyễn Đức Phụng', null, null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'thunam', 'quadoi', null, null),
-- ('bb78bb2a-afbc-4074-b626-e486da4419d5', 8, 'Nguyễn Thị Hựu', 'Duyên', null, null, '2507ae8a-936b-4ba7-b48a-ce1b7259050b', 'utnu', 'quadoi', null, null)



-- ('iuuid', 6, 'name', null, null, null, 'fatherid', 'thunam', 'quadoi', null, null),
insert into people (id, no, birth_name, gene_name, birthday, father_id, position_title_id, status_id) values
('f2c21178-c01a-42cf-a88b-4807fee683c0', 1, 'Nguyễn Đức Khoa', 'Nguyễn Đức Khoa', null, null, 'truongnam', 'quadoi'),
('23e852a5-8288-4839-8b64-89506f48075f', 1, 'Nguyễn Thị Hạnh', 'Nguyễn Thị Hạnh', null, 'f2c21178-c01a-42cf-a88b-4807fee683c0', 'truongnu', 'quadoi'),
('131d0699-d7d9-48ba-9cbd-36343035687a', 7, 'Nguyễn Đức Liêm', 'Nguyễn Đức Liêm', null, 'f2c21178-c01a-42cf-a88b-4807fee683c0', 'thunam', 'quadoi'),
('29c81192-33cd-48a8-a4f1-60a4f56fb150', 1, 'Nguyễn Đức Thắng', 'Nguyễn Đức Thắng', null, '131d0699-d7d9-48ba-9cbd-36343035687a', 'thunam', 'quadoi'),
('8d193965-75a8-4a5d-8712-83fdb4d73499', 4, 'Nguyễn Đức Hinh', 'Nguyễn Đức Hinh', null, '131d0699-d7d9-48ba-9cbd-36343035687a', 'thunam', 'quadoi'),
('783c7b5e-f5e0-4c89-927d-9e9e9818bd99', 1, 'Nguyễn Đức Ngữ', 'Nguyễn Đức Ngữ', null, '8d193965-75a8-4a5d-8712-83fdb4d73499', 'truongnam', 'consong'),
('f66ca8b8-b4e8-41c8-8fb4-9e97e92a8f18', 3, 'Nguyễn Thị Thu Hà', 'Nguyễn Thị Thu Hà', null, '8d193965-75a8-4a5d-8712-83fdb4d73499', 'thunu', 'consong'),
('2e208b11-0503-4f86-90df-70f323b02c4a', 4, 'Nguyễn Thị Thu Hạ', 'Nguyễn Thị Thu Hạ', null, '8d193965-75a8-4a5d-8712-83fdb4d73499', 'utnu', 'consong'),
('9c1d010c-45ad-4871-be01-03071d62d106', 1, 'Nguyễn Đức Thành Luận', 'Nguyễn Đức Luận', null, '783c7b5e-f5e0-4c89-927d-9e9e9818bd99', 'truongnam', 'consong'),
('99869989-05ff-4c62-890a-07cb38e52a25', 4, 'Nguyễn Đức Thành Phát', 'Nguyễn Đức Phát', null, '783c7b5e-f5e0-4c89-927d-9e9e9818bd99', 'utnam', 'consong'),
('4d932b25-6246-45dd-b988-2678487d7f56', 2, 'Nguyễn Đức Hân', 'Nguyễn Đức Hân', 25545600000, '8d193965-75a8-4a5d-8712-83fdb4d73499', 'thunam', 'consong'),
('2205adcb-e7d1-4685-98d3-7a38485ab9fa', 1, 'Nguyễn Đức Hải', 'Nguyễn Đức Hải', 901472400000, '4d932b25-6246-45dd-b988-2678487d7f56', 'truongnam', 'consong'),
('d796c4db-fad6-4d49-a924-99e5e3f44278', 3, 'Nguyễn Mỹ Duyên', 'Nguyễn Mỹ Duyên', 1206637200000, '4d932b25-6246-45dd-b988-2678487d7f56', 'utnu', 'consong'),
('2cd070ce-e3ae-4a3c-bc63-a48d129d0664', 4, 'Nguyễn Hồng Vân', 'Nguyễn Hồng Vân', 1050598800000, '4d932b25-6246-45dd-b988-2678487d7f56', 'thunu', 'consong')

