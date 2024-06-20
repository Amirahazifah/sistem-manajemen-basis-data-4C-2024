--1--
DELIMITER //

CREATE PROCEDURE DokterTerlaris(
    IN idDokter INT
)
BEGIN
    DECLARE namaDokter VARCHAR(255);
    DECLARE jumlahKunjungan INT;
    DECLARE jumlahKunjunganTerbanyak INT;

    SELECT nama_dokter
    INTO namaDokter
    FROM dokter
    WHERE id_dokter = idDokter;

    SELECT COUNT(*) INTO jumlahKunjunganTerbanyak
    FROM kunjungan
    GROUP BY id_dokter
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    SELECT COUNT(*)
    INTO jumlahKunjungan
    FROM kunjungan
    WHERE id_dokter = idDokter;

    IF jumlahKunjungan = jumlahKunjunganTerbanyak THEN
        SELECT CONCAT(namaDokter, ' adalah dokter dengan jumlah kunjungan terbanyak') AS hasil;
    ELSE
        SELECT CONCAT(namaDokter, ' bukan dokter dengan jumlah kunjungan terbanyak') AS hasil;
    END IF;
END //
DELIMITER ;

CALL DokterTerlaris(4102);

--2--
DELIMITER $$
CREATE PROCEDURE TampilkanPasien()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE max_id INT;
    
    SELECT MAX(id_pasien) INTO max_id FROM pasien;

    WHILE i <= 10 AND i <= max_id DO
        SELECT * FROM pasien WHERE id_pasien = i;
        SET i = i + 1;
    END WHILE;
    
END$$
DELIMITER ;

CALL TampilkanPasien();
