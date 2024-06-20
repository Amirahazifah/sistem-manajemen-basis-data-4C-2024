-- Updatable view 
CREATE VIEW Daftar_Buku AS
SELECT B.id_buku, B.judul, K.nama_kategori, B.tahun_terbit
FROM buku B
JOIN kategori K ON B.id_kategori = K.id_kategori;

SELECT * FROM Daftar_Buku


-- Updatable view 
CREATE VIEW Peminjaman_Buku AS
SELECT P.id_peminjaman, B.judul, A.nama_anggota, P.tanggal_pinjam, P.tanggal_kembali
FROM peminjaman P
JOIN buku B ON P.id_buku = B.id_buku
JOIN anggota A ON P.id_anggota = A.id_anggota;

SELECT * FROM Peminjaman_Buku


-- Update pada view PeminjamanView
UPDATE Peminjaman
SET tanggal_pinjam = '2024-02-17'
WHERE id_peminjaman = 2;

SELECT * FROM Peminjaman


-- Update view BukuAnggota 
UPDATE Anggota
SET nama_anggota = 'Yoga' 
WHERE nama_anggota = 'Bintang'; 

SELECT * FROM Anggota


-- Read-only view
CREATE VIEW penulisView AS
SELECT * FROM penulis;

SELECT * FROM penulisView


-- Read-only view
CREATE VIEW kategoriView AS
SELECT * FROM kategori;

SELECT * FROM kategoriView





