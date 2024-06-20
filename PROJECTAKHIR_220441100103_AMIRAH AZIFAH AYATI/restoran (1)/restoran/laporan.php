<?php
error_reporting(0);

include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
  header("Location: Login.php");
  exit();
}

$tgl_awal = @$_POST['tgl_awal'];
$tgl_akhir = @$_POST['tgl_akhir'];

if(isset($_POST['cek'])){
  $rekaps = mysqli_query($conn, "SELECT m.nama, p.kuantitas, p.total, t.tgl_pesan, t.status_order
                                  FROM menu m
                                  NATURAL JOIN pemesanan p
                                  NATURAL JOIN transaksi t
                                  WHERE m.id_menu = p.id_menu AND p.id_transaksi = t.id_transaksi AND t.status_order = 'SUCCESS' AND (t.tgl_pesan >= '$tgl_awal' AND t.tgl_pesan <= '$tgl_akhir')");
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LAPORAN | BELIYU'</title>
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
      <h2>Laporan Penjualan</h2>
      <hr>
      <form method="POST" action="">
        <span>From : </span>
        <input type="date" name="tgl_awal" id="tgl_awal" value="<?php echo $tgl_awal ?>">
        <span> &nbsp; To : </span>
        <input type="date" name="tgl_akhir" id="tgl_akhir" value="<?php echo $tgl_akhir ?>">
        &nbsp;
        <input type="submit" name="cek" id="cek" value="Cek" style="background-color: #26a347; color: #ffffff; border: 1px solid #26a347; border-radius: 20px;">
      </form>
      <table class="table table-bordered border-secondary text-center" style="margin-top: 30px;">
          <thead class="table-dark">
            <th>Tanggal</th>
            <th>Menu</th>
            <th>Kuantitas</th>
            <th>Total Harga Terjual</th>
          </thead>
          <?php $total_rekap = 0?>
          <?php foreach($rekaps as $rekap){ ?>
          <tr>
            <td><?php echo $rekap['tgl_pesan'] ?></td>
            <td><?php echo $rekap['nama'] ?></td>
            <td><?php echo $rekap['kuantitas'] ?></td>
            <td><?php echo "Rp. ".$rekap['total'] ?></td>
            <?php //$x = $rekap['total']; $total_rekap = $total_rekap + $x;?>
          </tr>
          <?php } ?>
          <?php 
            $query_sql = mysqli_query($conn, "CALL total_terjual()");
            $row = mysqli_fetch_assoc($query_sql);
            $total_terjual = $row['totalakhir']; 
          ?>
          <tr>
            <td colspan="3" class="fw-bold">Total</td>
            <!-- <td><?php //echo "Rp. ".$total_rekap; ?></td> -->
            <td><?php echo "Rp. ".$total_terjual; ?></td>
          </tr>
      </table>
    </div>
  </div>
</body>

</html>