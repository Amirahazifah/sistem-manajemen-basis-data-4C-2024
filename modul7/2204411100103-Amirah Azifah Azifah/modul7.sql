--1--
CREATE TABLE log_pembayaran (
  log_id INT(10) ,
  id_pembayaran INT(11) NOT NULL,
  id_tiket INT (11) NOT NULL,
  metode_pembayaran VARCHAR (50) NOT NULL,
  total_bayar DECIMAL  NOT NULL,
  tanggal_pembayaran DATE NOT NULL,
  inserted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (log_id)
);

DELIMITER //
CREATE TRIGGER pembayaran_insert
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
  INSERT INTO log_pembayaran (id_pembayaran,id_tiket,metode_pembayaran,total_bayar,tanggal_pembayaran)
  VALUES (NEW.id_pembayaran, NEW.id_tiket, NEW.metode_pembayaran, NEW.total_bayar, NEW.tanggal_pembayaran);
END //
DELIMITER ;

INSERT INTO pembayaran (id_pembayaran,id_tiket,metode_pembayaran,total_bayar,tanggal_pembayaran) VALUES
(26,27 , 'cash', 60000.00,'2024-05-22 ' );
DROP TRIGGER pembayaran_insert;

SELECT * FROM log_pembayaran;
--2--
DELIMITER //
CREATE TRIGGER pembayaran_negatif
BEFORE INSERT ON pembayaran
FOR EACH ROW
BEGIN
    IF NEW.total_bayar < 0 THEN
        SIGNAL SQLSTATE '90000' SET MESSAGE_TEXT = 'Nilai total pembayaran tidak boleh negatif';
    END IF;
END//
DELIMITER;

INSERT INTO pembayaran (id_pembayaran, id_tiket, metode_pembayaran,total_bayar,tanggal_pembayaran) VALUES 
(1, 12,'cash',-6000.00 ,'2024-05-24');

--3--
DELIMITER //

CREATE TRIGGER update_data 
AFTER UPDATE ON tiket_penerbangan
FOR EACH ROW 
BEGIN
    DECLARE total_harga DECIMAL(10, 2);
    
    SELECT SUM(Total_Bayar) INTO total_harga
    FROM pembayaran 
    WHERE id_tiket = NEW.id_tiket;
    
    UPDATE pembayaran
    SET Total_Bayar = total_harga
    WHERE id_tiket = NEW.id_tiket;
END//
DELIMITER ;

UPDATE tiket_penerbangan
SET tanggal_pemesanan = '2024-05-28'
WHERE id_tiket = 9;
DROP TRIGGER IF EXISTS update_data;


--4--
DELIMITER //
CREATE TRIGGER cektelepon
BEFORE INSERT ON tiket_penerbangan
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

INSERT INTO tiket_penerbangan (id_tiket, id_jadwal, nama_penumpang, telepon, nomor_kursi, tanggal_pemesanan) 
VALUES (1, 1, 'Joni Doe', '081345678', 'B02', '2024-05-28');
