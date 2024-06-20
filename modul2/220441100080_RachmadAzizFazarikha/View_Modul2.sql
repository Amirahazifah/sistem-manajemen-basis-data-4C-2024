CREATE VIEW vdaftar_buku (judul_buku, penulis) AS
SELECT judul, penulis FROM buku_pepus;

SELECT * FROM vdaftar_buku;

CREATE VIEW vdaftar_anggota (nama, gender) AS
SELECT nama_full, gender FROM anggota;

SELECT * FROM vdaftar_anggota;

CREATE VIEW vdaftar_buku_dipinjam (judul_buku, tanggal_dipinjam) AS
SELECT a.judul, b.tgl_kembali FROM buku_pepus AS a JOIN detail_pinjam AS b ON a.id_buku = b.id_buku;

SELECT * FROM vdaftar_buku_dipinjam;

CREATE VIEW vdaftar_anggota_pinjam_buku (nama, buku_dipinjam) AS
SELECT a.nama_full, b.judul FROM anggota AS a JOIN buku_pepus AS b JOIN detail_pinjam AS c JOIN peminjaman AS d
ON a.id_anggota = d.id_anggota AND c.id_pinjam = d.id_pinjam AND b.id_buku = c.id_buku;

SELECT * FROM vdaftar_anggota_pinjam_buku;