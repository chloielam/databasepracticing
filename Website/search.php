<?php
    include 'header.php';
?>

<div>
    <?php
        if(isset($_POST['sub'])) {
            $search = $_POST['search'];
            $sql = "SELECT * FROM Ward WHERE Wname LIKE '%$search%' OR DName LIKE '%$search%'";
            $result = mysqli_query($conn, $sql);
            $queryR = mysqli_num_rows($result);
            if($queryR > 0) {
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<div>
                        <h2>".$row['DName']." ".$row['WName']."</h2> 
                        <p> Fully vaccinated: ".$row['Fully_vaccinated']." people</p>
                        <p> Partially vaccinated: ".$row['Partially_vaccinated']." people</p
                        <p> Unvaccinated: ".$row['Unvaccinated']." people</p>
                        <p> Population: ".$row['Population']." people</p>
                    </div>";
                }
            } else {
                echo "There are no result matching your search!";
            }

        }
    ?>
</div>