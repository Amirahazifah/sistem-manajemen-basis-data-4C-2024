--- IN ---

DELIMITER//
CREATE PROCEDURE nama_anggotaid(IN id INT )
BEGIN
SELECT * FROM anggota
WHERE id = id_anggota;

END//
DELIMITER;
CALL nama_anggotaid(7);
DROP PROCEDURE IF EXISTS nama_anggotaid;

--- OUT ---

DELIMITER//
CREATE PROCEDURE get_book_count(
    OUT total_books INT
)
BEGIN
SELECT COUNT(*) INTO total_books FROM buku;
END//
DELIMITER ;
CALL get_book_count(@total_books);
SELECT @total_books 


--- INOUT ---
DELIMITER//

CREATE PROCEDURE update_book_category(
    INOUT id_buku INT,
    IN new_category VARCHAR(50)
)
BEGIN
    UPDATE buku SET kategori = new_category WHERE id_buku = id_buku;
    SELECT id_buku, kategori INTO id_buku, new_category FROM buku WHERE id_buku = id_buku;
END//
DELIMITER ;
SET @id_buku = 100;
SET @new_category = 'Fiksi';
CALL update_book_category(@id_buku, @new_category);
SELECT @id_buku, @new_category;
DROP PROCEDURE IF EXISTS update_book_category;



--- INSERT ---

DELIMITER//
CREATE PROCEDURE nama_anggotaid(
IN i_id INT , IN i_nama_anggota VARCHAR(255),
IN i_alamat VARCHAR(255),
IN i_nomor_telepon INT, IN i_email VARCHAR(255)
)
BEGIN
INSERT INTO anggota (id_anggota,nama_anggota,alamat,nomor_telepon,email)VALUES (i_id,i_nama_anggota,i_alamat,i_nomor_telepon,i_email);
END//
DELIMITER;
CALL nama_anggotaid (90,"Azell","lamongan",08114590673,"azell@gmail.com");
DROP PROCEDURE IF EXISTS nama_anggotaid;


-- DELETE --
DELIMITER//
CREATE PROCEDURE hapus_namaanggota(
IN i_id INT
)
BEGIN
DELETE FROM anggota WHERE id_anggota = i_id;
END//
DELIMITER;
CALL hapus_namaanggota(90);
CALL nama_anggotaid (90,"Azell","lamongan",08114590673,"azell@gmail.com");
DROP PROCEDURE IF EXISTS nama_anggotaid;


--- UPDATE --
DELIMITER//
CREATE PROCEDURE update_anggotaid(
IN i_id INT , IN i_nama_anggota VARCHAR(255),
IN i_alamat VARCHAR(255),
IN i_nomor_telepon INT, IN i_email VARCHAR(255)
)
BEGIN
UPDATE anggota SET id_anggota = i_id,nama_anggota = i_nama_anggota,alamat = i_alamat,nomor_telepon = i_nomor_telepon,email = i_email WHERE i_id = id_anggota;
END//
DELIMITER;
CALL update_anggotaid (5,"susanti cahya","jln.surakarta no 17",0812547790,"susantocahya@gamil.com");





DELIMITER//
CREATE PROCEDURE get_nama_anggota_peminjam_buku()
BEGIN
    SELECT a.nama_anggota, b.judul_buku
    FROM peminjam p
    JOIN anggota a ON p.id_anggota = a.id_anggota
    JOIN buku b ON p.id_buku = b.id_buku;
END//
DELIMITER;
CALL get_nama_anggota_peminjam_buku();
