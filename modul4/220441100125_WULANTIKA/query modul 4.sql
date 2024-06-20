-- Menampilkan data anggota diurutkan berdasarkan nama secara ascending --
SELECT * FROM anggota ORDER BY nama_anggota ASC;

-- Menampilkan data buku diurutkan berdasarkan tahun terbit secara descending --
SELECT * FROM buku ORDER BY tahun_terbit DESC;


-- Menampilkan jumlah tahun terbit untuk setiap tahun terbit yang memiliki lebih dari 3 --
SELECT tahun_terbit, COUNT(tahun_terbit) FROM buku
GROUP BY tahun_terbit
HAVING COUNT(tahun_terbit) > 3 ORDER BY tahun_terbit DESC;


-- Menampilkan peminjaman yang terjadi antara tanggal 2024-02-15 dan 2024-03-22 --
SELECT * FROM peminjaman
WHERE tanggal_pinjam BETWEEN '2024-02-15' AND '2024-03-22';


-- Menampilkan id_kategori buku yang paling banyak muncul
SELECT id_kategori, COUNT(*) AS jumlah
FROM buku
GROUP BY id_kategori
ORDER BY jumlah DESC
LIMIT 1;



-- Menampilkan id_kategori yang paling sedikit muncul --
SELECT id_kategori, COUNT(*) AS jumlah
FROM buku
GROUP BY id_kategori
ORDER BY jumlah ASC;


-- Menampilkan nama anggota dengan nama yang dimulai dengan huruf "a" --
SELECT * FROM anggota WHERE nama_anggota LIKE 'a%';


-- Menampilkan id_anggota dengan jumlah peminjaman terbanyak
SELECT id_anggota, COUNT(*) AS Jumlah_Transaksi
FROM peminjaman
GROUP BY id_anggota
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;


-- Menampilkan id_anggota yang melakukan lebih dari 3x pemiinjaman
SELECT id_anggota, COUNT(*) AS Jumlah_Transaksi
FROM peminjaman
GROUP BY id_anggota
HAVING COUNT(*) > 3;


-- Menampilkan data anggota beserta detail peminjaman --
SELECT *
FROM anggota AS P
LEFT JOIN peminjaman AS S ON P.id_anggota = S.id_anggota;
