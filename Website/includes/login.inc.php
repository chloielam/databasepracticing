<?php

if(isset($_POST["submit"])) {
    $username = $_POST['user'];
    $password = $_POST['pass'];

    require_once 'db.inc.php';
    require_once 'functions.inc.php';

    if(emptyLogin($username, $password) !== false) {
        header("location: ../login.php?error=emptyinput");
        exit();
    }
    loginUser($conn, $username, $password);
} else {
    header("location: ../login.php");
    exit();
}