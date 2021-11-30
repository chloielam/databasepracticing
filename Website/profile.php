<?php
	include_once 'header.php';
?>
<?php
    require_once 'includes/db.inc.php';
$username = $_SESSION["userid"];
 $sql1 = "SELECT Resident.ID_card_number, Resident.Full_name, Resident.Birthday, Resident.Gender, Resident.Vaccination_status
            FROM Vaccination_record
            INNER JOIN Resident ON Resident.ID_card_number = Vaccination_record.ID_card_number
             INNER JOIN Medical_center ON Medical_center.Medical_serial_number = Vaccination_record.Medical_serial_number
             INNER JOIN Vacxin_consignment ON Vaccination_record.Consignment_serial_number = Vacxin_consignment.VSerial_number
            WHERE (Vaccination_record.ID_card_number = '$username');";
    $sql2 = "SELECT  Medical_center.MName, 
    Vaccination_record.Vaccinated_date, Vaccination_record.Dose_number, Vaccination_record.Physician, Vaccination_record.Consignment_serial_number, Vacxin_consignment.VName
   FROM Vaccination_record
   INNER JOIN Resident ON Resident.ID_card_number = Vaccination_record.ID_card_number
    INNER JOIN Medical_center ON Medical_center.Medical_serial_number = Vaccination_record.Medical_serial_number
    INNER JOIN Vacxin_consignment ON Vaccination_record.Consignment_serial_number = Vacxin_consignment.VSerial_number
   WHERE (Vaccination_record.ID_card_number = '$username' and Vaccination_record.Dose_number = 1);";

             $result2 = mysqli_query($conn, $sql1);
             $row2 = mysqli_fetch_assoc($result2);
             $check2 = mysqli_num_rows($result2);
             echo "<br>";
             echo "Hello, here is your information:";
            if($check2 > 0) {
                echo "<br> ID number: ";
                echo $row2['ID_card_number'];
                echo "<br> Full name: ";
                echo $row2['Full_name'];
                echo "<br> Birthday: ";
                echo $row2['Birthday'];
                echo "<br> Gender: ";
                echo $row2['Gender'];
                echo "<br> Vaccination status: ";
                echo $row2['Vaccination_status'];
            }
            $result3 = mysqli_query($conn, $sql2);
             $row3 = mysqli_fetch_assoc($result3);
             $check3 = mysqli_num_rows($result3);
             if($check3 > 0) {
                echo "<br>";
                echo "<br>";
                echo "1st dose:";
                echo "<br> Vaccine name: ";
                echo $row3['VName'];
                echo "<br> Vaccinated date: ";
                echo $row3['Vaccinated_date'];
                echo "<br> Location: ";
                echo $row3['MName'];
                echo "<br> Physician: ";
                echo $row3['Physician'];
            }
            $sql4 = "SELECT  Medical_center.MName, 
            Vaccination_record.Vaccinated_date, Vaccination_record.Dose_number, Vaccination_record.Physician, Vaccination_record.Consignment_serial_number, Vacxin_consignment.VName
           FROM Vaccination_record
           INNER JOIN Resident ON Resident.ID_card_number = Vaccination_record.ID_card_number
            INNER JOIN Medical_center ON Medical_center.Medical_serial_number = Vaccination_record.Medical_serial_number
            INNER JOIN Vacxin_consignment ON Vaccination_record.Consignment_serial_number = Vacxin_consignment.VSerial_number
           WHERE (Vaccination_record.ID_card_number = '$username' and Vaccination_record.Dose_number = 2);";
           $result4 = mysqli_query($conn, $sql4);
           $row4 = mysqli_fetch_assoc($result4);
           $check4 = mysqli_num_rows($result4);
           if($check4 > 0) {
              echo "<br>";
              echo "<br>";
              echo "2nd dose:";
              echo "<br> Vaccine name: ";
              echo $row4['VName'];
              echo "<br> Vaccinated date: ";
              echo $row4['Vaccinated_date'];
              echo "<br> Location: ";
              echo $row4['MName'];
              echo "<br> Physician: ";
              echo $row4['Physician'];
          }
 
?>
<?php
	include_once 'footer.php';
?>