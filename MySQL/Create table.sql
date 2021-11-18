CREATE TABLE District(
	Dname varchar(50),
    Population int,
    Fully_vaccinated int,
    Partially_vaccinated int,
	Unvaccinated int,
    PRIMARY KEY (DName)
);

CREATE TABLE Ward(
	DName varchar(50),
	WName varchar(50),
    Population int,
    Fully_vaccinated int,
    Partially_vaccinated int,
	Unvaccinated int,
    PRIMARY KEY (WName, DName),
    FOREIGN KEY (DName) REFERENCES District(DName)
);

CREATE TABLE HouseHold(
    HouseHold_serial_number int,
	Population int,
    Fully_vaccinated int,
    Partially_vaccinated int,
	Unvaccinated int,
    District varchar(50),
    Ward varchar(50),
    Street varchar(50),
    H_number int,
    PRIMARY KEY (HouseHold_serial_number, District, Ward),
    FOREIGN KEY (District) REFERENCES Ward(DName),
    FOREIGN KEY (Ward) REFERENCES Ward(WName)
);

CREATE TABLE Resident(
	ID_card_number int,
    HouseHold_serial_number int,
    Birthday varchar(50),
    Vaccination_status varchar(50),
    Full_name varchar(50),
    Gender varchar(50),
    PRIMARY KEY(ID_card_number, HouseHold_serial_number),
    FOREIGN KEY (HouseHold_serial_number) REFERENCES HouseHold(HouseHold_serial_number)
)

CREATE TABLE Vaccination_record(
	ID_card_number int,
    Medical_serial_number int,
	Dose_number int,
    Consignment_serial_number int,
    Vaccinated_date varchar(50),
    Physician varchar(50),
    PRIMARY KEY(ID_card_number, Medical_serial_number, Consignment_serial_number),
    FOREIGN KEY (ID_card_number) REFERENCES Resident(ID_card_number),
    FOREIGN KEY (Medical_serial_number) REFERENCES Medical_center(Medical_serial_number),
    FOREIGN KEY (Consignment_serial_number) REFERENCES Vacxin_consignment(VSerial_number)
);

CREATE TABLE Medical_center(
    Medical_serial_number int,
    MName varchar(50),
    District varchar(50),
    Ward varchar(50),
    Street varchar(50),
    M_number int,
    PRIMARY KEY (Medical_serial_number, District, Ward),
    FOREIGN KEY (District) REFERENCES Ward(DName),
	FOREIGN KEY (Ward) REFERENCES Ward(WName)
);

CREATE TABLE Distributed(
    Medical_serial_number int,
    VSerial_number int,
    Distributed_date varchar(50),
    Total int,
    Available_dose int,
    PRIMARY KEY(VSerial_number, Medical_serial_number),
    FOREIGN KEY (Medical_serial_number) REFERENCES medical_center(Medical_serial_number),
    FOREIGN KEY (VSerial_number) REFERENCES Vacxin_consignment(VSerial_number)
);

CREATE TABLE Vacxin_consignment(
    VSerial_number int,
    VName varchar(50),
    Manufacturer varchar(50),
    Expire_day varchar(50),
    Available_dose int,
    Imported_date varchar(50),
    Import_company varchar(50),
    Total int,
    Manufactoring_date varchar(50),
    PRIMARY KEY (VSerial_number, VName),
    FOREIGN KEY (VName) REFERENCES Vacxin(VName)
);

CREATE TABLE Vacxin(
	VName varchar(50),
    Developer varchar(50),
    Technology varchar(50),
    Availability_date varchar(50),
    Effectiveness int,
    Min_age int,
    Max_age int,
    Dosage int,
    Time_between_first_and_second_dose_in_week int,
    Time_between_second_and_third_dose_in_week int,
    PRIMARY KEY (VName)
);    
    