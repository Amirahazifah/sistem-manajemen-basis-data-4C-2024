<?php
include 'Assets/Database/config.php';
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <!-- External CSS -->
  <link rel="stylesheet" href="Assets/Css/style.css">
  <link rel="stylesheet" href="Assets/Css/heading.css" type="text/css" />
</head>

<body>

  <?php
  if (!isset($_SESSION['user'])) {
  ?>
    <nav>
      <div class="logo">
          <a href="index.php">
            <div class="text-white h5 mt-2">RESTORAN</div>
          </a>
      </div>
      <ul class="menu" style="width: 16%;">
        <li><a href="contactus.php">Kontak Kami</a></li>
        <li><a href="Login.php">Login</a></li>
      </ul>
    </nav>
  <?php
  } else { ?>
    <nav>
        <div class="logo">
            <a href="user.php">
                <div class="text-white h5 mt-2">RESTORAN</div>
            </a>
        </div>
        <ul class="menu">
            <li class="cart">
                <i class="bi bi-cart text-white" data-toggle="modal" data-target="#CartexampleModal"></i>
            </li>
            <li><a href="user.php">Menu</a></li>
            <li><a href="history.php">Riwayat Pembelian</a></li>
            <li><a href="contactus.php">Kontak Kami</a></li>
            <li><a href="Logout.php" onclick="return confirm('Logout?')">Log out</a></li>

        </ul>
    </nav>
  <?php }
  ?>
  <div class="container" style="width: 60%; margin-top: -3.5rem;">
    <div class="wrapper">
      <div class="row">
        <div class="col-12">
          <div class="message mb-5">
            <h4 class="text-center">HUBUNGI KAMI !</h4>
            <h5 class="text-center">Respon kalian perbaikan terbaik bagi kami</h5>
            <form action="contactusproses.php" method="post">
              <div class="form">
                <div>
                  <p>Nama</p>
                </div>
                <div>
                  <input type="text" name="nama" id="nama">
                </div>
                <div>
                  <p>Email</p>
                </div>
                <div>
                  <input type="text" name="email" id="email">
                </div>
                <div>
                  <p>Pesan anda</p>
                </div>
                <div>
                  <textarea name="pesan" id="pesan" rows="5"></textarea>
                </div>
              </div>
              <input type="submit" name="kirim" id="kirim" value="Kirim">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>