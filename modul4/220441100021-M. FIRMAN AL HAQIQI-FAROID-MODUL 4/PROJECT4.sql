-- no 1
-- Urutan naik berdasarkan tahun terbit
SELECT * FROM Buku ORDER BY tahun_terbit ASC;
-- Urutan turun berdasarkan tahun terbit
SELECT * FROM Buku ORDER BY tahun_terbit DESC;

-- no 2
SELECT tahun_terbit, COUNT(*) AS jumlah_buku
FROM Buku
GROUP BY tahun_terbit
HAVING COUNT(*) > 1
ORDER BY jumlah_buku DESC;

--no 3
SELECT *
FROM Peminjaman
WHERE tanggal_pinjam BETWEEN '2022-05-05' AND '2022-05-15';

--no 4
SELECT judul_buku, COUNT(*) AS jumlah_peminjaman
FROM Peminjaman a JOIN buku b ON a.id_buku=b.id_buku
GROUP BY judul_buku
ORDER BY jumlah_peminjaman DESC;

--no 5
SELECT judul_buku, COUNT(*) AS jumlah_peminjaman
FROM Peminjaman a JOIN buku b ON a.id_buku=b.id_buku
GROUP BY judul_buku
ORDER BY jumlah_peminjaman ASC;`anggota`

--no 6
SELECT * FROM penulis
WHERE nama_penulis LIKE 'a%';

--no7
SELECT nama_anggota, COUNT(*) AS jumlah_transaksi
FROM Peminjaman a JOIN anggota b ON a.id_anggota=b.id_anggota
GROUP BY nama_anggota
ORDER BY jumlah_transaksi DESC;

--no8
SELECT nama_anggota, COUNT(*) AS jumlah_transaksi
FROM Peminjaman a JOIN anggota b ON a.id_anggota=b.id_anggota
GROUP BY nama_anggota
HAVING COUNT(*) > 3;


-- no 9
SELECT * FROM anggota a LEFT JOIN peminjaman b ON a.id_anggota = b.id_anggota;

SELECT judul_buku FROM buku WHERE id_buku NOT IN (SELECT DISTINCT id_buku FROM peminjaman);