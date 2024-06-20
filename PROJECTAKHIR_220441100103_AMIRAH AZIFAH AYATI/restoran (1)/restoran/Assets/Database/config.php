<?php
// connection to database
$conn = mysqli_connect("localhost", "root", "", "restoran");

// start session
session_start();

function query($query)
{
    global $conn;

    $result = mysqli_query($conn, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }

    return $rows;
}

function registerUser($data)
{

    global $conn;
    $nama = $data['nama'];
    $username = $data['username'];
    $password = $data['password'];
    $cpassword = $data['cpassword'];
    $role = 'User';

    if ($password != $cpassword) {
        echo "<script>alert('Password tidak sama');</script>";
        return false;
    } else {
        $password = password_hash($password, PASSWORD_DEFAULT);
        $query = "INSERT INTO user VALUES('','$nama','$role','$username','$password')";
        mysqli_query($conn, $query);
        return mysqli_affected_rows($conn);
    }
}

function upload()
{
    $namaFile = $_FILES['gambar']['name'];
    $ukuranFile = $_FILES['gambar']['size'];
    $error = $_FILES['gambar']['error'];
    $tmpName = $_FILES['gambar']['tmp_name'];

    // cek apakah tidak ada gambar yang di upload
    if ($error === 4) {
        echo "<script>
        alert('pilih gambar terlebih dahulu');
        </script>";
        return false;
    }

    // cek apakah yang di upload adalah gambar
    $ekstensiGambarValid = ['jpg', 'jpeg', 'png', 'webp'];
    $ekstensiGambar = explode('.', $namaFile);
    $ekstensiGambar = strtolower(end($ekstensiGambar));
    if (!in_array($ekstensiGambar, $ekstensiGambarValid)) {
        echo "<script>
        alert('yang anda upload bukan gambar');
        </script>";
        return false;
    }

    // cek jika ukuran gambar terlalu besar
    if ($ukuranFile > 1000000) {
        echo "<script>
        alert('ukuran gambar terlalu besar');
        </script>";
        return false;
    }

    // lolos pengecekan, gambar siap di upload
    // generate nama gambar baru
    $namaFileBaru = uniqid();
    $namaFileBaru .= '.';
    $namaFileBaru .= $ekstensiGambar;

    move_uploaded_file($tmpName, 'Assets/imgUpload/' . $namaFileBaru);

    return $namaFileBaru;
}

function add_Menu($data)
{

    global $conn;

    $nama = $data['nama'];
    $category = $data['category'];
    $harga = $data['price'];
    $deskripsi = $data['deskripsi'];
    $stock = $data['stock'];
    $diskon = $data['discount'];

    // upload gambar
    $gambar = upload();
    if (!$gambar) {
        return false;
    }

    $harga_disc = $harga - ($diskon / 100 * $harga);
    
    $query = "CALL tambah_menu('$stock','$nama','$category', '$harga','$harga_disc','$diskon', '$deskripsi', '$gambar')";
    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function edit_Menu($data)
{
    global $conn;

    $nama = $data['nama'];
    $category = $data['category'];
    $harga = $data['price'];
    $deskripsi = $data['deskripsi'];
    $id = $data['id'];
    $gambarLama = $data['gambarLama'];
    $stock = $data['stock'];
    $diskon = $data['discount'];

    // cek apakah user pilih gambar baru atau tidak
    if ($_FILES['gambar']['error'] === 4) {
        $gambar = $gambarLama;
    } else {
        $gambar = upload();
    }

    $harga_disc = $harga -  ($diskon / 100 * $harga);


    $query = "CALL edit_menu('$id','$stock','$nama','$category','$harga','$harga_disc','$diskon','$deskripsi','$gambar')";
    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function Hapus_Menu($id, $gambar)
{
    global $conn;

    if (file_exists("Assets/imgUpload/$gambar")) {
        unlink("Assets/imgUpload/$gambar");
    }

    $query = "CALL hapus_menu('$id')";
    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function Hapus_user($id)
{
    global $conn;

    $query = "CALL hapus_user('$id')";
    $result = mysqli_query($conn, $query);

    return mysqli_affected_rows($conn);
}

function Order($id_user, $id_menu, $id_transaksi, $jumlah, $harga)
{
    global $conn;

    $total = $jumlah * $harga;

    $query = "CALL stored_order('$id_user', '$id_menu', '$id_transaksi', '$jumlah', '$harga', '$total')";
    $result = mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function add_transaksi($id_transaksi, $id_user, $sub_total, $ongkir, $address)
{
    global $conn;

    $total = $sub_total + $ongkir;
    $date = date("Y-m-d");
    $status = "ORDERING";

    $query = "CALL tambah_transaksi('$id_transaksi', '$id_user', '$sub_total', '$ongkir', '$total','$address', '$date', '$status')";

    $result = mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function addRate($data)
{
    global $conn;

    $id_transaksi = $data['id_transaksi'];
    $rate = $data['rating'];

    $query = "CALL tambah_rating('$id_transaksi', '$rate')";
    $result = mysqli_query($conn, $query);
    return mysqli_affected_rows($conn);
}

function tgl_indo($x)
{

    $a = explode('-', $x);
    $bulan = [
        "01" => "Januari",
        "02" => "Februari",
        "03" => "Maret",
        "04" => "April",
        "05" => "Mei",
        "06" => "Juni",
        "07" => "Juli",
        "08" => "Agustus",
        "09" => "September",
        "10" => "Oktober",
        "11" => "November",
        "12" => "Desember"
    ];

    return $a[2] . " " . $bulan[$a[1]] . " " . $a[0];
}
