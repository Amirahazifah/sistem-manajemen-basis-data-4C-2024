<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
  header("Location: Login.php");
  exit();
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Log Menu | BeliYu'</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="Assets/Css/admin.css" type="text/css">
</head>

<body>
  <?php
    $logs = mysqli_query($conn, "SELECT * FROM log_menu_update");
  ?>
  <div class="main">
    <div>
      <?php include 'sidebar.php'; ?>
    </div>
    <div>
      <h2 class="mt-5">Log Menu</h2>
      <hr>
      <table class="table table-bordered text-center">
        <thead>
          <th>No.</th>
          <th>Nama Lama</th>
          <th>Nama Baru</th>
          <th>Harga Lama</th>
          <th>Harga Baru</th>
          <th>Tanggal Ubah</th>
          <th>Aksi</th>
        </thead>
        <?php $no = 1; ?>
        <?php foreach ($logs as $log) { ?>
          <tr>
            <td><?php echo $no++ ?>.</td>
            <td class="text-danger"><?php echo $log["nama_lama"] ?></td>
            <td class="text-primary"><?php echo $log["nama_baru"] ?></td>
            <td class="text-danger">Rp. <?php echo $log["harga_lama"] ?></td>
            <td class="text-primary">Rp. <?php echo $log["harga_baru"] ?></td>
            <td><?php echo $log["tanggal_ubah"] ?></td>
            <td><?php echo $log["aksi"] ?></td>
          </tr>
        <?php } ?>
      </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>