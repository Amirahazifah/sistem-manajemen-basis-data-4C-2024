<?php
include 'Assets/Database/config.php';


if (isset($_POST['simpan'])) {
    if (add_Menu($_POST) > 0) {
        echo "<script>alert('Data berhasil ditambah'); document.location.href = 'dataMenu.php' </script>";
    } else {

        echo "<script>alert('Data gagal ditambah'); document.location.href = 'dataMenu.php' </script>";
    }
}

?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300&display=swap" rel="stylesheet">

    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/Login.css">

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
                            <h2 class="title">Tambah Menu</h2>
                            <form method="POST" enctype="multipart/form-data">
                                <div class="input-group">
                                    <input class="input--style-2" type="text" placeholder="Nama Menu" name="nama" required>
                                </div>
                                <div class="form-check-inline">
                                    <input class="form-check-input" type="radio" name="category" id="Makanan" value="Makanan" required>
                                    <label class="form-check-label  input--style-2" for="category">
                                        Makanan
                                    </label>
                                </div>
                                <div class="form-check-inline">
                                    <input class="form-check-input " type="radio" name="category" id="Minuman" value="Minuman" required>
                                    <label class="form-check-label  input--style-2" for="category">
                                        Minuman
                                    </label>
                                </div>
                                <div class="input-group">
                                    <input class="input--style-2" type="number" placeholder="Harga Jual" name="price" required>
                                </div>
                                <div class="input-group">
                                    <input class="input--style-2" type="number" placeholder="Stock" name="stock" required>
                                </div>
                                <div class="input-group">
                                    <input class="input--style-2" type="number" placeholder="Discount (%)" name="discount" required>
                                </div>
                                <div class="form-floating">
                                    <textarea class="form-control" placeholder="Leave a comment here" name="deskripsi" required></textarea>
                                    <label for="floatingTextarea2">Deskripsi</label>
                                </div>
                                <div class="input-group">
                                    <input class="input--style-2" type="file" name="gambar" required>
                                </div>
                                <div class="p-t-30">
                                    <button class="btn btn--radius btn--green" type="submit" name="simpan">Tambah</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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