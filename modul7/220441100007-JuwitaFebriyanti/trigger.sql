-- tabel baru untuk mencatat baris baru yang ingin ditambahkan --
CREATE TABLE log_insert (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_tabel VARCHAR(100),
    waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DESCRIPTION TEXT
);

-- trigger yang mencatat setiap kali baris baru dimasukkan ke dalam tabel unit --
DELIMITER //
CREATE TRIGGER unit_insert
AFTER INSERT ON unit
FOR EACH ROW
BEGIN
    INSERT INTO log_insert (nama_tabel, DESCRIPTION)
    VALUES ('unit', CONCAT('Menambahkan unit baru dengan id_unit = ', NEW.id_unit));
END//
DELIMITER ;

INSERT INTO unit (id_unit, id_gedung, nomor, tipe, harga) VALUES (22, 2, 'E602', 'Studio', 1000000);
SELECT * FROM  log_insert;

-- trigger yang memastikan bahwa sebuah nilai yang dimasukkan tidak boleh negatif --
DELIMITER //
CREATE TRIGGER cek_harga
BEFORE INSERT ON unit
FOR EACH ROW
BEGIN
    IF NEW.harga < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Harga tidak boleh negatif';
    END IF;
END //
DELIMITER ;

INSERT INTO unit (id_unit, id_gedung, nomor, tipe, harga) VALUES (23, 2, 'E602', 'Studio', 1000000);

-- trigger yang apabila memperbaharui satu data dari sebuah table, maka table yang lain juga diperbaharui --
ALTER TABLE unit ADD COLUMN update_message VARCHAR(255);

DELIMITER //
CREATE TRIGGER update_gedung
AFTER UPDATE ON gedung
FOR EACH ROW
BEGIN
    UPDATE unit
    SET update_message = CONCAT('Update: ', NEW.nama_gedung)
    WHERE id_gedung = NEW.id_gedung;
END//
DELIMITER ;

UPDATE gedung SET nama_gedung = 'Tower A2 Baru' WHERE id_gedung = 2;
SELECT * FROM unit;

-- trigger untuk memastikan no telp yang diinputkan sesuai ketentuan --
DELIMITER //
CREATE TRIGGER update_noTelp
BEFORE UPDATE ON penyewa
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.no_telepon) < 12 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 12 angka';
    END IF;
END//
DELIMITER ;

UPDATE penyewa SET no_telepon = '987654321856' WHERE id_penyewa = 1;
