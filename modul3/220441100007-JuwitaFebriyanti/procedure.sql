-- Parameter IN --
DELIMITER //

CREATE PROCEDURE NamaPenyewa (
 IN id INT, 
 IN nama VARCHAR(25)
 )
BEGIN
    SELECT * FROM Penyewa 
    WHERE id = id_penyewa;
END//
DELIMITER ;

CALL NamaPenyewa(1, 'Nana Fitriana');


-- Parameter OUT --
DELIMITER //

CREATE PROCEDURE UnitHargaSewa (
 OUT jumlah_unit INT
)
BEGIN
    DECLARE hargasewa INT;
    SET hargasewa = 1000000; 
    SELECT COUNT(*) INTO jumlah_unit FROM Unit WHERE harga > hargasewa;
END//
DELIMITER ;

CALL UnitHargaSewa(@hargasewa);
SELECT @hargasewa AS JumlahUnitLebihMahal;


-- Parameter INOUT --
DELIMITER //

CREATE PROCEDURE HargaSewa (
 INOUT unitID INT, 
 INOUT HargaBaru DECIMAL(11,0)
 )
BEGIN
    DECLARE HargaLama DECIMAL(11,0);

    SELECT harga INTO HargaLama
    FROM Unit
    WHERE id_unit = unitID;

    UPDATE Unit
    SET harga = HargaBaru
    WHERE id_unit = unitID;
    
    SET HargaBaru = HargaLama;
END //
DELIMITER ;

SET @unitID = 1; 
SET @HargaBaru = 2000000; 
CALL HargaSewa(@unitID, @HargaBaru);
SELECT @unitID, @HargaBaru;
SELECT * FROM Unit;


-- Stored Procedure untuk Memasukkan Data Baru --
DELIMITER //

CREATE PROCEDURE Insert_Penyewa (
 IN id INT,
 IN nama VARCHAR(255), 
 IN alamat_penyewa VARCHAR(255), 
 IN nomor_telepon VARCHAR(15))
BEGIN
    INSERT INTO Penyewa (id_penyewa, nama_penyewa, alamat, no_Telepon) VALUES (id, nama, alamat_penyewa, nomor_telepon);
END//
DELIMITER ;

CALL Insert_Penyewa(21, 'Ayu', 'Jalan Bumi No. 55', '081234567890');
SELECT * FROM Penyewa;


-- Stored Procedure untuk Memperbarui Data --
DELIMITER //

CREATE PROCEDURE UpdateUnit (
 IN id INT, 
 IN nomor_unit VARCHAR(10), 
 IN tipe_unit VARCHAR(50), 
 IN harga_sewa INT
 )
BEGIN
    UPDATE Unit
    SET nomor = nomor_unit, tipe = tipe_unit, harga = harga_sewa
    WHERE id_unit = id;
END//
DELIMITER ;

CALL UpdateUnit(1, 'A101', 'Alcove', 1500000);
SELECT * FROM Unit;


-- Stored Procedure untuk Menghapus Data --
DELIMITER //

CREATE PROCEDURE DeletePenyewa (
 IN id INT
 )
BEGIN
    DELETE FROM Penyewa WHERE id_penyewa = id;
END//
DELIMITER ;

CALL DeletePenyewa(21);
SELECT * FROM Penyewa;