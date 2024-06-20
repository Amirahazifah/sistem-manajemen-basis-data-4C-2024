DELIMITER //

CREATE PROCEDURE MataPelajaranTerbanyak(
    IN nama_mata_pelajaran VARCHAR(255)
)
BEGIN
    DECLARE jumlah_pelajaran INT;
    DECLARE terbanyak BOOLEAN;

    -- Menghitung jumlah guru yang mengajar mata pelajaran yang diberikan
    SELECT (*) INTO jumlah_pelajaran
    FROM Teachers
    WHERE mata_pelajaran = nama_mata_pelajaran;

    -- Menentukan apakah mata pelajaran tersebut merupakan yang paling sering diajar
    IF jumlah_pelajaran > 2 THEN
        SET terbanyak = TRUE;
    ELSE
        SET terbanyak = FALSE;
    END IF;

    -- Menampilkan hasil
    IF terbanyak THEN
        SELECT CONCAT('Mata pelajaran ', nama_mata_pelajaran, ' adalah yang paling sering diajar oleh guru') AS hasil;
    ELSE
        SELECT CONCAT('Mata pelajaran ', nama_mata_pelajaran, ' bukan yang paling sering diajar oleh guru') AS hasil;
    END IF;
END //

DELIMITER ;

CALL MataPelajaranTerbanyak('IPA');
CALL MataPelajaranTerbanyak('Kimia');

-- no 2
DELIMITER //
CREATE PROCEDURE TampilkanDataMahasiswa()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE selesai INT DEFAULT 0; 

    -- Membuat temporary table untuk menyimpan data mahasiswa
    DROP TEMPORARY TABLE IF EXISTS temp_data_mahasiswa;
    CREATE TEMPORARY TABLE temp_data_mahasiswa (
        student_id INT,
        nama_siswa VARCHAR(50),
        alamat VARCHAR(100),
        tanggal_lahir DATE
    );

    -- Melakukan loop untuk mengambil data mahasiswa dengan ID 1 hingga 10
    WHILE i <= 10 AND selesai = 0 DO
        INSERT INTO temp_data_mahasiswa
        SELECT student_id, nama_siswa, alamat, tanggal_lahir
        FROM Students
        WHERE student_id = i;

        -- Memeriksa apakah data ditemukan
        IF ROW_COUNT() = 0 THEN
            SET selesai = 1; -- Jika tidak ada data, set flag selesai menjadi 1
        END IF;
        SET i = i + 1; -- Increment nilai i
    END WHILE;

    -- Menampilkan hasil dari temporary table
    SELECT * FROM temp_data_mahasiswa;
END//
DELIMITER ;

CALL TampilkanDataMahasiswa();

-- view untuk mrlihat data yang sudah melekat di tabel
-- temporary tabel itu tabel banyangan dalam artian tabelnya tidak ada tapijika di butuhkan bisa di buat