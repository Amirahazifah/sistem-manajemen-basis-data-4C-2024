<?php
include 'Assets/Database/config.php';

$id = $_GET['id'];
$value = $_GET['value'];

if ($value == 'selesai') {
  mysqli_query($conn, "UPDATE transaksi SET status_order='SUCCESS' WHERE id_transaksi='$id'");
  header("location: admin.php");
} elseif ($value == 'tolak') {
  mysqli_query($conn, "UPDATE transaksi SET status_order='REJECTED' WHERE id_transaksi='$id'");
  header("location: admin.php");
} elseif ($value == 'terima') {
  mysqli_query($conn, "UPDATE transaksi SET status_order='PENDING' WHERE id_transaksi='$id'");
  header("location: admin.php");
}
