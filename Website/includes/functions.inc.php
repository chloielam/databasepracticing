<?php

function emptyLogin($username, $password) {
    $result; 
    if(empty($username) || empty($password)) {
        $result = true;
    } else {
        $result = false;
    }
    return $result;
}
function loginUser($conn, $username, $password) {
    $sql = "select user, authentication_string from mysql.user where user = '$username' and authentication_string = SHA2('$password', 256);";
    $result = mysqli_query($conn, $sql);
    $check = mysqli_num_rows($result);
    if($check == 0) {
        header("location: ../login.php?error=wronglogin");
        exit();
    } else {
        session_start();
        $_SESSION["userid"] = $username;
        header("location: ../index.php");
        exit();
    }
}

function emptyPass($pass, $pass1, $pass2) {
    $result; 
    if(empty($pass) || empty($pass1) || empty($pass2)) {
        $result = true;
    } else {
        $result = false;
    }
    return $result;
}

function changePass($conn, $pass, $pass1, $pass2) {
    session_start();
    $user = $_SESSION["userid"];
    $sql = "select user, authentication_string from mysql.user where user = '$user' and authentication_string = SHA2('$pass', 256);";
    $result = mysqli_query($conn, $sql);
    $check = mysqli_num_rows($result);
    if($check == 0) {
        header("location: ../pass.php?error=wrongpass");
        exit();
    } 
    if($pass1 != $pass2) {
        header("location: ../pass.php?error=wrongre");
        exit();
    }
    $sql1 = "UPDATE mysql.user SET authentication_string = SHA2('$pass1', 256) where user = '$user';";
    mysqli_query($conn, $sql1);
    header("location: ../index.php");
    exit();
}
