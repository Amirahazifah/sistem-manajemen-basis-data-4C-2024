-- 1.urut dari nama yang berawal A hingga Z.
SELECT * FROM anggota ORDER BY nama_anggota ASC;

jika datanya berupa alphabet maka akan urut dari Z ke A.
SELECT * FROM anggota ORDER BY nama_anggota DESC;

Mengelompokkan DATA buku berdasarkan kategori dan menghitung jumlah buku untuk setiap kategori
SELECT kategori, COUNT(*) AS jumlah_buku
FROM buku
GROUP BY kategori;

-------------------
2.Mengurutkan DATA pengembalian berdasarkan denda secara descending dan mengelompokkannya berdasarkan tanggal_pengembalian:
SELECT tanggal_pengembalian, denda
FROM pengembalian
GROUP BY tanggal_pengembalian
ORDER BY denda DESC;

SELECT id_anggota,COUNT(*) AS jumlah_peminjaman
FROM peminjam
GROUP BY id_anggota
HAVING COUNT(*) > 1;

SELECT a.nama_anggota, p.id_anggota, COUNT(*) AS jumlah_peminjaman
FROM peminjam p
INNER JOIN anggota a ON p.id_anggota = a.id_anggota
GROUP BY p.id_anggota, a.nama_anggota
HAVING COUNT(*) > 1;

-------------------

3.Menampilkan DATA peminjaman berdasarkan rentang tanggal peminjaman
SELECT *
FROM peminjam
WHERE tanggal_peminjaman BETWEEN '2023-03-10' AND '2023-03-20';

--------------------

4.Anggota yang Paling Banyak Meminjam Buku
SELECT nama_anggota, COUNT(*) AS jumlah_pinjam
FROM peminjam
INNER JOIN anggota ON peminjam.id_anggota = anggota.id_anggota
GROUP BY anggota.id_anggota
ORDER BY jumlah_pinjam DESC
LIMIT 2;


---------------------

5.Anggota yang paling sedikit meminjam buku
SELECT anggota.nama_anggota, COUNT(*) AS jumlah_pinjam
FROM peminjam
INNER JOIN anggota ON peminjam.id_anggota = anggota.id_anggota
GROUP BY anggota.id_anggota
HAVING jumlah_pinjam = 1;



----------------------
6. nama anggota yang berawalan dari huruf A
SELECT nama_anggota
FROM anggota
WHERE nama_anggota LIKE 'a%';

---------------------

7.paling banyak transaksi
SELECT anggota.nama_anggota, COUNT(*) AS jumlah_transaksi
FROM peminjam
INNER JOIN anggota ON peminjam.id_anggota = anggota.id_anggota
GROUP BY anggota.id_anggota
ORDER BY jumlah_transaksi DESC
LIMIT 1;

-----------------------
8.
Mencari Anggota Perpustakaan yang Melakukan Transaksi Lebih dari 3 Kali

SELECT anggota.id_anggota, anggota.nama_anggota, COUNT(*) AS jumlah_transaksi
FROM peminjam
JOIN anggota ON peminjam.id_anggota = anggota.id_anggota
GROUP BY anggota.id_anggota, anggota.nama_anggota
HAVING COUNT(*) > 2
ORDER BY jumlah_transaksi DESC
LIMIT 1;


----------------------------
9. seluruh transaksi 
SELECT
    a.id_anggota,a.nama_anggota,a.alamat,a.nomor_telepon,a.email,
    p.id_peminjaman,b.judul_buku,p.tanggal_peminjaman,p.tanggal_jatuh_tempo,
    pg.tanggal_pengembalian,pg.denda
FROM anggota a LEFT JOIN peminjam p ON a.id_anggota = p.id_anggota
LEFT JOIN buku b ON p.id_buku = b.id_buku
LEFT JOIN pengembalian pg ON p.id_peminjaman = pg.id_peminjaman
ORDER BY a.id_anggota, p.tanggal_peminjaman;

10.subquery
SELECT b.judul_buku, b.pengarang, b.penerbit, p.tanggal_peminjaman, p.tanggal_jatuh_tempo
FROM peminjam p
LEFT JOIN buku b ON p.id_buku = b.id_buku
WHERE p.id_peminjaman NOT IN (
    SELECT id_peminjaman
    FROM pengembalian
);


