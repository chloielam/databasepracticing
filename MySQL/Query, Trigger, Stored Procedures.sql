SELECT * FROM district

SELECT * FROM household

SELECT HouseHold_serial_number AS 'Số Seri', Population AS 'Dân số', 
Fully_vaccinated AS 'Số người tiêm đủ 2 mũi vacxin', Partially_vaccinated AS 'Số người đã tiêm 1 mũi', 
Unvaccinated AS 'Số người chưa tiêm', District AS 'Quận', Ward AS 'Phường', Street AS 'Đường', H_number AS 'Số nhà'
FROM household

SELECT * FROM Vacxin

SELECT VName AS 'Tên Vacxin', Developer AS 'Nhà phát triển', Technology AS 'Kỹ thuật', 
Availability_date AS 'Ngày đáo hạn', Effectiveness AS 'Độ hiệu quả', Min_age AS 'Độ tuổi thấp nhất',
Max_age AS 'Độ tuổi cao nhất', Dosage AS 'Số liều', Time_between_first_and_second_dose_in_week AS 
'Số tuần giữa mũi 1 và mũi 2', Time_between_second_and_third_dose_in_week AS 'Số tuần giữa mũi 2 và mũi 3'
FROM Vacxin

SELECT VName AS 'Tên Vacxin', Availability_date AS 'Ngày đáo hạn', Effectiveness AS 'Độ hiệu quả', 
Min_age AS 'Độ tuổi thấp nhất', Max_age AS 'Độ tuổi cao nhất', Dosage AS 'Số liều', 
Time_between_first_and_second_dose_in_week AS 'Số tuần giữa mũi 1 và mũi 2', 
Time_between_second_and_third_dose_in_week AS 'Số tuần giữa mũi 2 và mũi 3'
FROM Vacxin WHERE Effectiveness > 80

SELECT * FROM medical_center WHERE Medical_serial_number >= 3655 AND Medical_serial_number <= 4565

SELECT * From resident where Vaccination_Status != 'Unvaccinated'

SELECT * FROM medical_center WHERE Medical_serial_number BETWEEN 3655 AND 4565

SELECT * FROM resident where Vaccination_status LIKE 'Fully_vaccinated' AND Gender LIKE 'Female'

SELECT * FROM Vacxin_consignment where VSerial_number IN (158695,199665,212555)

INSERT INTO resident VALUES (256212256,13258,'05/11/1996','Fully_vaccinated','Bui Thi Huong', 'Female')

SELECT COUNT(*) AS "Tong" FROM vacxin WHERE Developer LIKE 'America' AND Effectiveness >= 80

SELECT ID_card_number, Vaccination_status FROM resident ORDER BY ID_card_number ASC

UPDATE resident SET Vaccination_Status = 'Fully_vaccinated' WHERE ID_card_number = 125522521

UPDATE resident SET Vaccination_Status = 'Partially_vaccinated' WHERE ID_card_number IN (269998977,232525525)

DROP PROCEDURE IF EXISTS count_resident;

DELIMITER //
CREATE PROCEDURE  count_resident()
BEGIN
	SELECT * FROM resident WHERE Vaccination_status LIKE 'Fully_vaccinated';
END //
DELIMITER ;

CALL count_resident();

DELIMITER //
CREATE PROCEDURE  find_resident(p_keyword VARCHAR(50))
BEGIN
	SELECT * FROM resident WHERE Full_name LIKE concat('%', p_keyword, '%');
END //
DELIMITER ;

CALL find_resident('Duong');

DROP TRIGGER insert_record_from_resident
DELIMITER //
CREATE TRIGGER  insert_record_from_resident
AFTER INSERT ON resident FOR EACH ROW
BEGIN
	INSERT INTO vaccination_record VALUES (NEW.ID_card_number, 3655, Null ,255626,'Null','Null');
END //
DELIMITER ;

INSERT INTO resident VALUES (126548596,8878,'29/08/2000','Partially_vaccinated','Duong Dinh Hung','Male');

