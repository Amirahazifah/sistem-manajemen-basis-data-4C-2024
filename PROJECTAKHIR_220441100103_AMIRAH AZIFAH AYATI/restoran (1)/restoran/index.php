<?php
include 'Assets/Database/config.php';

if (isset($_SESSION['login'])) {
    echo "<script>alert('Login Terlebih Dahulu'); document.location.href = 'Login.php'</script>";
}

$menu = query("SELECT * FROM menu_by_idmenu");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    <!-- External CSS -->
    <link rel="stylesheet" href="Assets/Css/heading.css" type="text/css" />
    <link rel="stylesheet" href="Assets/Css/style.css">

    <title>Hello, world!</title>
</head>

<body>
    <nav>
        <div class="logo">
            <a href="index.php">
                <div class="text-white h5 mt-2">RESTORAN</div>
            </a>
        </div>
        <ul class="menu" style="width: 16%;">
            <li><a href="contactus.php">Kontak Kami</a></li>
            <li><a href="Login.php">Login</a></li>
        </ul>
    </nav>


    <div class="main-admin" style="margin-top: -1.5rem;">
        <section id="portfolio" class="portfolio">

            <div class="container-fluid" data-aos="fade-up">

                <header class="section-header">
                    <p>Daftar Menu</p>

                </header>

                <div class="row ">
                    <?php
                    $i = 1;
                    foreach ($menu as $menu) { ?>
                        <div class="col-lg-3 col-md-6 portfolio-item">
                            <form action="" method="POST">
                                <input type="hidden" name="id" value="<?php echo $menu['id_menu']; ?>">
                                <input type="hidden" name="gambar" value="<?php echo $menu['gambar']; ?>">
                                <div class="portfolio-wrap">
                                    <img src="Assets/imgUpload/<?php echo $menu['gambar']; ?>" class="img-fluid" alt="">
                                    <div class="portfolio-info">
                                        <h4><?php echo $menu['nama']; ?></h4>
                                        <div class="portfolio-links">
                                            <button type="button" name="pesan" title="pesan" style="background-color: #2da00d;"><i class="fa-solid fa-basket-shopping" data-toggle="modal" data-target="#exampleModal"></i></i></button>
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

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <h3>Silahkan Login Terlebih Dahulu</h3>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary"><a href="Login.php" style="text-decoration: none;color:#fff;">Login</a></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>