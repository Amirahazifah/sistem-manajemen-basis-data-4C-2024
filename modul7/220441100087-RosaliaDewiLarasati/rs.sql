CREATE TABLE obat_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    id_obat INT,
    nama_obat VARCHAR(255),
    jenis VARCHAR(255),
    harga DECIMAL(10,2),
    stok INT,
    tanggal_insert TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- trigger yang mencatat setiap kali baris baru dimasukkan ke dalam tabel obat --
DELIMITER //
CREATE TRIGGER log_insert_obat
AFTER INSERT ON obat
FOR EACH ROW
BEGIN
    INSERT INTO Obat_Log (id_obat, nama_obat, jenis, harga, stok, tanggal_insert)
    VALUES (NEW.id_obat, NEW.nama_obat, NEW.jenis, NEW.harga, NEW.stok, CURRENT_TIMESTAMP);
END;//
DELIMITER ;
INSERT INTO obat (id_obat, nama_obat, jenis, harga, stok) 
VALUES (22, 'alergi', 'Tablet', 5000, 100);
SELECT * FROM obat_log;

-- trigger yang memastikan bahwa sebuah nilai yang dimasukkan tidak boleh negatif --
DELIMITER //
CREATE TRIGGER cek_harga_negatif
BEFORE INSERT ON obat
FOR EACH ROW
BEGIN
    IF NEW.harga < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Harga tidak boleh negatif';
    END IF;
END;//
DELIMITER ;
INSERT INTO obat (id_obat, nama_obat, jenis, harga, stok) 
VALUES (23, 'Aspirin', 'Tablet', -5000, 10);
SELECT * FROM obat_log;

-- trigger yang apabila memperbaharui satu data dari sebuah table, maka table yang lain juga diperbaharui --
ALTER TABLE dokter ADD COLUMN jumlah_pasien INT DEFAULT 0;
DELIMITER //
CREATE TRIGGER after_update_rawat_inap
AFTER UPDATE ON rawat_inap
FOR EACH ROW
BEGIN
    DECLARE total_pasien INT;
    SELECT COUNT(*) INTO total_pasien
    FROM rawat_inap
    WHERE id_dokter = NEW.id_dokter;
    UPDATE dokter
    SET jumlah_pasien = total_pasien
    WHERE id_dokter = NEW.id_dokter;
END //
DELIMITER ;
UPDATE rawat_inap
SET id_dokter = 7
WHERE id_rawat_inap = 1;
SELECT * FROM rawat_inap;

-- trigger untuk memastikan no telp yang diinputkan sesuai ketentuan --
DELIMITER //
CREATE TRIGGER update_no_telepon
BEFORE UPDATE ON Pasien
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.no_telepon) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No Telepon tidak boleh kurang dari 10 angka';
    END IF;
END;//
DELIMITER ;
UPDATE Pasien 
SET no_telepon = '1234567891' 
WHERE id_pasien = 1;
SELECT * FROM pasien;

