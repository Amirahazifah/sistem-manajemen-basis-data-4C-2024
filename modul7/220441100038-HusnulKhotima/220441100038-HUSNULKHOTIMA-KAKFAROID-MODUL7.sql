USE ekspedisi;
;
================================================
---soal no1  triggerr-----
CREATE TABLE log_produk(
ProdukID INT(11),
NamaProduk VARCHAR(100),
deskripsi TEXT,
TotalBerat DECIMAL(10.2),
HargaSatuan DECIMAL(10.2),
tgl_input DATETIME); 


CREATE TRIGGER lg_coba
AFTER INSERT ON produk FOR EACH ROW
INSERT INTO log_produk VALUES(new.ProdukID, new.NamaProduk, new.deskripsi, new.TotalBerat, new.HargaSatuan, NOW());


INSERT INTO produk (ProdukID, NamaProduk, deskripsi, TotalBerat, HargaSatuan) VALUES
(33,'gg', 'ringan', 1.00, 2000.00);

SELECT*FROM log_produk;
===============================================
--membuat nilai tidak boleh negatif---
DELIMITER //
CREATE TRIGGER before_customer_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
    IF NEW.Telp < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO TELP tidak boleh negatif';
    END IF;
END //

CREATE TRIGGER before_customer_update
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    IF NEW.Telp < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'NO TELP tidak boleh negatif';
    END IF;
END //
DELIMITER ;
============================================================================
INSERT INTO customer (CustomerID, NamaCustomer, Alamat, Kota, Telp) VALUES
(37,'Zayyan', 'Jl.Situbondo','Situbondo',089123459089);
============================================================================
--memperbarui tabel pengiriman saat tabel customer diperbarui--
DELIMITER //
CREATE TRIGGER after_customer_update
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    UPDATE pengiriman p
    JOIN customer c ON p.CustomerID = c.CustomerID
    SET p.NamaCustomer = NEW.NamaCustomer
    WHERE p.CustomerID = OLD.CustomerID;
END //

DELIMITER;
============================================================================
UPDATE customer 
SET NamaCustomer ="zzz"
WHERE CustomerID=17;
SELECT*FROM pengiriman;
============================================================================
--membuat notelp tidak boleh kurang dari 10------
DELIMITER //
CREATE TRIGGER before_notelp_customer_insert
BEFORE INSERT ON customer
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.Telp) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END //

CREATE TRIGGER before_customer_update
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.Telp) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END //
DELIMITER ;
===============================================================================================
INSERT INTO customer (CustomerID, NamaCustomer, Alamat, Kota, Telp) VALUES
(36,'Zayyan', 'Jl.Situbondo','Situbondo',08912);
SELECT * FROM pengiriman;
===============================================================================================
SHOW TRIGGERS;
===============================================================================================
