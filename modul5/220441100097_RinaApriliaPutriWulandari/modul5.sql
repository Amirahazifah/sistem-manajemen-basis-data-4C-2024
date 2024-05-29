#1
DELIMITER //

CREATE PROCEDURE HitungHariPeminjaman(
    IN p_id_peminjam INT,
    OUT p_hari_Terakhir INT,
    OUT p_nama_peminjam VARCHAR(255)
)
BEGIN
    DECLARE tgl_peminjaman_terakhir DATE;

    SELECT MAX(tgl_peminjaman), nama_peminjam INTO tgl_peminjaman_terakhir, p_nama_peminjam
    FROM transaksi a
    JOIN peminjam b ON a.id_peminjam = b.id_peminjam
    WHERE a.id_peminjam = p_id_peminjam;

    SET p_hari_Terakhir = DATEDIFF(CURDATE(), tgl_peminjaman_terakhir);
END//

DELIMITER ;

CALL HitungHariPeminjaman(1, @hari_terakhir, @nama_peminjam);
SELECT @hari_terakhir AS HitungHari, @nama_peminjam AS NamaPeminjam;


#2
DELIMITER //
CREATE PROCEDURE Bulan(
	IN p_id_barang INT, 
	IN bulan INT, 
	IN tahun INT
)
BEGIN
    SELECT COUNT(*) AS Jumlah_Transaksi
    FROM transaksi a
    JOIN barang b ON a.id_barang = b.id_barang
    WHERE b.id_barang = p_id_barang
      AND MONTH(tgl_peminjaman) = bulan
      AND YEAR(tgl_peminjaman) = tahun;
END //
DELIMITER ;

CALL Bulan(3, 1, 2024);


#3
DELIMITER //
CREATE PROCEDURE AddKolom(
    IN p_id_transaksi INT,
    IN p_id_barang INT,
    IN p_id_peminjam INT
)
BEGIN
    INSERT INTO transaksi (id_transaksi, tgl_peminjaman, id_barang, id_peminjam, tgl_pengembalian)
    VALUES (p_id_transaksi,CURRENT_DATE, p_id_barang, p_id_peminjam, CURRENT_DATE);
END //
DELIMITER;

CALL AddKolom(25, 10, 5);
SELECT * FROM transaksi;