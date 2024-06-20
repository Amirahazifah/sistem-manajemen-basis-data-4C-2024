<?php
include 'Assets/Database/config.php';

if (addRate($_POST) > 0) {
    echo "
        <script>
            alert('Berhasil Menambahkan Rating');
            document.location.href = 'index.php?page=detail_history&id=$id_transaksi';
        </script>
    ";
} else {
    echo "
        <script>
            alert('Gagal Menambahkan Rating');
            document.location.href = 'index.php?page=detail_history&id=$id_transaksi';
        </script>
    ";
}
