DELIMITER $$
CREATE TRIGGER after_insert_peminjam
AFTER INSERT ON peminjam
FOR EACH ROW
BEGIN
    INSERT INTO catatantabel (nama_tabel, keterangan, tanggal_ditambahkan, idanggota)
VALUES ('peminjam', 'insert', NOW(),new.id_peminjaman);
	
END$$
DROP TRIGGER IF EXISTS after_insert_peminjam;

INSERT INTO peminjam (id_peminjaman, id_anggota, id_buku, tanggal_peminjaman, tanggal_jatuh_tempo)
VALUES (169, 7, 111, '2023-05-18', '2023-06-12');

SELECT * FROM peminjam;

---------------------------------------
DELIMITER $$
CREATE TRIGGER check_negative_denda
BEFORE INSERT ON pengembalian
FOR EACH ROW
BEGIN
    IF NEW.denda < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Denda tidak boleh negatif';
    END IF;
END$$
DELIMITER ;
INSERT INTO pengembalian (id_pengembalian, id_peminjaman, tanggal_pengembalian, denda)
VALUES (168, 160, '2023-06-12', 10000);

DROP TRIGGER IF EXISTS check_negative_denda;

INSERT INTO pengembalian (id_pengembalian, id_peminjaman, tanggal_pengembalian, denda)
VALUES (169, 160, '2023-06-12', 150000);

SELECT * FROM pengembalian;

------------------------------------------

DROP TRIGGER IF EXISTS update_pengembalian;


DELIMITER$$
CREATE TRIGGER updateid
AFTER UPDATE ON buku
FOR EACH ROW
BEGIN
UPDATE peminjam SET id_buku = new.id_buku
WHERE id_buku = old.id_buku;
END$$

UPDATE buku SET id_buku = 98 WHERE id_buku = 101;

SELECT * FROM buku;

DROP TRIGGER IF EXISTS updateid;
--------------------------------------------------------



DELIMITER $$
CREATE TRIGGER check_nomor_telepon
BEFORE INSERT ON anggota
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.nomor_telepon) < 100 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END$$
DELIMITER ;
INSERT INTO anggota VALUES ( 100,'Rehan','Jln.merdeka 05', 12,'rehannsyahput@gmail.com','0812345678910');

SELECT * FROM anggota;

DROP TRIGGER IF EXISTS check_nomor_telepon;
