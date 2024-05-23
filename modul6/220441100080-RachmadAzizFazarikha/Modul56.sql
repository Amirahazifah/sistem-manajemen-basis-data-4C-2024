USE tugas_modul_1;

#Modul 5 Nomor 1
DELIMITER //
CREATE PROCEDURE hitung_transaksi_terakhir(
	IN idAnggota INT,
	OUT jumlah_hari INT
)
BEGIN
	DECLARE hari_terakhir DATE;
	
	SELECT MAX(c.tgl_kembali) INTO hari_terakhir
	FROM peminjaman AS a JOIN anggota AS b ON a.id_anggota = b.id_anggota
	JOIN detail_pinjam AS c ON a.id_pinjam = c.id_pinjam WHERE a.id_anggota = idAnggota;
	
	IF hari_terakhir IS NOT NULL THEN
		SET jumlah_hari = DATEDIFF(CURDATE(), hari_terakhir);
	ELSE
		SET jumlah_hari = NULL;
	END IF;
END //
DELIMITER;

CALL hitung_transaksi_terakhir(2300001, @hari_terakhir);
SELECT @hari_terakhir;

#nomor 2
DELIMITER //
CREATE PROCEDURE jumlah_dipinjam(
	IN id_buku INT,
	IN bulan INT,
	IN tahun INT,
	OUT jumlah_dipinjam INT
)
BEGIN
	SELECT COUNT(*) INTO jumlah_dipinjam
	FROM detail_pinjam AS a WHERE a.id_buku = id_buku
	AND YEAR(a.tgl_kembali) = tahun
	AND MONTH(a.tgl_kembali) = bulan;
END //
DELIMITER;


CALL jumlah_dipinjam(91000001, 8, 2023, @dipinjam);
SELECT @dipinjam

#nomor 3
DELIMITER //
CREATE PROCEDURE input_peminjaman(
	IN idBuku INT,
	IN idAnggota INT,
	IN idAdmin INT
)
BEGIN
	INSERT INTO peminjaman(id_anggota, id_admin) VALUES
	(idAnggota, idAdmin);
	INSERT INTO detail_pinjam(id_pinjam, id_buku, tgl_kembali, denda, status_peminjaman) VALUES
	((SELECT MAX(id_pinjam) FROM peminjaman), idBuku, CURDATE(), 0, "Belum Kembali");
END //
DELIMITER;
	
	
CALL input_peminjaman(91000009, 2300010, 10001);


#Modul 6 nomor 1
DELIMITER //
CREATE PROCEDURE cek_laris(
	IN idBuku INT
)
BEGIN
	DECLARE judulBuku VARCHAR(150);
	DECLARE jumlahPeminjaman INT;
	DECLARE peminjamanTerbanyak INT;
	DECLARE idbukuTerlaris INT;
	
	SELECT a.judul, COUNT(b.id_buku)
	    INTO judulBuku, jumlahPeminjaman
	    FROM buku_pepus AS a
	    JOIN detail_pinjam AS b ON a.id_buku = b.id_buku
	    WHERE a.id_buku = idBuku
	    GROUP BY a.judul;
	
	SELECT id_buku, COUNT(*) AS jumlah_peminjaman
	    INTO idbukuTerlaris, peminjamanTerbanyak
	    FROM detail_pinjam
	    GROUP BY id_buku
	    ORDER BY jumlah_peminjaman DESC
	    LIMIT 1;
	
	IF jumlahPeminjaman = peminjamanTerbanyak THEN
		SELECT CONCAT(judulBuku, " adalah Buku Paling Diminati") AS hasil;
	ELSE
		SELECT CONCAT(judulBuku, " bukan Buku yang Diminati") AS hasil;
	END IF;
END //
DELIMITER;


CALL cek_laris(91000001);

#nomor 2
DELIMITER //
CREATE PROCEDURE tampilAnggota()
BEGIN
	DECLARE idAnggota INT DEFAULT 2300001;
	DECLARE selesai INT DEFAULT 0;
	
	DROP TEMPORARY TABLE IF EXISTS tmplAnggota;
	CREATE TEMPORARY TABLE tmplAnggota(
		id_Anggota INT,
		NamaAnggota VARCHAR(125),
		AlamatAnggota VARCHAR(125),
		GenderAnggota CHAR(1)
	);
	
	WHILE idAnggota <= 2300010 AND selesai = 0 DO
		INSERT INTO tmplAnggota
		SELECT id_anggota, nama_full, alamat, gender
		FROM anggota WHERE id_anggota = idAnggota;
		
		IF ROW_COUNT() = 0 THEN
			SET selesai = 1;
		END IF;
		SET idAnggota = idAnggota + 1;
	END WHILE;
	SELECT * FROM tmplAnggota;
END //
DELIMITER ;


CALL tampilAnggota