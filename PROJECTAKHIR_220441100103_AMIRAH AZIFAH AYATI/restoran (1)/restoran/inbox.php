<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
  header("Location: Login.php");
  exit();
}

$data_view = mysqli_query($conn,"SELECT * FROM vinbox");

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>KOTAK MASUK | BELIYU'</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/admin.css" type="text/css">
</head>

<body>

  <div class="main">
    <div>
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="main-admin">
      <h2>Kotak Masuk</h2>
      <hr>
      <table class="table table-bordered">
        <tr class="bg-success text-light">
          <th>No</th>
          <th>Nama</th>
          <th>Email</th>
          <th>Pesan</th>
        </tr>
        <?php $i = 1; ?>
        <?php foreach ($data_view as $View_Inbox) { ?>
          <tr>
            <td><?php echo $i;
                $i++; ?></td>
            <td><?php echo $View_Inbox['nama']; ?></td>
            <td><?php echo $View_Inbox['email']; ?></td>
            <td><?php echo $View_Inbox['message']; ?></td>
          </tr>
        <?php } ?>
      </table>
    </div>
  </div>
</body>

</html>