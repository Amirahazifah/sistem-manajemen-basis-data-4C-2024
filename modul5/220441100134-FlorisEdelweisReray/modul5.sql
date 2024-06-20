-1
DELIMITER //

CREATE PROCEDURE MenghitungHari(
    IN p_id_tamu INT,
    OUT p_hari INT,
    OUT p_nama_tamu TEXT
)
BEGIN
    DECLARE transaksi_terakhir DATE;
    
    SELECT MAX(p.Tanggal_Checkout), t.Nama_Tamu
    INTO transaksi_terakhir, p_nama_tamu
    FROM Pemesanan p
    JOIN Tamu t ON p.ID_Tamu = t.ID_Tamu
    WHERE p.ID_Tamu = p_id_tamu;

    SET p_hari = DATEDIFF(CURDATE(), transaksi_terakhir);
END//
DELIMITER ;

CALL MenghitungHari(8, @hari, @nama_tamu);
SELECT @hari AS MenghitungHari, @nama_tamu AS NamaTamu;

-2
DELIMITER //

CREATE PROCEDURE PemesananSebulan(
    IN tipe_kamar VARCHAR(50), 
    IN bulan INT, 
    IN tahun INT
)
BEGIN
    SELECT COUNT(*) AS JumlahTransaksi
    FROM Pemesanan p
    JOIN Kamar k ON p.ID_Kamar = k.ID_Kamar
    WHERE k.Tipe_Kamar = tipe_kamar
      AND MONTH(p.Tanggal_Checkout) = bulan
      AND YEAR(p.Tanggal_Checkout) = tahun;
END //
DELIMITER ;

CALL PemesananSebulan('Superior Room', 2, 2024);

-3
DELIMITER //
CREATE PROCEDURE TambahPemesanan(
    IN p_Id_Pemesanan INT,
    IN p_Id_Tamu INT,
    IN p_Id_Kamar INT,
    IN p_Id_Fasilitas INT,
    IN p_haripesan INT
)
BEGIN
    INSERT INTO pemesanan (Id_Pemesanan, Id_Tamu, Id_Kamar, Id_Fasilitas, Tanggal_Checkin, Tanggal_Checkout)
    VALUES (p_Id_Pemesanan, p_Id_Tamu, p_Id_Kamar, p_Id_Fasilitas, CURRENT_DATE, CURRENT_DATE + p_haripesan);
END //
DELIMITER;

CALL TambahPemesanan(21, 21, 21, 21, 7);
