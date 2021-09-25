<?php

/*For Verifying User through Session*/
/*
session_start();
require_once 'db.php';
$email=$SESSION["email"];
$sql="SELECT * FROM users WHERE email='$email'";
$query=$conn->query($sql); //Variable conn is the Database Connection
//$conn= new mysqli("DBHOST","DBUSER","DBPASS","DBNAME") or die($conn->connect_error); (Stored in either functions.php or db.php)
$result=$query->fetch_assoc();
$user=$result['cp_username'];
$hostname=$result['server'];
*/

/*API Login Below*/
//$hostname="server.example.com";
//$user = "root";
//$token = "API Token or Root Password";

$query = "https://$hostname:2087/json-api/create_user_session?api.version=1&user=$user&service=whostmgrd";

$curl = curl_init();
curl_setopt($curl, CURLOPT_SSL_VERIFYHOST,0);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER,0);
curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);

$header[0] = "Authorization: whm $user:$token";
curl_setopt($curl,CURLOPT_HTTPHEADER,$header);
curl_setopt($curl, CURLOPT_URL, $query);

$result = curl_exec($curl);

$http_status = curl_getinfo($curl, CURLINFO_HTTP_CODE);

if ($http_status != 200) {
  //echo "[!] Error: " . $http_status . " returned\n";
  echo "Auto-Login Failed. Please Contact Server Administrator";
} else {
    $json = json_decode($result, true);
    $login_url = $json['data']['url'];
    header(Location:$login_url);
}
curl_close($curl);
?>
