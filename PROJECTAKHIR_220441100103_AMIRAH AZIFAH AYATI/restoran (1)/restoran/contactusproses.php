<?php

include 'Assets/Database/config.php';

$nama = $_POST['nama'];
$email = $_POST['email'];
$pesan = $_POST['pesan'];

function alert()
{
  global $conn;
  if (mysqli_affected_rows($conn) > 0) {
    echo "<script> 
              alert('Pesan terkirim !') ;
              history.go(-1);            
          </script>";
  } else {
    echo "<script> 
              alert('Pesan gagal terkirim !') ;
              dhistory.go(-1);
          </script>";
  }
}

if (isset($_POST['kirim'])) {
  mysqli_query($conn, "INSERT INTO inbox(nama, email, message) VALUES ('$nama', '$email', '$pesan') ");
  alert();
}
