<?php

//$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);
 
$username = $_POST['user'];
$password = $_POST['pass'];

$username = stripcslashes($username);
$password = stripslashes($password);
//$username = mysql_real_escape_string($username);
//$password = mysql_real_escape_string($password);
$conn = mysqli_connect("localhost", "root", "", "Vaccine_Management" );
$sql = "select user, authentication_string from mysql.user where user = '$username' and authentication_string = SHA2('$password', 256);";
$result = mysqli_query($conn, $sql);
   // or die("Failed ot query database ".mysqli_error());
    $row = mysqli_fetch_assoc($result);
    $check = mysqli_num_rows($result);
    if($check > 0) {
        if($row['user'] == $username) {
            $sql1 = "SELECT Resident.ID_card_number, Resident.Full_name, Resident.Birthday, Resident.Gender, Resident.Vaccination_status, Medical_center.MName, 
            Vaccination_record.Vaccinated_date, Vaccination_record.Dose_number, Vaccination_record.Physician, 
            Vaccination_record.Consignment_serial_number, Vacxin_consignment.VName
            FROM Vaccination_record
            INNER JOIN Resident ON Resident.ID_card_number = Vaccination_record.ID_card_number
            INNER JOIN Medical_center ON Medical_center.Medical_serial_number = Vaccination_record.Medical_serial_number
            INNER JOIN Vacxin_consignment ON Vaccination_record.Consignment_serial_number = Vacxin_consignment.VSerial_number
            WHERE (Vaccination_record.ID_card_number = '$username');";
            $result2 = mysqli_query($conn, $sql1);
            $row2 = mysqli_fetch_assoc($result2);
            $check2 = mysqli_num_rows($result2);
            echo "Hello, here is your information";
            if($check2 > 0) {
                echo "<br> ID number: ";
                echo $row2['ID_card_number'];
                echo "<br> Full name: ";
                echo $row2['Full_name'];
                echo "<br> Birthday: ";
                echo $row2['Birthday'];
                echo "<br> Vaccination status: ";
                echo $row2['Vaccination_status'];

            }
        } else {
            echo "Failed to login";
        }
    } else {
        echo "Failed to login";
    }
?>