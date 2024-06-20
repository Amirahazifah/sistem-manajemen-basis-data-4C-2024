<?php
include 'Assets/Database/config.php';


// Login is clicked
if (isset($_POST["login"])) {


    $user = $_POST["username"];
    $pass = $_POST["password"];

    // Cek username and pass
    $query = "SELECT * FROM user WHERE username = '$user'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {

        $row = mysqli_fetch_assoc($result);

        // Check password verify hash
        if (password_verify($pass, $row["pass"])) {

            // set session username
            $_SESSION["user"] = $user;
            $_SESSION['id_user'] = $row['id_user'];


            // Check if user logged in as admin or user
            if ($row["role"] == "Admin") {
                echo "<script>alert('Login Sukses');document.location.href = 'admin.php'</script>";
            } else {
                echo "<script>alert('Login Sukses');document.location.href = 'user.php'</script>";

            }
        } else {

            $error = true;
        }
    } else {
        $error = true;
    }
}


?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300&display=swap" rel="stylesheet">

    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/Login.css">

    <title>Hello, world!</title>
</head>

<body>
    <div class="container position-absolute top-50 start-50 translate-middle">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow" style="width: 30rem;">
                    
                    <div class="card-body text-center fs-1">
                        Sign In
                        <form class="form-style-login" action="" method="post">
                            <div class="form-group mb-3 input-group-lg">
                                <input type="text" class="form-control " id="username" name="username" placeholder="Username" required>
                            </div>
                            <div class="form-group mb-3 input-group-lg">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                                <i class="fa-solid fa-eye position-absolute" id="togglePassword"></i>
                            </div>
                            <div class="form-group text-center d-grid input-group-lg mt-4">
                                <button type="submit" name="login" class="btn btn-block">Sign In</button>
                            </div>
                        </form>
                    </div>
                    <p class="text-center fw-bold">Belum punya akun ? <a href="register.php" style="letter-spacing: 1px; text-decoration:none; color :#1f946e;">Sign Up</a></p>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->
    <script src="Assets\Js\toggleEye.js.js"></script>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>

</html>