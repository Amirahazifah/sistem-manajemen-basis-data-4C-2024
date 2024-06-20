<?php
include 'Assets/Database/config.php';


if (!isset($_SESSION['user'])) {
    header("Location: Login.php");
    exit();
}
// menjalankan perintah edit
if (isset($_POST['edit'])) {
    $id_menu = $_POST['id'];
    header("Location: editMenu.php?id_menu=$id_menu");
    exit();
}

// menjalankan perintah delete
if (isset($_POST['delete'])) {
    $id_menu = $_POST['id'];
    $gambar = $_POST['gambar'];
    hapus_menu($id_menu, $gambar);
}

$menu = query("SELECT * FROM menu_by_idmenu");
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

    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/style.css">

    <title>Hello, world!</title>
</head>

<body>

    <div class="main">
        <div>
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="main-admin" style="margin-top: -3.5rem;">
            <section id="portfolio" class="portfolio">

                <div class="container" data-aos="fade-up">

                    <header class="section-header" style="display: flex; align-items:center; justify-content: space-between">
                        <p>Daftar Menu</p>
                        <div>
                            <a href="addMenu.php"><button type="button" class="btn" style="margin-right: 2rem;"><i class="fa-solid fa-plus"></i> Tambah Data</button></a>
                            <a href="log_menu.php"><button type="button" class="btn"><i class="bi bi-archive"></i> Log Menu</button></a>
                        </div>
                    </header>

                    <div class="row ">
                        <?php
                        $i = 1;
                        foreach ($menu as $menu) { ?>
                            <div class="col-lg-4 col-md-6 portfolio-item">
                                <form action="" method="POST">
                                    <input type="hidden" name="id" value="<?php echo $menu['id_menu']; ?>">
                                    <input type="hidden" name="gambar" value="<?php echo $menu['gambar']; ?>">
                                    <div class="portfolio-wrap">
                                        <img src="Assets/imgUpload/<?php echo $menu['gambar']; ?>" class="img-fluid" alt="">
                                        <div class="portfolio-info">
                                            <h4><?php echo $menu['nama'];
                                                echo " : ", $menu['stock']; ?></h4>
                                            <div class="portfolio-links">
                                                <button type="submit" name="edit" title="Edit"><i class="fa-solid fa-pen-to-square"></i></button>
                                                <button type="submit" name="delete" title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        <?php $i++;
                        }
                        ?>
                    </div>


                </div>

            </section>
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