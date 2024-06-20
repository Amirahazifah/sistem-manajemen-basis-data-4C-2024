--1--
DELIMITER //

CREATE PROCEDURE HitungHari(
    IN p_id_pasien INT,
    OUT p_hari INT,
    OUT p_nama_pasien VARCHAR(255)
)
BEGIN
    DECLARE transaksi_terakhir DATE;

    SELECT MAX(k.tanggal_kunjungan), p.nama_pasien
    INTO transaksi_terakhir, p_nama_pasien
    FROM kunjungan k
    JOIN pasien p ON k.id_pasien = p.id_pasien
    WHERE k.id_pasien = p_id_pasien;
    
    SET p_hari = DATEDIFF(CURDATE(), transaksi_terakhir);
END//
DELIMITER ;

CALL HitungHari(16, @hari, @nama_pasien);
SELECT @nama_pasien AS NamaPasien, @hari AS HitungHari;

--2--
DELIMITER //
CREATE PROCEDURE TransaksiBulanan(
	IN idDokter INT, 
	IN bulan INT, 
	IN tahun INT
)
BEGIN
    SELECT COUNT(*) AS JumlahTransaksi
    FROM pembayaran p
    JOIN kunjungan k ON p.id_kunjungan = k.id_kunjungan
    WHERE k.id_dokter = idDokter
      AND MONTH(p.tanggal_bayar) = bulan
      AND YEAR(p.tanggal_bayar) = tahun;
END //
DELIMITER ;

CALL TransaksiBulanan(4102, 3, 2024);

--3--
DELIMITER //
CREATE PROCEDURE AddKunjungan(
    IN p_id_pasien INT,
    IN p_id_dokter INT,
    IN p_id_ruang INT,
    IN p_keluhan TEXT
)
BEGIN
    INSERT INTO kunjungan (id_pasien, id_dokter, id_ruang, tanggal_kunjungan, keluhan)
    VALUES (p_id_pasien, p_id_dokter, p_id_ruang, CURRENT_DATE, p_keluhan);
END //
DELIMITER;

CALL AddKunjungan(1, 4105, 104, 'Sakit Kepala');