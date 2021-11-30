<?php
	session_start();
	include 'includes/db.inc.php';
?>
<!DOCTYPE html>
<html>
<head>
	<title> Vaccine Management </title>
	<link rel="stylesheet" type = "text/css" href="style.css">	
<body>
	<nav>
		<div class = "wrapper">
			<a href="index.php">Home</a>
			<?php	
				if(isset($_SESSION["userid"])) {
					echo "<li><a href='profile.php'>Personal Vaccination Record</a></li>";
					echo "<li><a href='pass.php'>Change Password</a></li>";
					echo "<li><a href='includes/logout.inc.php'>Logout</a></li>";
				} else {
					echo "<a href='login.php'>Login</a>";
				}
			?>
        </div>
		<h1>Welcome to Vaccination Management System!</h1>
			<form action="search.php" method="POST">
		<input type="text" name="search" placeHolder="Search">
		<button type="submit" name="sub">Search</button>
	</form>
	</nav>