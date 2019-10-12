

<?php
//the database was created in phpmyadmin in xampp server where it had 3 coloms id, username and password
	// get values from login form
	$username =$_POST['user'];
	$password =$_POST['pass'];

	//to prevent mysql injection
	$username= stripcslashes($username);
	$password= stripcslashes($password);
	$username = mysql_real_escape_string($username);
	$password = mysql_real_escape_string($password);
	//connect tothe serverand select database
	mysql_connect("localhost","root","");
	mysql_select_db("login");

	//query the database for usr
	$result = mysql_query("select * from users where username ='$username' and password= '$password'")
	or die("Failedto query database".mysql_error());
	$row = mysql_fetch_array($result);
	if($row['username'] == $username && $row['password'] == $password){
	echo"Login succesfull Welcome " .$row['username'];
	}
	else{
		echo "failed to login";
	}
?>