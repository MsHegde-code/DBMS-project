<?php
if(isset($_POST['fname'])){
    $server = "localhost";
    $username = "root";
    $password = "";

    $con = mysqli_connect($server, $username, $password);

    if(!$con){
        die("connect failed" . mysqli_connect_error());
    }
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];
    $phone = $_POST['phone'];
    $city = $_POST['city'];

    $sql = "INSERT INTO `dbms`.`registerform` (`fname`, `lname`, `email`, `password`, `date`, `gender`, `phone`, `city`, `date-in`) VALUES ('$fname', '$lname', '$email', '$password', '$dob', '$gender', '$phone', '$city', current_timestamp());";

    if($con->query($sql) == true){
        echo "successfully inserted";
    }
    else{
        echo "error inserting : $sql <br> $con->error";
    }

    $con->close();

}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans&display=swap"
      rel="stylesheet"
    /></head
  ><head>
    <title>register Page</title>
  </head>
  <body>
    <h2>OUR PROJECT NAME</h2>
    <hr />
    <link rel="stylesheet" href="register.css" />

    <div class="form-2">
      <h3>REGISTERATION FORM</h3>

      <form class="form" action="register.php" method="post">
        <div class="name">
          <label for="name">Name</label>
          <input id="fname" type="text" placeholder="  First Name" />
          <input id="lname" type="text" placeholder="  Last Name" />
          <br />
          <br />
        </div>
        <div class="email-grp">
          <label for="email">Email</label>
          <input
            type="email"
            name="email"
            id="email"
            placeholder="  youremail@domain.com"
          />
          <br /><br />
          <label for="password">Password</label>
          <input
            type="password"
            name="pass"
            id="password"
            placeholder="  ???????????????????????? "
          />
          <br />
          <br />
        </div>
        <div class="dob-sex-cont">
          <div class="dob">
            <label for="dob">Dob</label>
            <input type="date" name="dob" id="dob" />
          </div>
          <div class="gender">
            <label for="gender">Gender</label>
            <select name="gender" id="gender">
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="others">Others</option>
            </select>
          </div>
        </div>
        <br />

        <div class="city-phone-container">
          <div class="phone">
            <label for="ph">Phone</label>
            <input id="phone" type="text" />
          </div>
          <div class="city">
            <label for="city">City</label>
            <input id="city" type="text" />
          </div>

          <br /><br />
        </div>
        <br />
        <div class="submit">
          <button type="submit">SIGN UP</button>
        </div>
        <br />
        <div class="existing-user">
          <label for="existing-user">Already registered ??</label>
          <a href="../index.html">Click here</a>
        </div>
      </form>
    </div>
  </body>
</html>
