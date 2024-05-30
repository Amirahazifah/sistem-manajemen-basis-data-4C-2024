DELIMITER //
CREATE PROCEDURE CekMatapelajaranTerlaris(
IN idMatapelajaran INT
)
BEGIN
    DECLARE namaMatapelajaran VARCHAR(45);
    DECLARE jumlahNilai INT DEFAULT 0;
    DECLARE jumlahNilaiTerbanyak INT;
    DECLARE idTerlaris INT;

    SELECT mp.namaMatapelajaran, COUNT(n.idNilai) AS jumlahNilai
    INTO namaMatapelajaran, jumlahNilai
    FROM matapelajaran mp
    LEFT JOIN nilai n ON mp.idMatapelajaran = n.idMatapelajaran
    WHERE mp.idMatapelajaran = idMatapelajaran
    GROUP BY mp.idMatapelajaran;

    IF jumlahNilai = 0 THEN
        SELECT CONCAT(namaMatapelajaran, ' bukan mata pelajaran Favorit') AS hasil;
    ELSE
        SELECT n.idMatapelajaran, COUNT(n.idNilai) AS jumlahNilai
        INTO idTerlaris, jumlahNilaiTerbanyak
        FROM nilai n
        GROUP BY n.idMatapelajaran
        ORDER BY jumlahNilai DESC
        LIMIT 1;

        IF idMatapelajaran = idTerlaris THEN
            SELECT CONCAT(namaMatapelajaran, ' adalah mata pelajaran Favorit') AS hasil;
        ELSE
            SELECT CONCAT(namaMatapelajaran, ' bukan mata pelajaran Favorit') AS hasil;
        END IF;
    END IF;
END //
DELIMITER ;




DELIMITER //
CREATE PROCEDURE TampilkanDataSiswa()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE selesai INT DEFAULT 0;

    DROP TEMPORARY TABLE IF EXISTS temp_data_siswa;
    CREATE TEMPORARY TABLE temp_data_siswa (
        idSiswa INT,
        namaSiswa VARCHAR(45),
        alamat VARCHAR(45),
        tglLahir DATE,
        jenisKelamin ENUM('Laki-laki', 'Perempuan'),
        idKelas INT
    );

    WHILE i <= 10 AND selesai = 0 DO
        INSERT INTO temp_data_siswa
        SELECT idSiswa, namaSiswa, alamat, tglLahir, jenisKelamin, idKelas
        FROM siswa
        WHERE idSiswa = i;

        IF ROW_COUNT() = 0 THEN
            SET selesai = 1;
        END IF;

        SET i = i + 1;
    END WHILE;

    SELECT * FROM temp_data_siswa;
END//
DELIMITER ;


DROP PROCEDURE CekMatapelajaranTerlaris;
DROP PROCEDURE TampilkanDataSiswa;
CALL CekMatapelajaranTerlaris(2);
CALL TampilkanDataSiswa();

