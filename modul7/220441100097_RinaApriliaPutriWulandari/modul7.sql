#1
CREATE TABLE log_peminjam (
  log_id INT(10) NOT NULL AUTO_INCREMENT,
  id_peminjam INT(11) NOT NULL,
  nama_peminjam VARCHAR(255) NOT NULL,
  no_telp VARCHAR(20) NOT NULL,
  inserted_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (log_id)
);

DELIMITER //
CREATE TRIGGER tambah_peminjam
AFTER INSERT ON peminjam
FOR EACH ROW
BEGIN
  INSERT INTO log_peminjam (id_peminjam, nama_peminjam, no_telp)
  VALUES (NEW.id_peminjam, NEW.nama_peminjam, NEW.no_telp);
END //
DELIMITER ;

INSERT INTO peminjam (id_peminjam, nama_peminjam, no_telp) VALUES
(22, 'roy', '081234567841');

SELECT * FROM log_peminjam;


#2
DELIMITER //
CREATE TRIGGER check_positive_value
BEFORE INSERT ON barang
FOR EACH ROW
BEGIN
    IF NEW.jumlah_stok < 0 OR NEW.harga_sewa < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai tidak boleh negatif';
    END IF;
END//
DELIMITER ;

INSERT INTO barang (id_barang, nama_barang, jumlah_stok, harga_sewa) 
VALUES (21, 'ukulele', -5, 10000);

SELECT * FROM barang;  

#3
DELIMITER //

CREATE TRIGGER update_data 
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    DECLARE TotalBayar INT;
    
    SELECT SUM(total_bayar) INTO TotalBayar
    FROM pembayaran
    WHERE id_transaksi = NEW.id_Transaksi;
    
    UPDATE pembayaran
    SET total_bayar = TotalBayar
    WHERE id_transaksi = NEW.id_transaksi;
END//
DELIMITER ;

UPDATE transaksi
SET tgl_peminjaman = '2024-01-02'
WHERE id_transaksi = 2;

SELECT * FROM pembayaran;

#4
DELIMITER //
CREATE TRIGGER cek_telepon
BEFORE INSERT ON peminjam
FOR EACH ROW
BEGIN
    DECLARE PanjangNomor INT;
    SET PanjangNomor = CHAR_LENGTH(NEW.no_telp);
    IF PanjangNomor < 10 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Nomor Telepon tidak boleh kurang dari 10 angka';
    END IF;
END//
DELIMITER ;

INSERT INTO peminjam (id_peminjam, nama_peminjam, no_telp) VALUES (23, 'Nana', '12345689910');
SELECT * FROM peminjam;