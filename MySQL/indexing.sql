CREATE INDEX idx1 ON HouseHold (H_number, Street, Ward, District);

CREATE INDEX id2 ON Distributed(Distributed_date);

CREATE INDEX idx3 ON Medical_center (MName);

CREATE INDEX idx4 ON Resident(Full_name);
CREATE INDEX idx6 ON Resident(Vaccination_status);
CREATE INDEX idx7 ON Resident(Birthday);

CREATE INDEX idx5 ON Vacxin_consignment(Expire_day);
CREATE INDEX idx9 ON Vacxin_consignment(Manufacturer);
CREATE INDEX idx10 ON Vacxin_consignment(Imported_date);
CREATE INDEX idx11 ON Vacxin_consignment(Imported_company);
CREATE INDEX idx12 ON Vacxin_consignment(Manufactoring_date);

CREATE INDEX idx8 ON Vaccination_record(Physician);

SHOW INDEX FROM HouseHold;
SHOW INDEX FROM Distributed;
SHOW INDEX FROM Medical_center;
SHOW INDEX FROM Resident;
SHOW INDEX FROM Vacxin_consignment;
SHOW INDEX FROM Vaccination_record;
SHOW INDEX FROM Ward;
SHOW INDEX FROM Vacxin;