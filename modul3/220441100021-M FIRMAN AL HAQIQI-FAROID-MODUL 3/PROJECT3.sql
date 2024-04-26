USE perpus;

SELECT * FROM buku;

DELIMITER //
CREATE PROCEDURE namakategori(IN id INT)
BEGIN
    SELECT * FROM buku
    WHERE id_buku = id;
END //
DELIMITER ;

CALL namakategori(4);

DROP PROCEDURE IF EXISTS namakategori;

DELIMITER //
CREATE PROCEDURE totalbuku(OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total FROM buku;
END //
DELIMITER ;

CALL totalbuku(@total);
SELECT @total;


DELIMITER //
CREATE PROCEDURE total_alamat(IN alamat VARCHAR(255), OUT total3 INT)
BEGIN
    SELECT COUNT(*) INTO total3 FROM penulis WHERE penulis.negara_asal='Inggris';
END //
DELIMITER ;

CALL total_alamat('Inggris', @total3);
SELECT @total3;

DROP PROCEDURE IF EXISTS total_alamat;

DELIMITER //
CREATE PROCEDURE tambah_penulis(
	IN id_penulis INT, nama_penulis VARCHAR(255), IN negara_asal VARCHAR(255)
)
BEGIN
INSERT INTO penulis(id_penulis, nama_penulis, negara_asal) VALUES
(id_penulis, nama_penulis, negara_asal);
END //
DELIMITER ;

CALL tambah_penulis(22, 'Faiz', 'Amerika');
SELECT * FROM penulis;


DELIMITER //
CREATE PROCEDURE update_penulis(
	IN id INT,
	IN nama_penulis VARCHAR(255), 
	IN negara_asal VARCHAR(255)
)
BEGIN
UPDATE penulis 
SET nama_penulis = nama_penulis,
	negara_asal = negara_asal
WHERE id_penulis = id;
END //
DELIMITER ;

CALL update_penulis(21, 'Mark Zuberkag', 'Jepang');
SELECT * FROM penulis;


DELIMITER //
CREATE PROCEDURE delete_penulis(
	IN Id INT
)
BEGIN
DELETE FROM penulis
WHERE id_penulis = Id;
END //
DELIMITER ;

CALL delete_penulis(21);
SELECT * FROM penulis;

DELIMITER //
CREATE PROCEDURE namabuku()
BEGIN
   SELECT penulis.nama_penulis, buku.judul_buku 
   FROM buku 
   JOIN penulis ON buku.id_penulis = penulis.id_penulis;
END//
DELIMITER ;

DROP PROCEDURE namabuku;

CALL namabuku();

