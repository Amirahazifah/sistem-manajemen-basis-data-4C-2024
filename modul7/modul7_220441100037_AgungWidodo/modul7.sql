USE manage_gudang;


-- no 1
CREATE TABLE catatInsert (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  namaTabel VARCHAR(45),
  keterangan VARCHAR(45),
  IdData INT,
  waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER catat_insert_barang
AFTER INSERT ON Barang
FOR EACH ROW
BEGIN
    INSERT INTO catatInsert (namaTabel, keterangan, IdData)
    VALUES ('Barang', 'Barang baru ditambahkan', NEW.ID_Barang);
END //
DELIMITER ;

INSERT INTO Barang (Nama_Barang, ID_Kategori) VALUES ('Buku', 3);
SELECT * FROM catatInsert;

DROP TRIGGER catatInsert;

-- no 2
DELIMITER //
CREATE TRIGGER cek_nilai_negatif
BEFORE INSERT ON Penerimaan
FOR EACH ROW
BEGIN
    IF NEW.Jumlah_Terima < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai tidak boleh negatif';
    END IF;
END //
DELIMITER ;

INSERT INTO Penerimaan (Tanggal_Penerimaan, ID_Supplier, ID_Barang, Jumlah_Terima, ID_Gudang, ID_Pegawai) VALUES ('2024-05-27', 2, 1, 50, 1, 1);
SELECT * FROM Penerimaan;



-- no 3
DELIMITER //
CREATE TRIGGER updatePenerimaanPegawai
AFTER UPDATE ON Pegawai
FOR EACH ROW
BEGIN
    UPDATE Penerimaan
    SET Nama_Pegawai = NEW.Nama_Pegawai
    WHERE ID_Pegawai = NEW.ID_Pegawai;
END //
DELIMITER ;


DROP TRIGGER updateBarangGudang;

-- no 4
DELIMITER //
CREATE TRIGGER cek_no_telp
BEFORE INSERT ON Pegawai
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.Nomor_Telepon) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telepon tidak boleh kurang dari 10 angka';
    END IF;
END //
DELIMITER ;

INSERT INTO Pegawai (Nama_Pegawai, Nomor_Telepon, ID_Gudang) VALUES ('Georce', '123456789101', 1);
SELECT * FROM Pegawai;

ALTER TABLE Pegawai DROP COLUMN noTelp;



DELIMITER//

CREATE TRIGGER TanggalDiubah
BEFORE UPDATE ON kota
FOR EACH ROW
BEGIN
SET NEW.tanggal_ubah = NOW();
END//

DELIMITER;

UPDATE kota SET Nama_Kota = "Bojonegoro" WHERE ID_Kota = 2;
SELECT * FROM kota;