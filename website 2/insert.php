<?php
$connection = mysql_connect("localhost", "root", ""); // Establishing Connection with Server
$db = mysql_select_db("colleges", $connection); // Selecting Database from Server
if(isset($_POST['submit'])){ // Fetching variables of the form which travels in URL
$user = $_POST['user'];
$email = $_POST['email'];
$mobile = $_POST['mobile'];
$pass = $_POST['pass'];
if($user !=''||$email !=''||$pass !=''){
//Insert Query of SQL
$query = mysql_query("insert into user(user, email, mobile, pass) values ('$user', '$email', '$mobile', '$pass')");
echo "<br/><span>Data Inserted successfully...!!</span>";
}
else{
echo "<p>Insertion Failed <br/> Some Fields are Blank....!!</p>";
}
}
?>