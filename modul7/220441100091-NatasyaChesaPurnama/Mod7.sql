--Soal 1--
CREATE TABLE log_dataobat (
    Id_Log INT PRIMARY KEY AUTO_INCREMENT,
    Id_Obat INT,
    Id_Supplier INT,
    Nama_Obat VARCHAR(100),
    Jenis_Obat VARCHAR(50),
    Harga_Obat INT,
    Jumlah_Obat INT,
    Tgl_Ditambahkan DATETIME DEFAULT NOW()
);

DELIMITER//
CREATE TRIGGER log_dataobat
AFTER INSERT ON obat
FOR EACH ROW
BEGIN
    INSERT INTO log_dataobat (Id_Obat,Id_Supplier, Nama_Obat, Jenis_Obat, Harga_Obat, Jumlah_Obat, Tgl_Ditambahkan)
    VALUES (NEW.Id_Obat, NEW.Id_Supplier, NEW.Nama_Obat, NEW.Jenis_Obat, NEW.Harga_Obat, NEW.Jumlah_Obat, NOW());
END//
DELIMITER ;

CALL tambahobat(25,3, 'OBH Combi', 'Sirup', 12000, 25);
SELECT * FROM obat;

--Soal 2--
DELIMITER //
CREATE TRIGGER cek_nompembayaran
BEFORE INSERT ON penjualan
FOR EACH ROW
BEGIN
    IF NEW.Nominal_Pembayaran < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Nominal Pembayaran Pelanggan tidak boleh negatif / Kurang dari Total Harga';
    END IF;
END//
DELIMITER ;

CALL TambahDataPenjualan(24, 3, 9000, 0, 0);
SELECT * FROM penjualan;

--Soal 3--
DELIMITER //
CREATE TRIGGER up_hargaobat
AFTER UPDATE ON obat
FOR EACH ROW
BEGIN
    UPDATE penjualan p
    SET p.Total_Harga = NEW.Harga_Obat
    WHERE p.Id_Obat = OLD.Id_Obat;
END//
DELIMITER ;

CALL upobat(17, 9000);
SELECT * FROM up_soal2 WHERE id_penjualan = 17;

--Soal 4--
DELIMITER //
CREATE TRIGGER cek_no_pelanggan
BEFORE UPDATE ON pelanggan
FOR EACH ROW
BEGIN
    DECLARE no_telp_baru INT;
    SET no_telp_baru = LENGTH(NEW.No_Telp_Pelanggan);
    IF no_telp_baru < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telpon Pelanggan tidak boleh kurang dari 10 angka';
    END IF;
END//
DELIMITER ;

DROP TRIGGER cek_no_pelanggan;

SET @idpelanggan = 1;
CALL updatapelanggan(@idpelanggan, '0812345');
SELECT * FROM pelanggan WHERE Id_Pelanggan = 1;