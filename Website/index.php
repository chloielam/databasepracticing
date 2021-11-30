<?php
	include_once 'header.php';
	
?>
	<div class="information">
		<?php
			$sql = "SELECT * FROM District;";
			$result = mysqli_query($conn, $sql);
			$sqlresult = mysqli_num_rows($result);
				if($sqlresult > 0) {
					while($row = mysqli_fetch_assoc($result)) {
						echo "<div>
							<h2>".$row['Dname']."</h2> 
							<p> Fully vaccinated: ".$row['Fully_vaccinated']." people</p>
							<p> Partially vaccinated: ".$row['Partially_vaccinated']." people</p
							<p> Unvaccinated: ".$row['Unvaccinated']." people</p>
							<p> Population: ".$row['Population']." people</p>
						</div>";
					}
				}
		?>
	</div>
<?php
	include_once 'footer.php';
?>