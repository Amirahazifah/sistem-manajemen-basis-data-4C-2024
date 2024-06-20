<?php
include 'Assets/Database/config.php';
$id_menu = $_GET['id_menu'];
$menu = query("SELECT * FROM menu WHERE id_menu = '$id_menu'")[0];


if (isset($_POST['simpan'])) {
    if (edit_Menu($_POST) > 0) {

        echo "<script>alert('Data berhasil ubah'); document.location.href = 'dataMenu.php' </script>";
    } else {

        echo "<script>alert('Data gagal ubah'); document.location.href = 'dataMenu.php' </script>";
    }
}

// $data = mysqli_fetch_array($menu);
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300&family=Poppins:wght@600&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300&display=swap" rel="stylesheet">

    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/main.css">

    <!-- Main CSS-->
    <link href="Assets/Css/Main.css" rel="stylesheet" media="all">
    <title>Hello, world!</title>
</head>


<body>
    <div class="main">
        <div>
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="main-admin" style="margin-top: -3.5rem;">
            <div class="page-wrapper p-t-90 p-b-100 ">
                <div class="wrapper wrapper--w960">
                    <div class="card card-2">
                        <div class="card-body">
                            <form class="login100-form validate-form" method="POST" enctype="multipart/form-data">
                                <span class="login100-form-title"> EDIT MENU </span>
                                <input type="hidden" name="id" value="<?php echo $menu['id_menu']; ?>">
                                <input type="hidden" name="gambarLama" value="<?php echo $menu['gambar']; ?>">

                                <div class="foto-fit">
                                    <img src="Assets/imgUpload/<?php echo $menu['gambar']; ?>">
                                </div>

                                <div class="wrap-input100">
                                    <input class="input100" type="text" name="nama" value="<?php echo $menu['nama']; ?>" required />
                                    <span class="focus-input100" data-placeholder="Nama"></span>
                                </div>

                                <div class="form-check-inline" style="margin-top: -2rem; margin-bottom: 2rem;">
                                    Kategori :
                                </div>
                                <div class="form-check-inline" style="margin-top: -2rem; margin-bottom: 2rem;">
                                    <input class="form-check-input" type="radio" name="category" id="Makanan" value="Makanan" required>
                                    <label class="form-check-label  input--style-2" for="category">
                                        Makanan
                                    </label>
                                </div>
                                <div class="form-check-inline" style="margin-top: -2rem; margin-bottom: 2rem;">
                                    <input class="form-check-input " type="radio" name="category" id="Minuman" value="Minuman" required>
                                    <label class="form-check-label  input--style-2" for="category">
                                        Minuman
                                    </label>
                                </div>

                                <div class="wrap-input100 ">
                                    <input class="input100" type="number" name="price" value="<?php echo $menu['harga']; ?>" required />
                                    <span class="focus-input100" data-placeholder="Price"></span>
                                </div>
                                <div class="wrap-input100">
                                    <input class="input100" type="number" value="<?php echo $menu['stock']; ?>" name="stock" required>
                                    <span class="focus-input100" data-placeholder="Stock"></span>
                                </div>
                                <div class="wrap-input100">
                                    <input class="input100" type="number" value="<?php echo $menu['discount']; ?>" name="discount" required>
                                    <span class="focus-input100" data-placeholder="Discount"></span>
                                </div>
                                <div class="wrap-input101 ">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a comment here" name="deskripsi" required><?php echo $menu['deskripsi']; ?></textarea>
                                        <label for="floatingTextarea2">Deskripsi</label>
                                    </div>
                                </div>

                                <div class="wrap-input101 ">
                                    <div class="">
                                        <input class="input--style-2" type="file" name="gambar">
                                    </div>
                                </div>

                                <div class="p-t-30">
                                    <button class="btn btn--radius btn--green" type="submit" name="simpan">Simpan</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="dropDownSelect1"></div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>



        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>

</html>