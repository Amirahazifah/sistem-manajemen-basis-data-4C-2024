CREATE VIEW Anggota_Minjam_Lebih_5_Buku AS
SELECT anggota_id, COUNT(*) AS jumlah_pinjaman
FROM peminjaman
GROUP BY anggota_id
HAVING jumlah_pinjaman > 5;

CREATE VIEW Transaksi_Petugas AS
SELECT petugas_id, COUNT(*) AS jumlah_transaksi
FROM transaksi
GROUP BY petugas_id;

 CREATE VIEW Petugas_Terbaik AS
SELECT petugas_id, jumlah_transaksi
FROM Transaksi_Petugas
WHERE jumlah_transaksi = (SELECT MAX(jumlah_transaksi) FROM Transaksi_Petugas);

CREATE VIEW Buku_Terpinjam_Paling_Banyak AS
SELECT buku_id, COUNT(*) AS jumlah_peminjaman
FROM peminjaman
GROUP BY buku_id
ORDER BY jumlah_peminjaman DESC
LIMIT 1;
