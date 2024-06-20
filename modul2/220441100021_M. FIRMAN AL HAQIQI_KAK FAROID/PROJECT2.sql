-updatable-
CREATE VIEW anggota_alamat AS
SELECT nama_anggota, alamat FROM anggota;
SELECT * FROM anggota_alamat;

CREATE VIEW namanegara AS 
SELECT nama_penulis, negara_asal FROM penulis;
SELECT * FROM namanegara;

-readonly-
CREATE VIEW nama_penulisnegara AS
SELECT id_kategori, nama_penulis, negara_asal FROM buku JOIN penulis ON buku.id_penulis=penulis.id_penulis;
SELECT * FROM nama_penulisnegara;


CREATE VIEW pinjam AS
SELECT nama_anggota, id_peminjaman FROM anggota JOIN peminjaman ON anggota.id_anggota=peminjaman.id_anggota;
SELECT * FROM pinjam;

CREATE VIEW total_buku_2023 AS
SELECT COUNT(*) AS total_buku_dipinjam, YEAR(tanggal_kembali) AS tahun
FROM buku
JOIN peminjaman ON buku.id_buku = peminjaman.id_buku
WHERE YEAR(peminjaman.tanggal_kembali) = 2023;
SELECT * FROM total_buku_2023;

DROP VIEW total_buku_2023;
