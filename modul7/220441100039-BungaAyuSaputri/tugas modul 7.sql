--1--
CREATE TABLE `log_kunjungan` (
  `log_id` INT(10) NOT NULL AUTO_INCREMENT,
  `id_kunjungan` INT(10) NOT NULL,
  `id_pasien` INT(10) NOT NULL,
  `id_dokter` INT(10) NOT NULL,
  `id_ruang` INT(10) NOT NULL,
  `tanggal_kunjungan` DATE NOT NULL,
  `keluhan` TEXT NOT NULL,
  `inserted_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
);

DELIMITER //
CREATE TRIGGER kunjungan_insert
AFTER INSERT ON kunjungan
FOR EACH ROW
BEGIN
  INSERT INTO log_kunjungan (id_kunjungan, id_pasien, id_dokter, id_ruang, tanggal_kunjungan, keluhan)
  VALUES (NEW.id_kunjungan, NEW.id_pasien, NEW.id_dokter, NEW.id_ruang, NEW.tanggal_kunjungan, NEW.keluhan);
END //
DELIMITER ;

INSERT INTO kunjungan (id_pasien, id_dokter, id_ruang, tanggal_kunjungan, keluhan) VALUES
(16, 4104, 105, '2024-05-22', 'Sakit Mata');

SELECT * FROM log_kunjungan;

--2--
DELIMITER //
CREATE TRIGGER pembayaran_negatif
BEFORE INSERT ON pembayaran
FOR EACH ROW
BEGIN
    IF NEW.total < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai total pembayaran tidak boleh negatif';
    END IF;
END//
DELIMITER;

INSERT INTO pembayaran (id_kunjungan, total, tanggal_bayar) VALUES (2019, -50000, '2024-05-24');

--3--
DELIMITER //
CREATE TRIGGER update_data AFTER UPDATE ON kunjungan
FOR EACH ROW
BEGIN
    DECLARE total_pembayaran INT;
    
    SELECT SUM(total) INTO total_pembayaran FROM pembayaran WHERE id_kunjungan = NEW.id_kunjungan;
    
    UPDATE pembayaran
    SET total = total_pembayaran
    WHERE id_kunjungan = NEW.id_kunjungan;
END//
DELIMITER;

UPDATE kunjungan
SET tanggal_kunjungan = '2024-03-20'
WHERE id_kunjungan = 2011;

--4--
DELIMITER //
CREATE TRIGGER cek_telepon
BEFORE INSERT ON dokter
FOR EACH ROW
BEGIN
    DECLARE panjang_nomor INT;
    SET panjang_nomor = CHAR_LENGTH(NEW.telepon);
    IF panjang_nomor < 10 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END//
DELIMITER ;

INSERT INTO dokter (nama_dokter, spesialis, telepon) VALUES ('Dr. Test', 'Spesialis Test', '123456');