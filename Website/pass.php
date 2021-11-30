<?php
	include_once 'header.php';
?>

<section class="login-form">
    <h2>Change password</h2>
    <form action="includes/pass.inc.php" method="post">
        <input type="password" name="old" placeholder="Current password">
        <input type="password" name="new" placeholder="New password">
        <input type="password" name="renew" placeholder="Re-enter new password">
        <button type="submit" name="submit">Submit</button>
    </form>
    <?php
    if(isset($_GET["error"])) {
        if($_GET["error"] == "emptyinput") {
            echo "<p>Fill in all fields</p>";
        } else if($_GET["error"] == "wrongpass") {
            echo "<p>Your current password is incorrect</p>";
        } else if($_GET["error"] == "wrongre") {
            echo "<p>Your new password does not match</p>";
        }
    }
    ?>  
</section>

<?php
	include_once 'footer.php';
?>