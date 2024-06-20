#nomor 1
CREATE TABLE bukuBaru (
	id_buku INT,
	tglDimasukkan DATE,
	FOREIGN KEY (id_buku) REFERENCES buku_pepus(id_buku)
);

DELIMITER //
CREATE TRIGGER catatBukuMasuk
AFTER INSERT ON buku_pepus
FOR EACH ROW
BEGIN
	INSERT INTO bukuBaru VALUES(
		new.id_buku, CURDATE()
	);
END //

CALL input_buku(10001, "Jawa", "Cahyono Budiono", "Republik", 2020, 10);

#nomor 2
DELIMITER //
CREATE TRIGGER cekJumlah
BEFORE INSERT ON buku_pepus
FOR EACH ROW
BEGIN
	IF new.jumlah < 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "Jumlah tidak boleh kurang dari 0";
	END IF;
END //

CALL input_buku(10001, "PKN", "Cahyono", "Republik", 2020, -10);

#nomor 3
DELIMITER //
CREATE TRIGGER updateDetail
AFTER UPDATE ON peminjaman
FOR EACH ROW
BEGIN 
	UPDATE detail_pinjam
	SET id_pinjam = new.id_pinjam
	WHERE id_pinjam = old.id_pinjam;
END //

DROP TRIGGER updateDetail

UPDATE peminjaman SET id_pinjam = 99 WHERE id_pinjam = 40;

#nomor 4
DELIMITER //
CREATE TRIGGER validasiNohp
BEFORE INSERT ON anggota
FOR EACH ROW
BEGIN
	IF CHAR_LENGTH(new.hp) < 11 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = "No Handphon tidak boleh kurang dari 10";
	END IF;
END //

DROP TRIGGER validasiNohp

CALL input_tanggota(10001, "Abrori", "Lamongan", '2003-11-18', "Karanggeneng", 'L', "0821434599");

INSERT INTO anggota (id_admin, nama_full, tmpt_lahir, tgl_lahir, alamat, gender, hp)
VALUES (10001, 'Abrori', 'Lamongan', '2003-11-18', 'Karanggeneng', 'L', '98214345999');

