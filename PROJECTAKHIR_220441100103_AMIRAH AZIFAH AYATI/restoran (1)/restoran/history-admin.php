<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
    header("Location: Login.php");
    exit();
}

$data = query("SELECT * FROM transaksi WHERE status_order='SUCCESS'");


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Document</title>

    <!-- Booststrap -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/style.css">
    <link rel="stylesheet" href="Assets/Css/heading.css" type="text/css" />
    <link rel="stylesheet" href="Assets/Css/history.css" type="text/css" />

</head>

<body>
    <div class="main">
        <div>
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="container" style="margin-top: -2.5rem;">
            <div class="section-title product__discount__title">
                <h2>History</h2>
            </div>
            <div class="row">
                <?php
                foreach ($data as $data) {
                ?>
                    <div class="col-md-6 mb-5">
                        <div class="card ">
                            <h5 class="card-header text-center">No. Pemesanan : <?php echo $data['id_transaksi']  ?></h5>
                            <div class="card-body">
                                <?php
                                $id_transaksi = $data['id_transaksi'];
                                $items = query(
                                    "SELECT * FROM pemesanan INNER JOIN menu 
                                     ON pemesanan.id_menu = menu.id_menu 
                                     WHERE pemesanan.id_transaksi = $id_transaksi"
                                );
                                foreach ($items as $items) { ?>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="latest-product__item__pic">
                                                <img src="Assets/imgUpload/<?php echo $items['gambar']; ?>" alt="" />
                                            </div>
                                        </div>
                                        <div class="col-md-7">
                                            <div class="latest-product__item__text">
                                                <span><?php echo $items['nama'] ?></span>
                                                <h6>Rp.<?php echo number_format($items['harga_barang'])  ?></h6>
                                                <div class="float-right">
                                                    <p class="float-right">x<?php echo $items['kuantitas']  ?></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                <?php
                                }
                                ?>

                                <p class="card-text">Total Pembayaran : <span class="font-weight-bold">Rp.<?php echo number_format($data['total_harga']);  ?></span></p>
                                <hr>
                                <a href="detail_history_admin.php?id_transaksi=<?php echo $data['id_transaksi']; ?>" class="btn btn-primary float-right">Detail Pesanan</a>
                            </div>
                        </div>
                    </div>
                <?php
                }
                ?>
            </div>
        </div>
    </div>


    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>


</html>