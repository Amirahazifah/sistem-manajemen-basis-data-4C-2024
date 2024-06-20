<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
    header("Location: Login.php");
    exit();
}

$id_transaksi = $_GET['id_transaksi'];
$data = query("SELECT * FROM transaksi WHERE id_transaksi = $id_transaksi");
$pemesanan = query(
    "SELECT * FROM pemesanan INNER JOIN menu 
     ON pemesanan.id_menu = menu.id_menu
     WHERE pemesanan.id_transaksi = $id_transaksi
    "
);
$rate = query("SELECT * FROM rating WHERE id_transaksi = $id_transaksi");
$exist = query("SELECT COUNT(*) FROM rating WHERE id_transaksi = $id_transaksi ");





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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.0/css/bootstrap.min.css" integrity="sha384-SI27wrMjH3ZZ89r4o+fGIJtnzkAnFs3E4qz9DIYioCQ5l9Rd/7UAa8DHcaL8jkWt" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- Rate Star -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">

    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/style.css">
    <link rel="stylesheet" href="Assets/Css/heading.css" type="text/css" />
    <link rel="stylesheet" href="Assets/Css/history.css" type="text/css" />

</head>

<body>
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


    <div class="container" style="margin-top: -2rem;">
        <div class="row">
            <div class="col-md-9">
                <h2>Detail History </h2>
            </div>
        </div>


        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="card">
                            <div class="card-body">
                                <?php
                                if ($data[0]['status_order'] != 'SUCCESS') {
                                ?>
                                    <table cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <h4>No Pemesanan </h4>
                                            </td>
                                            <td>
                                                <h4> : <?php echo $data[0]['id_transaksi']; ?></h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h4>Tanggal Pemesanan </h4>
                                            </td>
                                            <td>
                                                <h4> : <?php echo tgl_indo($data[0]['tgl_pesan']); ?></h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h4>Status Order </h4>
                                            </td>
                                            <td>
                                                <h4> : <?php echo $data[0]['status_order']; ?></h4>
                                            </td>
                                        </tr>
                                    </table>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h5>Menu</h5>
                                        </div>
                                        <div class="col-sm-6">
                                            <h5 class="float-right">Total</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <?php foreach ($pemesanan as $pemesanan) : ?>
                                            <div class="col-sm-6">
                                                <h6><?php echo $pemesanan['nama']; ?> [ <?php echo number_format($pemesanan['harga_barang']); ?> x <?php echo $pemesanan['kuantitas']; ?> ]</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <h6 class="float-right">Rp<?php echo number_format($pemesanan['total']); ?></h6>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h5>Subtotal</h5>
                                            <h5>Ongkos Kirim</h5>
                                        </div>
                                        <div class="col-sm-6">
                                            <h6 class="text-end">Rp<?php echo number_format($data[0]['sub_total']); ?></h6>
                                            <h6 class="text-end">Rp<?php echo number_format($data[0]['ongkir']); ?></h6>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h5>Total</h5>
                                        </div>
                                        <div class="col-sm-6">
                                            <h5 class="text-end text-danger">Rp<?php echo number_format($data[0]['total_harga']); ?></h5>
                                        </div>
                                    </div>
                                    <hr>
                                    <h6>Alamat : <?php echo $data[0]['address']; ?></h6>
                                    <a href="history.php" class="btn btn-secondary mt-3">Kembali</a>
                                <?php
                                } else {
                                ?>
                                    <table cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <h4>No Pemesanan </h4>
                                            </td>
                                            <td>
                                                <h4> : <?php echo $data[0]['id_transaksi']; ?></h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h4>Tanggal Pemesanan </h4>
                                            </td>
                                            <td>
                                                <h4> : <?php echo tgl_indo($data[0]['tgl_pesan']); ?></h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <h4>Status Order </h4>
                                            </td>
                                            <td>
                                                <h4> : <?php echo $data[0]['status_order']; ?></h4>
                                            </td>
                                        </tr>
                                    </table>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h5>Menu</h5>
                                        </div>
                                        <div class="col-sm-6">
                                            <h5 class="float-right">Total</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <?php foreach ($pemesanan as $pemesanan) : ?>
                                            <div class="col-sm-6">
                                                <h6><?php echo $pemesanan['nama']; ?> [ <?php echo number_format($pemesanan['harga_barang']); ?> x <?php echo $pemesanan['kuantitas']; ?> ]</h6>
                                            </div>
                                            <div class="col-sm-6">
                                                <h6 class="float-right">Rp<?php echo number_format($pemesanan['total']); ?></h6>
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h5>Subtotal</h5>
                                            <h5>Ongkos Kirim</h5>
                                        </div>
                                        <div class="col-sm-6">
                                            <h6 class="text-end">Rp<?php echo number_format($data[0]['sub_total']); ?></h6>
                                            <h6 class="text-end">Rp<?php echo number_format($data[0]['ongkir']); ?></h6>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <h5>Total</h5>
                                        </div>
                                        <div class="col-sm-6">
                                            <h5 class="text-end text-danger">Rp<?php echo number_format($data[0]['total_harga']); ?></h5>
                                        </div>
                                    </div>
                                    <hr>
                                    <h6>Alamat : <?php echo $data[0]['address']; ?></h6>
                                    <form action="rateProses.php" class="float-right">
                                        <?php
                                        if ($exist[0]['COUNT(*)'] == 0) {
                                        ?>
                                            <div id="rateYo"></div>
                                        <?php
                                        } else {
                                        ?>
                                            <div id="rateYo" data-rateyo-rating="<?php echo $rate[0]['rate_value'] ?>" data-rateyo-read-only="true"></div>

                                        <?php
                                        }
                                        ?>
                                        <input type="hidden" name="id_transaksi" value="<?php echo $id_transaksi ?>">

                                        <input type="hidden" name="rating" value="<?php echo $rate[0]['rate_value']; ?>">
                                    </form>

                                    <a href="history.php" class="btn btn-secondary mt-3">Kembali</a>
                                <?php
                                }
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>





    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Rate Star Jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
    <script>
        $(function() {

            $("#rateYo").rateYo({

                onSet: function(rating, rateYoInstance) {

                    // insert into rating table from rating value
                    $.ajax({
                        url: "rateProses.php",
                        type: "POST",
                        data: {
                            rating: rating,
                            id_transaksi: <?php echo $id_transaksi ?>
                        },
                        // if success alert success message
                        success: function(data) {
                            alert("Rate Berhasil Disimpan");
                            window.location.reload();

                        }


                    });
                }
            });
        });
    </script>


</body>


</html>