<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
    header("Location: Login.php");
    exit();
}




if (isset($_POST['Order'])) {

    global $conn;
    mysqli_begin_transaction($conn);

    try {
        if (!empty($_SESSION['cart'])) {

            $address = $_POST['address'];

            // get id user from session
            $user = query("SELECT * FROM user WHERE username = '$_SESSION[user]'");

            // check if table is empty set id_pesan to 1, else set id_pesan + 1
            $cek = query("SELECT * FROM pemesanan");

            // get last id_pesan from table pesanan
            $get_id = query("SELECT * FROM pemesanan ORDER BY id_pesan DESC LIMIT 1");

            // get data from cart session
            $id_transaksi = rand(9999999999, 1111111111);
            $ongkir =  8000;
            $sub_total = 0;
            foreach ($_SESSION["cart"] as $keys => $values) {
                // get id user from session
                $user = query("SELECT * FROM user WHERE username = '$_SESSION[user]'");
                $id_user = $user[0]['id_user'];
                $id_menu =  $values['id'];
                $jumlah = $values['jumlah'];
                $harga = $values['harga'];
                $total = $jumlah * $harga;
                // insert data to order table
                $sub_total = $sub_total + $values['Total'];
                $query = "INSERT INTO pemesanan VALUES ('',$id_user, $id_menu, $id_transaksi, $jumlah, $harga, $total)";
                mysqli_query($conn, $query);
                // if jumlah is 0 execute mysqli_rollback
                if ($jumlah == 0) {
                    mysqli_rollback($conn);
                    header("Location: user.php");
                    exit();
                }
            }
            mysqli_commit($conn);
            echo "<script>alert('Order Success');</script>";
            add_transaksi($id_transaksi, $user[0]['id_user'], $sub_total, $ongkir, $address);
            unset($_SESSION['cart']);
        } else {
            echo "<script>alert('Cart Kosong');document.location.href = 'user.php'</script>";
        }
    } catch (mysqli_sql_exception $exception) {
        mysqli_rollback($conn);
        // set error message
        echo "Something Error With: " . $exception->getMessage();
    }
}

if (isset($_POST['add_to_cart'])) {

    $stock = query("SELECT stock FROM menu WHERE id_menu = '$_POST[id]'");
    if ($_POST['quantity'] > $stock[0]['stock']) {
        echo "<script>alert('Stock tidak mencukupi');document.location.href = 'user.php'</script>";
    } else {
        if (isset($_SESSION['cart'])) {

            $session_array_id = array_column($_SESSION['cart'], 'id');
            if (!in_array($_POST['id'], $session_array_id)) {
                $session_array = array(
                    'id' => $_POST['id'],
                    'nama' => $_POST['nama'],
                    'harga' => $_POST['harga'],
                    'jumlah' => $_POST['quantity'],
                    'Total' => $_POST['harga'] * $_POST['quantity'],
                );
                // update stock menu
                $id_menu = $_POST['id'];
                $jumlah = $_POST['quantity'];
                $query = "UPDATE menu SET stock = stock - $jumlah WHERE id_menu = $id_menu";
                mysqli_query($conn, $query);
                $_SESSION['cart'][] = $session_array;
            } else {

                $i = count($_SESSION['cart']);
                for ($x = 0; $x < $i; $x++) {

                    if ($_SESSION['cart'][$x]['id'] == $_POST['id']) {

                        $jml_baru = $_POST['quantity'] + $_SESSION['cart'][$x]['jumlah'];
                        $_SESSION['cart'][$x]['jumlah'] = $jml_baru;
                        $total = $_POST['harga'] * $_POST['quantity'];
                        $total_baru = $total + $_SESSION['cart'][$x]['Total'];
                        $_SESSION['cart'][$x]['Total'] = $total_baru;
                    }
                }
                // update stock menu
                $id_menu = $_POST['id'];
                $jumlah = $_POST['quantity'];
                $query = "UPDATE menu SET stock = stock - $jumlah WHERE id_menu = $id_menu";
                mysqli_query($conn, $query);
            }
        } else {
            if ($_POST['quantity'] > $stock[0]['stock']) {
                echo "<script>alert('Stock tidak mencukupi');document.location.href = 'user.php'</script>";
            } else {
                $session_array = array(
                    'id' => $_POST['id'],
                    'nama' => $_POST['nama'],
                    'harga' => $_POST['harga'],
                    'jumlah' => $_POST['quantity'],
                    'Total' => $_POST['harga'] * $_POST['quantity'],
                );
                // update stock menu
                $id_menu = $_POST['id'];
                $jumlah = $_POST['quantity'];
                $query = "UPDATE menu SET stock = stock - $jumlah WHERE id_menu = $id_menu";
                mysqli_query($conn, $query);


                $_SESSION['cart'][] = $session_array;
            }
        }
    }
}


$menu_makanan = query("SELECT * FROM view_menu_makanan");

$menu_minuman = query("SELECT * FROM view_menu_minuman");


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Restoran</title>

    <!-- Booststrap -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://cdn.jsdelivr.net/npm/fastbootstrap@2.2.0/dist/css/fastbootstrap.min.css" rel="stylesheet" integrity="sha256-V6lu+OdYNKTKTsVFBuQsyIlDiRWiOmtC8VQ8Lzdm2i4=" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet" />

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">


    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/style.css">
    <link rel="stylesheet" href="Assets/Css/heading.css" type="text/css" />
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

    <div class="main-admin">
        <section id="portfolio" class="portfolio" style="padding: 0 2rem;">

        <!-- <ul class="nav nav-tabs container d-flex justify-content-around" role="tablist" style="margin-top: -1.8rem;">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="simple-tab-0" data-bs-toggle="tab" href="#simple-tabpanel-0" role="tab" aria-controls="simple-tabpanel-0" aria-selected="true" style="font-size: 1.5rem; color: green;"><i class="bi bi-egg-fried"></i> Makanan</a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="simple-tab-1" data-bs-toggle="tab" href="#simple-tabpanel-1" role="tab" aria-controls="simple-tabpanel-1" aria-selected="false" style="font-size: 1.5rem; color: green;"><i class="bi bi-cup-straw"></i> Minuman</a>
            </li>
        </ul> -->
        <!-- <div class="tab-content pt-5 container-fluid" id="tab-content">
            <div class="tab-pane active" id="simple-tabpanel-0" role="tabpanel" aria-labelledby="simple-tab-0">
                <div class="container-fluid" data-aos="fade-up"> -->

                    <header class="section-header">
                        <p>Daftar Makanan</p>
                    </header>

                    <div class="row ">
                        <?php
                        $i = 1;
                        foreach ($menu_makanan as $menu_1) {
                            if ($menu_1['stock'] > 0) {
                        ?>
                                <div class="col-lg-3 col-md-6 portfolio-item">
                                    <form action="" method="POST">
                                        <input type="hidden" name="id" id="id" value="<?php echo $menu_1['id_menu']; ?>">
                                        <input type="hidden" name="nama" id="nama" value="<?php echo $menu_1['nama']; ?>">
                                        <input type="hidden" name="harga" id="harga" value="<?php echo $menu_1['harga']; ?>">
                                        <input type="hidden" name="disc" id="disc" value="<?php echo $menu_1['discount']; ?>">
                                        <input type="hidden" name="hdisc" id="hdisc" value="<?php echo $menu_1['harga_disc']; ?>">
                                        <input type="hidden" name="gambar" value="<?php echo $menu_1['gambar']; ?>">
                                        <div class="portfolio-wrap">
                                            <img src="Assets/imgUpload/<?php echo $menu_1['gambar']; ?>" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4><?php echo $menu_1['nama'];
                                                    echo " : ", $menu_1['stock']; ?></h4>
                                                <div class="portfolio-links">
                                                    <button type="button" name="submit" id="submit" title="pesan" style="background-color: #2da00d;"><i class="fa-solid fa-basket-shopping" data-toggle="modal" data-target="#exampleModal"></i></i></button>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form method="POST">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input type="hidden" name="id" id="idQ" value="">
                                                            <input type="hidden" name="nama" id="namaQ" value="">
                                                            <input type="hidden" name="harga" id="hargaQ" value="">
                                                            <label for="quantity" class="col-form-label">Jumlah :</label>
                                                            <input type="number" min="1" max="99" name="quantity" class="form-control" id="quantity" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <input type="submit" class="btn btn-primary" name="add_to_cart" value="ADD TO CART">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                        <?php $i++;
                            }
                        }
                        ?>
                    </div>


                <!-- </div>
            </div> -->
            <!-- <div class="tab-pane" id="simple-tabpanel-1" role="tabpanel" aria-labelledby="simple-tab-1">
                <div class="container-fluid" data-aos="fade-up"> -->

                    <header class="section-header">
                        <p>Daftar Minuman</p>
                    </header>

                    <div class="row ">
                        <?php
                        $i = 1;
                        foreach ($menu_minuman as $menu_2) {
                            if ($menu_2['stock'] > 0) {
                        ?>
                                <div class="col-lg-3 col-md-6 portfolio-item">
                                    <form action="" method="POST">
                                        <input type="hidden" name="id" id="id" value="<?php echo $menu_2['id_menu']; ?>">
                                        <input type="hidden" name="nama" id="nama" value="<?php echo $menu_2['nama']; ?>">
                                        <input type="hidden" name="harga" id="harga" value="<?php echo $menu_2['harga']; ?>">
                                        <input type="hidden" name="disc" id="disc" value="<?php echo $menu_2['discount']; ?>">
                                        <input type="hidden" name="hdisc" id="hdisc" value="<?php echo $menu_2['harga_disc']; ?>">
                                        <input type="hidden" name="gambar" value="<?php echo $menu_2['gambar']; ?>">
                                        <div class="portfolio-wrap">
                                            <img src="Assets/imgUpload/<?php echo $menu_2['gambar']; ?>" class="img-fluid" alt="">
                                            <div class="portfolio-info">
                                                <h4><?php echo $menu_2['nama'];
                                                    echo " : ", $menu_2['stock']; ?></h4>
                                                <div class="portfolio-links">
                                                    <button type="button" name="submit" id="submit" title="pesan" style="background-color: #2da00d;"><i class="fa-solid fa-basket-shopping" data-toggle="modal" data-target="#exampleModal"></i></i></button>

                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"></h5>

                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <form method="POST">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input type="hidden" name="id" id="idQ" value="">
                                                            <input type="hidden" name="nama" id="namaQ" value="">
                                                            <input type="hidden" name="harga" id="hargaQ" value="">
                                                            <label for="quantity" class="col-form-label">Jumlah :</label>
                                                            <input type="number" min="1" max="99" name="quantity" class="form-control" id="quantity" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        <input type="submit" class="btn btn-primary" name="add_to_cart" value="ADD TO CART">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                        <?php $i++;
                            }
                        }
                        ?>
                    </div>


                <!-- </div>
            </div>
        </div> -->


        </section>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="CartexampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Keranjang</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <?php
                                $output = "";
                                $output .= "
                    <table class='table table-bordered text-center  '>
                    <tr>
                    <th>Nama</th>
                    <th>Jmlah</th>
                    <th>Total</th>
                    <th>Action</th>
                    <tr>
                    ";

                                if (!empty($_SESSION["cart"])) {
                                    $total = 0;
                                    foreach ($_SESSION["cart"] as $keys => $values) {
                                        $output .= "
                            <tr>
                            <td>" . $values["nama"] . "</td>
                            <td>" . $values["jumlah"] . "</td>
                            <td>" . number_format($values["harga"] * $values["jumlah"]) . "</td>
                            <td>
                            <a href='user.php?action=delete&id=" . $values["id"] . "'> <button type='button' class='btn btn-danger'>Hapus</button></a>
                            </tr>
                            ";

                                        $total =  $total + ($values["harga"] * $values["jumlah"]);
                                    }
                                    $total = $total + 8000;

                                    $output .= "
                        <tr>
                        <td colspan='2'>Ongkir</td>
                        <td>" . number_format(8000) . "</td>
                        <td></td>
                        </tr>
                        <tr>
                        <td colspan='2'>Total</td>
                        <td>" . number_format($total) . "</td>
                        <td></td>
                        </tr>
                        ";
                                }
                                echo $output;
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">

                    <form method="POST">
                        <!-- <input type="hidden" name="Ongkir" value="<?php // echo $Ongkir ?>"> -->
                        <input class="form-control" type="text" name="address" placeholder="Alamat" required>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="Order">Order</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php
    if (isset($_GET['action'])) {
        if ($_GET['action'] == 'delete') {
            foreach ($_SESSION['cart'] as $keys => $values) {
                if ($values['id'] == $_GET['id']) {
                    unset($_SESSION['cart'][$keys]);
                    $sql = "UPDATE menu SET stock = stock + " . $values['jumlah'] . " WHERE id_menu = " . $_GET['id'];
                    $result = mysqli_query($conn, $sql);
                    echo "<script>alert('Item Removed')</script>";
                    echo "<script>window.location='user.php'</script>";
                }
            }
        }
    }
    ?>



    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script src="Assets\Js\process.js"></script>
</body>


</html>