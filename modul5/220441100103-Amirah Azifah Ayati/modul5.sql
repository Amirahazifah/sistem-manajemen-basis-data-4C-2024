--1--
DELIMITER //
CREATE PROCEDURE HitungHariSejakTransaksiTerakhir(
	IN nama_konsumen VARCHAR(100),
	OUT p_hari INT
)
BEGIN
    DECLARE tanggal_transaksi_terakhir DATE;

    SELECT MAX(Jadwal_Penerbangan.Waktu_Tiba) INTO tanggal_transaksi_terakhir
    FROM Tiket_Penerbangan
    JOIN Jadwal_Penerbangan ON Tiket_Penerbangan.ID_Jadwal = Jadwal_Penerbangan.ID_Jadwal
    WHERE Tiket_Penerbangan.Nama_Penumpang = nama_konsumen;
    
    SET p_hari = DATEDIFF(CURDATE(), tanggal_transaksi_terakhir);
END //
DELIMITER ;
SET @hari_sejak_transaksi_terakhir = 0;
CALL HitungHariSejakTransaksiTerakhir('Ayu', @hari_sejak_transaksi_terakhir);
SELECT @hari_sejak_transaksi_terakhir;

--2--
DELIMITER $$

CREATE PROCEDURE JumlahTransaksiPerBulan(
    IN namaProduk VARCHAR(100),
    IN bulan INT
)
BEGIN
    SELECT COUNT(*) AS JumlahTransaksi
    FROM Pembayaran P
    JOIN Tiket_Penerbangan T ON P.ID_Tiket = T.ID_Tiket
    JOIN Jadwal_Penerbangan J ON T.ID_Jadwal = J.ID_Jadwal
    WHERE MONTH(J.Waktu_Berangkat) = bulan
      AND T.Nama_Penumpang = namaProduk;
END $$

DELIMITER ;
CALL JumlahTransaksiPerBulan('Joni Doe', 4);

--3--
DELIMITER //
DROP PROCEDURE IF EXISTS TambahMaskapai //
CREATE PROCEDURE TambahMaskapai(
    IN kode_maskapai VARCHAR(5),
    IN nama_maskapai VARCHAR(100),
    IN Tanggal_Ditambahkan DATETIME
)
BEGIN
    INSERT INTO Maskapai (Kode_Maskapai, Nama_Maskapai, Tanggal_Ditambahkan)
    VALUES (kode_maskapai, nama_maskapai, `Tanggal_Ditambahkan`);
END //
DELIMITER ;

CALL TambahMaskapai('MSK25', 'NAT AIRLINES', NOW());


