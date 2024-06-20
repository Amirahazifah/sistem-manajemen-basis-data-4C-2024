-- IN
DELIMITER /
CREATE PROCEDURE pasien(
    IN id INT,
    IN nama VARCHAR(25)
)
BEGIN
    SELECT * FROM pasien
    WHERE id = id_pasien;
END //
CALL pasien(2, 'Rani');
DROP PROCEDURE IF EXISTS pasien;
DELIMITER ;

-- OUT
DELIMITER //
CREATE PROCEDURE Count_Dokter_By_Spesialisasi(
    IN spesialisasi_filter VARCHAR(255),
    OUT total_dokter INT
)
BEGIN
    SELECT COUNT(*) INTO total_dokter FROM dokter 
    WHERE spesialisasi = spesialisasi_filter;
END //
CALL Count_Dokter_By_Spesialisasi('Dokter Umum', @total_dokter);
SELECT @total_dokter AS total_dokter;
DELIMITER ;

-- OUT menampilkan nama dokter
DELIMITER //
CREATE PROCEDURE Get_Dokter_Nama(
    IN dokter_id INT,
    OUT nama_dokter VARCHAR(25)
)
BEGIN
    SELECT nama INTO nama_dokter FROM dokter
    WHERE id_dokter = dokter_id
    LIMIT 1;
END //
CALL Get_Dokter_Nama(20, @nama_dokter);
SELECT @nama_dokter AS nama_dokter;

-- INOUT
DELIMITER //
CREATE PROCEDURE Update_Stok_Obat(
    INOUT id INT,
    IN qty INT
)
BEGIN
    UPDATE Obat
    SET stok = stok + qty
    WHERE id = id_obat;
END //

SET @id_obat := 6;
CALL Update_Stok_Obat(@id_obat, 5);
SELECT * FROM obat WHERE id_obat=6
DROP PROCEDURE IF EXISTS Update_Stok_Obat;
DELIMITER ;

-- Memasukkan data baru
DELIMITER //
CREATE PROCEDURE Insert_New_Pasien(
    IN id_pasien INT,
    IN nama VARCHAR(25),
    IN tgl_lahir DATE,
    IN alamat VARCHAR(255),
    IN jenis_kelamin VARCHAR(10),
    IN no_telepon VARCHAR(15)
)
BEGIN
    INSERT INTO pasien (id_pasien, nama, tgl_lahir, alamat, jenis_kelamin, no_telepon)
    VALUES (id_pasien, nama, tgl_lahir, alamat, jenis_kelamin, no_telepon);
END //
CALL Insert_New_Pasien(21, 'Tania', '2000-05-05', '573 Main Street', 'Perempuan', '111111111');
SELECT * FROM pasien;
DELIMITER ;
DROP PROCEDURE IF EXISTS Insert_New_Pasien;

-- Memperbaharui data
DELIMITER //
CREATE PROCEDURE Update_Dokter_Spesialisasi(
    IN id INT,
    IN new_spesialisasi VARCHAR(255)
)
BEGIN
    UPDATE Dokter
    SET spesialisasi = new_spesialisasi
    WHERE id = id_dokter;
END //
CALL Update_Dokter_Spesialisasi(2, 'Dokter Bedah');
SELECT * FROM dokter WHERE id_dokter=2;
SELECT * FROM dokter;
DELIMITER ;

-- Menghapus data
DELIMITER //
CREATE PROCEDURE Delete_Rawat_Inap(
    IN id INT
)
BEGIN
    DELETE FROM rawat_inap
    WHERE id = id_rawat_inap;
END //
CALL Delete_Rawat_Inap(20);
SELECT * FROM rawat_inap;
DELIMITER ;
