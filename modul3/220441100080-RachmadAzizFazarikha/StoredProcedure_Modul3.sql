USE tugas_modul_1;


#in
DELIMITER //
CREATE PROCEDURE input_tanggota(
	IN admin_id INT(11),
	IN nama VARCHAR(125),
	IN tmpt_lahir VARCHAR(100),
	IN tgl DATE,
	IN alamat LONG VARCHAR,
	IN klmn CHAR(1),
	IN no_hp VARCHAR(20))
BEGIN 
	INSERT INTO anggota(id_admin, nama_full, tmpt_lahir, tgl_lahir, alamat, gender, hp)
	VALUES (admin_id, nama, tmpt_lahir, tgl, alamat,klmn, no_hp);
END //



CALL input_tanggota(10001, 'Bobi', 'Lamongan', 2004-08-09, 'kalitengah', 'L',"082143456658");


#out
DELIMITER //
CREATE PROCEDURE jumlah_anggota(
	OUT jmlh_anggota INT
)
BEGIN
	SELECT COUNT(id_anggota) INTO jmlh_anggota FROM anggota;
END //

CALL jumlah_anggota(@jmlh);
SELECT @jmlh;

#in out
DELIMITER //
CREATE PROCEDURE select_buku(
	IN tahun CHAR(4),
	OUT buku VARCHAR(50))
BEGIN
	SELECT judul FROM buku_pepus WHERE tahun_terbit = tahun;
END //


CALL select_buku('2019', @buku);
SELECT @buku;


#nomor 2
DELIMITER //
CREATE PROCEDURE input_buku(
	IN idadmin INT(11),
	IN judul_buku VARCHAR(150),
	IN penulis_buku VARCHAR(125),
	IN penerbit VARCHAR(125),
	IN thn_terbit CHAR(4),
	IN jumlah INT(11)
)
BEGIN
	INSERT INTO buku_pepus(id_admin, judul, penulis, penerbit, tahun_terbit, jumlah) 
	VALUES (idadmin, judul_buku, penulis_buku, penerbit, thn_terbit, jumlah);
END //

CALL input_buku(10001, "Merana", "Abdul", "Pustaka", '2022', 10);

#nomor 3
DELIMITER //
CREATE PROCEDURE ubah_nama_anggota(
	IN nama_baru VARCHAR(150),
	IN idnya INT(11)
)
BEGIN
	UPDATE anggota SET nama_full = nama_baru
	WHERE id_anggota = idnya;
END //

CALL ubah_nama_anggota("Freya", 2300001);

#nomor 4
DELIMITER //
CREATE PROCEDURE hapus_buku(
	IN nama_buku VARCHAR(150),
	IN idnya INT(11)
)
BEGIN
	DELETE FROM buku_pepus WHERE id_buku = idnya AND judul = nama_buku;
END //

CALL hapus_buku("Merana", 91000031);

DELIMITER //
CREATE PROCEDURE tampil_anggota_laki(
	OUT anggota VARCHAR(150)
)
BEGIN 
	SELECT nama_full FROM anggota WHERE gender = 'L';
END //

CALL tampil_anggota_laki(@anggota);
SELECT @anggota;

#inout
DELIMITER //
CREATE PROCEDURE detail_buku(
	INOUT id INT(11)
)
BEGIN
	SELECT * FROM buku_pepus WHERE id_buku = id;
END //

SET @id = 91000001;
CALL detail_buku(@id);
SELECT @id;
