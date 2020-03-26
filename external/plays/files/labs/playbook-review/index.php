<?php
$servername = "localhost";
$username = "root";
// connection
$conn = mysqli_connect($servername, $username);
// check
if (!conn){
http_response_code(500);
} else {
http_response_code(200);
}
