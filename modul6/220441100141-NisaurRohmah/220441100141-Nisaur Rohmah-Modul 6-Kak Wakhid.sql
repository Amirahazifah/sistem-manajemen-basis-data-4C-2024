#1. Stored procedure untuk mengecek apakah departemen paling banyak diminati atau tidak
DELIMITER //

CREATE PROCEDURE CekDepartemenTerpopuler(
    IN id_departemen_input INT
)
BEGIN
    DECLARE jumlah_anggota INT;

    SELECT COUNT(*) INTO jumlah_anggota
    FROM anggota
    WHERE id_departemen = id_departemen_input;

    IF jumlah_anggota > 2 THEN
        SELECT CONCAT('Departemen dengan ID ', id_departemen_input, ' paling banyak diminati') AS STATUS;
    ELSE
        SELECT CONCAT('Departemen dengan ID ', id_departemen_input, ' tidak banyak diminati') AS STATUS;
    END IF;
END //

DELIMITER ;


CALL CekDepartemenTerpopuler(101);

#2. WHILE untuk menampilkan data dari tabel Mahasiswa masing masing dengan ID yang berurutan dari 1 hingga 10
DELIMITER //

CREATE PROCEDURE TampilkanMahasiswa()
BEGIN
    DECLARE id_saat_ini INT DEFAULT 1;
    DECLARE hasil TEXT DEFAULT '';

    WHILE id_saat_ini <= 10 DO

        SELECT CONCAT(hasil, 'ID: ', ID, ', Nama: ', Nama, '\n') INTO hasil
        FROM Mahasiswa
        WHERE ID = id_saat_ini;

        SET id_saat_ini = id_saat_ini + 1;
    END WHILE;

    SELECT hasil AS 'Data Mahasiswa';
END //

DELIMITER ;

CALL TampilkanMahasiswa;
