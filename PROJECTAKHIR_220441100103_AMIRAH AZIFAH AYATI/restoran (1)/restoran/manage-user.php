<?php
include 'Assets/Database/config.php';

if (!isset($_SESSION['user'])) {
    header("Location: Login.php");
    exit();
}

// menjalankan perintah delete
if (isset($_POST['delete'])) {
    $id = $_POST['id_user'];
    hapus_user($id);
}

$user = query("SELECT * FROM view_user");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>



    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&family=Montserrat:wght@500&family=PT+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Assets/Css/admin.css" type="text/css">
</head>

<body>
    <div class="main">
        <div>
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="main-admin">
            <h2>Data User</h2>
            <hr>
            <table class="celled table" style="border-color: #000;">
                <thead>
                    <tr class="table-success text-center">
                        <th class="collapsing">No</th>
                        <th>Nama</th>
                        <th>Role</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="text-center">

                    <?php
                    // Menampilkan list
                    $i = 1;
                    foreach ($user as $user) { ?>
                        <tr class="header">
                            <td><?php echo $i ?></td>
                            <td><?php echo $user['nama'] ?></td>
                            <td><?php echo $user['role'] ?></td>
                            <td class="right aligned collapsing">
                                <form method="post" action="">
                                    <input type="hidden" name="id_user" value="<?php echo $user['id_user'] ?>">
                                    <ul class="list-inline m-0">
                                        <li class="list-inline-item">
                                            <button type="submit" class="btn btn-danger btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" name="delete" title="Delete"><i class="fa fa-trash"></i></button>
                                        </li>
                                    </ul>
                                </form>
                            </td>
                        </tr>
                    <?php $i++;
                    } ?>
                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>

</html>