<?php

if(isset($_POST["submit"])) {
    $pass = $_POST["old"];
    $pass1 = $_POST["new"];
    $pass2 = $_POST["renew"];

    require_once 'db.inc.php';
    require_once 'functions.inc.php';
    echo $username;
    if(emptyPass($pass, $pass1, $pass2) !== false) {
        header("location: ../pass.php?error=emptyinput");
        exit();
    }
    changePass($conn, $pass, $pass1, $pass2);
} else {
    header("location: ../pass.php");
    exit();
}