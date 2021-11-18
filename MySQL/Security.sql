CREATE ROLE 'Resident', 'Vaccine_Admin', 'General_Admin', 'Medician';
GRANT SELECT, UPDATE, INSERT ON Vacxin_consignment TO 'Vaccine_Admin';
GRANT SELECT, UPDATE, INSERT ON Distributed TO 'Vaccine_Admin';
GRANT SELECT, UPDATE, INSERT ON Vacxin TO 'Vaccine_Admin';
GRANT SELECT ON Medical_center TO 'Vaccine_Admin';


GRANT SELECT, UPDATE, INSERT ON Vaccination_record TO 'Medician';
GRANT SELECT ON Vacxin TO 'Medician';
GRANT SELECT ON Vacxin_consignment TO 'Medician';
GRANT SELECT ON Distributed TO 'Medician';

GRANT SELECT, UPDATE, INSERT ON District TO 'General_Admin';
GRANT SELECT, UPDATE, INSERT ON Ward TO 'General_Admin';
GRANT SELECT, UPDATE, INSERT ON Resident TO 'General_Admin';
GRANT SELECT, UPDATE, INSERT ON Medical_center TO 'General_Admin';
GRANT SELECT, UPDATE, INSERT ON Household TO 'General_Admin';
GRANT SELECT ON Vaccination_record TO 'General_Admin';
GRANT SELECT ON Vacxin TO 'General_Admin';
GRANT SELECT ON Vacxin_consignment TO 'General_Admin';
GRANT SELECT ON Distributed TO 'General_Admin';

CREATE VIEW Personal 
AS 
SELECT Resident.ID_card_number, Resident.Full_name Resident, Resident.Birthday, Resident.Gender, Resident.Vaccination_status, Medical_center.MName, 
Vaccination_record.Vaccinated_date, Vaccination_record.Dose_number, Vaccination_record.Physician, 
Vaccination_record.Consignment_serial_number, Vacxin_consignment.VName
FROM Vaccination_record
INNER JOIN Resident ON Resident.ID_card_number = Vaccination_record.ID_card_number
INNER JOIN Medical_center ON Medical_center.Medical_serial_number = Vaccination_record.Medical_serial_number
INNER JOIN Vacxin_consignment ON Vaccination_record.Consignment_serial_number = Vacxin_consignment.VSerial_number
WHERE (Vaccination_record.ID_card_number = substring_index(user(), '@', 1));
GRANT SELECT ON Personal TO 'Resident';

CREATE USER 'gadmin'@'%' IDENTIFIED BY 'general';
CREATE USER 'vadmin'@'%' IDENTIFIED BY 'vadmin';
CREATE USER 'physician'@'%' IDENTIFIED BY 'medician';
CREATE USER '12'@'%' IDENTIFIED BY 'resident';

GRANT 'General_Admin' TO 'gadmin'@'%';
GRANT 'Vaccine_Admin' TO 'vadmin'@'%';
GRANT 'Medician' TO 'physician'@'%';
GRANT 'Resident' TO '12'@'%';

UPDATE mysql.user SET authentication_string = SHA2('hcmut123', 256) where user = 'vadmin';
UPDATE mysql.user SET authentication_string = SHA2('hcmut456', 256) where user = 'gadmin';
UPDATE mysql.user SET authentication_string = SHA2('hcmut789', 256) where user = '12';
UPDATE mysql.user SET authentication_string = SHA2('hcmut000', 256) where user = 'physician';

SELECT host,user, authentication_string FROM mysql.user;


CREATE INDEX idx1 ON HouseHold (H_number, Street, Ward, District);
SHOW INDEX FROM HouseHold;