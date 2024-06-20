<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="Assets/Css/admin.css" type="text/css" />
</head>

<body>

<?php

include_once 'Assets/Database/config.php';

$badges_pending = mysqli_query($conn, 'SELECT * FROM badge_pending');
$badge_pending = mysqli_fetch_assoc($badges_pending);

$badges_sukses = mysqli_query($conn, 'SELECT * FROM badge_sukses');
$badge_sukses = mysqli_fetch_assoc($badges_sukses);

$badges_menu = mysqli_query($conn, 'SELECT * FROM badge_menu');
$badge_menu = mysqli_fetch_assoc($badges_menu);

$badges_user = mysqli_query($conn, 'SELECT * FROM badge_user');
$badge_user = mysqli_fetch_assoc($badges_user);

$badges_inbox = mysqli_query($conn, 'SELECT * FROM badge_inbox');
$badge_inbox = mysqli_fetch_assoc($badges_inbox);

?>
  <div class="sidebar">
    <div class="logo">
      <a href="#" class="text-white h5 mt-2">
        RESTORAN
      </a>
    </div>
    <div class="menu" style="margin-top: 2rem;">
      <a href="admin.php">
        <li>
          <i class="bi bi-house-door"></i> Home
          <span><?php echo $badge_pending['jumlah_pending']; ?></span>
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
      <a href="manage-user.php">
        <li>
          <i class="bi bi-people"></i> Manage User
          <span><?php echo $badge_user['jumlah_user']; ?></span>
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
      <a href="dataMenu.php">
        <li>
          <i class="bi bi-list"></i> Manage Menu
          <span><?php echo $badge_menu['jumlah_menu']; ?></span>
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
      <a href="history-admin.php">
        <li>
          <i class="bi bi-clock"></i> History
          <span><?php echo $badge_sukses['jumlah_sukses']; ?></span>
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
      <a href="inbox.php">
        <li>
          <i class="bi bi-chat"></i> Inbox
          <span><?php echo $badge_inbox['jumlah_inbox']; ?></span>
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
      <a href="laporan.php">
        <li>
          <i class="bi bi-book"></i> Laporan
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
      <a href="Logout.php" onclick="return confirm('Logout?')">
        <li>
          LOG OUT
          <i class="bi bi-chevron-right panah"></i>
        </li>
      </a>
    </div>
  </div>
</body>

</html>