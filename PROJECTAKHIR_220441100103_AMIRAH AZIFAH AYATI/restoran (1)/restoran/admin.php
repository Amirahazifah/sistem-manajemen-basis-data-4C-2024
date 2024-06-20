<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
  header("Location: Login.php");
  exit();
}

$orders = mysqli_query($conn, "SELECT transaksi.*, user.nama FROM transaksi 
                                    INNER JOIN user ON transaksi.id_user = user.id_user
                                    WHERE transaksi.status_order != 'SUCCESS' && transaksi.status_order != 'REJECTED' 
                                    GROUP BY transaksi.id_transaksi");

$data = query("SELECT * FROM transaksi");

function jumlah_by_status($status_order_param){
  global $conn;

  $query1 = mysqli_query($conn, "CALL jumlah_data_by_statusorder('$status_order_param')");

  if ($query1) {
      $jumlah_sukses = mysqli_fetch_assoc($query1);
      echo $jumlah_sukses['total_by_status'];

      mysqli_free_result($query1);

      while (mysqli_more_results($conn) && mysqli_next_result($conn)) {
          if ($result = mysqli_store_result($conn)) {
              mysqli_free_result($result);
          }
      }
  } else {
      echo "Error: " . mysqli_error($conn);
  }
}


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
  <link rel="stylesheet" href="Assets/Css/admin.css" type="text/css">
</head>

<body>
  <div class="main">
    <div>
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="main-admin">
      <h2>Daftar Pesanan</h2>
      <hr>
      <div style="width: 100%; display: flex; align-items:center; justify-content: space-between; gap: 3.5rem; margin-bottom: 1rem;">
        <div style="width: 100%; display: flex; align-items:center; justify-content: space-between; padding: 10px 16px; border: 2px solid green; border-radius: 10px;">
          <div style="color: green; font-weight: bold;">SUCCESS</div>
          <div style="color: green; font-weight: bold;"><?php echo jumlah_by_status('sukses') ?></div>
        </div>
        <div style="width: 100%; display: flex; align-items:center; justify-content: space-between; padding: 10px 16px; border: 2px solid blue; border-radius: 10px;">
          <div style="color: blue; font-weight: bold;">PENDING</div>
          <div style="color: blue; font-weight: bold;"><?php echo jumlah_by_status('pending') ?></div>
        </div>
        <div style="width: 100%; display: flex; align-items:center; justify-content: space-between; padding: 10px 16px; border: 2px solid darkgrey; border-radius: 10px;">
          <div style="color: darkgrey; font-weight: bold;">ORDERING</div>
          <div style="color: darkgrey; font-weight: bold;"><?php echo jumlah_by_status('ordering') ?></div>
        </div>
        <div style="width: 100%; display: flex; align-items:center; justify-content: space-between; padding: 10px 16px; border: 2px solid red; border-radius: 10px;">
          <div style="color: red; font-weight: bold;">REJECTED</div>
          <div style="color: red; font-weight: bold;"><?php echo jumlah_by_status('reject') ?></div>
        </div>
      </div>
      <div class="row">
        <?php foreach ($orders as $order) { ?>
          <div class="col-6">
            <div class="order">
              <div class="identity">
                <h5><?php echo $order['nama'] . ' #' . $order['id_transaksi']; ?></h5>
                <?php
                  switch ($order['status_order']) {
                    case 'PENDING':
                      echo "<h5 class='pending text-primary'>" . $order['status_order'] . "</h5>";
                      break;
                    case 'REJECTED':
                      echo "<h5 class='batal text-danger'>" . $order['status_order'] . "</h5>";
                      break;
                    case 'SUCCESS':
                      echo "<h5 class='selesai text-succes'>" . $order['status_order'] . "</h5>";
                      break;
                    case 'ORDERING':
                      echo "<h5 class='selesai text-succes'>" . $order['status_order'] . "</h5>";
                      break;
                    default:
                      echo "<h5 class='status'>StatusNot_Found</h5>";
                  }
                ?>
              </div>
              <hr>
              <div class="card-body">
                <?php
                $id_transaksi =  $order['id_transaksi'];
                $items = query("SELECT * FROM pemesanan INNER JOIN menu ON pemesanan.id_menu = menu.id_menu INNER JOIN transaksi on pemesanan.id_transaksi = transaksi.id_transaksi WHERE pemesanan.id_transaksi = $id_transaksi");
                foreach ($items as $items) { ?>
                  <?php echo $items['nama'] . ' x ' . $items['kuantitas']  . '<br>'  ?>
                <?php }
                echo $items['address'] ?>
              </div>
            </div>
            <?php
            if ($order['status_order'] == 'PENDING') {
            ?>
              <div class="all-btn">
                <a href="adminproses.php?value=selesai&id=<?php echo $order['id_transaksi'] ?>" onclick="return confirm('Pesanan Selesai?')">
                  <button class="btn btn-primary">Selesai</button>
                </a>
                <a href="adminproses.php?value=tolak&id=<?php echo $order['id_transaksi'] ?>" onclick="return confirm('Tolak Pesanan?')">
                  <button class="btn btn-danger">Tolak</button>
                </a>
              </div>
            <?php
            } else {
            ?>
              <div class="all-btn">
                <a href="adminproses.php?value=selesai&id=<?php echo $order['id_transaksi'] ?>" onclick="return confirm('Pesanan Selesai?')">
                  <button class="btn btn-primary">Selesai</button>
                </a>
                <a href="adminproses.php?value=tolak&id=<?php echo $order['id_transaksi'] ?>" onclick="return confirm('Tolak Pesanan?')">
                  <button class="btn btn-danger">Tolak</button>
                </a>
                <a href="adminproses.php?value=terima&id=<?php echo $order['id_transaksi'] ?>" onclick="return confirm('Terima Pesanan?')">
                  <button class="btn btn-success">Terima</button>
                </a>
              </div>
            <?php } ?>

          </div>
        <?php } ?>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>