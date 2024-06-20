nomor
CREATE TABLE log_mobill(
id_log INT PRIMARY KEY AUTO_INCREMENT,
nama VARCHAR(50),
tgl_input DATETIME);

CREATE TRIGGER log_mobill
AFTER INSERT ON mobil FOR EACH ROW
INSERT INTO log_mobil(id_log,nama,tgl_input)VALUES(NULL,CONCAT(new.merk," ",new.model),NOW());


DELIMITER//
CREATE TRIGGER cek_harga
BEFORE INSERT ON mobil FOR EACH ROW
BEGIN
	IF new.harga_sewa<0 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = "harga tidak boleh negatif";
	END IF;
END//
DELIMITER;

INSERT INTO mobil VALUES(90,"suzuki","carry",2020,"hitam",-8);

CREATE perubahan_harga(
id_log INT PRIMARY KEY AUTO_INCREMENT,
harga_lama VARCHAR(50),
harga_baru VARCHAR(50),
tgl_ubah DATETIME);

CREATE TRIGGER ubah_harga
AFTER UPDATE ON mobil FOR EACH ROW
INSERT INTO perubahan_harga(id_log,harga_lama,harga_baru,tgl_ubah)VALUES(NULL,old.harga_sewa,new.harga_sewa,NOW());

DELIMITER//
CREATE TRIGGER cek_tlp
BEFORE INSERT ON pelanggan
FOR EACH ROW
BEGIN
	IF LENGTH(new.nomor_hp)<10 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = "harga tidak boleh kurang dari 10";
	END IF;
END//
DELIMITER;

INSERT INTO pelanggan VALUES(21,"vik","sby",08986054646);

SELECT LENGTH(08986054646);