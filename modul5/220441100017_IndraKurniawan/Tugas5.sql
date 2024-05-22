
DELIMITER //
CREATE PROCEDURE HitungHariSejakAbsensiTerakhir(
IN siswaID INT
)
BEGIN
    DECLARE hariTerakhir INT;
    DECLARE namaSiswa VARCHAR(45);

    SELECT DATEDIFF(CURDATE(), MAX(tanggal))
    INTO hariTerakhir
    FROM absensi 
    WHERE idSiswa = siswaID;
    
    SELECT s.namaSiswa
    INTO namaSiswa
    FROM siswa s
    WHERE s.idSiswa = siswaID;
    
    SELECT namaSiswa AS NamaSiswa, hariTerakhir AS HariSejakAbsensiTerakhir;
END //
DELIMITER ;

DROP PROCEDURE HitungHariSejakAbsensiTerakhir;
CALL HitungHariSejakAbsensiTerakhir(11);




DELIMITER //

CREATE PROCEDURE JumlahAbsensiBulan(
    IN p_keterangan VARCHAR(45), 
    IN bulan INT, 
    IN tahun INT
)
BEGIN
    SELECT COUNT(*) AS JumlahAbsensi
    FROM absensi
    WHERE keterangan = p_keterangan AND MONTH(tanggal) = bulan AND YEAR(tanggal) = tahun;
END //

DELIMITER ;

DROP PROCEDURE JumlahAbsensiBulan;
CALL JumlahAbsensiBulan('Hadir', 4, 2024);



DELIMITER //

CREATE PROCEDURE tambah_data_absensi(
  IN idSiswa INT,
  IN keterangan VARCHAR(45)
)
BEGIN
  INSERT INTO absensi (idSiswa, tanggal, keterangan)
  VALUES (idSiswa, CURRENT_DATE, keterangan);
END//

DELIMITER ;

DROP PROCEDURE tambah_data_absensi;
CALL tambah_data_absensi(15, 'Hadir');


