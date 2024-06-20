--In
DELIMITER//
CREATE PROCEDURE `data_dokter_berdasarkan_id`(
    IN id_dokter_param INT
)
BEGIN
    SELECT * FROM dokter WHERE id_dokter = id_dokter_param;
END//
CALL data_dokter_berdasarkan_id(4107);

--Out
DELIMITER //
CREATE PROCEDURE `total_dokter`(
    OUT total_dokter INT
)
BEGIN
    SELECT COUNT(*) INTO total_dokter FROM dokter;
END//
CALL total_dokter(@total);
SELECT @total;

--Inout
DELIMITER //
CREATE PROCEDURE `update_data_pasien`(
    INOUT id_pasien_input INT,
    IN nama_pasien_text TEXT,
    IN umur_pasien INT,
    IN jeni_kelamin_text VARCHAR(20),
    IN alamat_pasien VARCHAR(30)
)
BEGIN
    UPDATE pasien
    SET nama_pasien = nama_pasien_text,
        umur = umur_pasien,
        jeni_kelamin = jeni_kelamin_text,
        alamat = alamat_pasien
    WHERE id_pasien = id_pasien_input;
    
    SELECT 'Data pasien dengan ID ', id_pasien_input, ' berhasil diperbarui.';
END//
SET @id_pasien := 1;
CALL update_data_pasien(@id_pasien, 'Farhan', 30, 'Laki-laki', 'Jl. Hahihu');
SELECT * FROM pasien WHERE id_pasien = @id_pasien;

--tambah dataa
DELIMITER //
CREATE PROCEDURE `insert_data`(
    IN nama_pasien_text TEXT,
    IN umur_pasien INT,
    IN jeni_kelamin_text VARCHAR(20),
    IN alamat_pasien VARCHAR(30)
)
BEGIN
    INSERT INTO pasien (nama_pasien, umur, jeni_kelamin, alamat)
    VALUES (nama_pasien_text, umur_pasien, jeni_kelamin_text, alamat_pasien);
END//
CALL insert_data('Ahman', 25, 'Laki-laki', 'Jl. Telang');
SELECT * FROM pasien;

--update dataa
DELIMITER //
CREATE PROCEDURE `update_data`(
    IN id_pasien_input INT,
    IN nama_pasien_text TEXT,
    IN umur_pasien INT,
    IN jeni_kelamin_text VARCHAR(20),
    IN alamat_pasien VARCHAR(30)
)
BEGIN
    UPDATE pasien
    SET nama_pasien = nama_pasien_text,
        umur = umur_pasien,
        jeni_kelamin = jeni_kelamin_text,
        alamat = alamat_pasien
    WHERE id_pasien = id_pasien_input;
END//
CALL update_data(6, 'Ayu', 30, 'Perempuan', 'Jl. Ahmad Yani');
SELECT * FROM pasien;

--hapus dataa
DELIMITER //
CREATE PROCEDURE `delete_data`(
    IN id_pasien_input INT
)
BEGIN
    DELETE FROM pasien WHERE id_pasien = id_pasien_input;
END//
CALL delete_data(27);

