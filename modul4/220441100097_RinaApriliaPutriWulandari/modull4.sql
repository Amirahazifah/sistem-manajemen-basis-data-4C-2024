/*1*/
SELECT * FROM barang ORDER BY nama_barang ASC;
SELECT * FROM peminjam ORDER BY nama_peminjam DESC;

/*2*/
SELECT id_barang, SUM(jumlah_stok) AS total_stok
FROM barang
GROUP BY id_barang
HAVING SUM(jumlah_stok) > 2
ORDER BY total_stok DESC;

/*3*/
SELECT *
FROM transaksi
WHERE tgl_peminjaman BETWEEN '2024-01-01' AND '2024-03-04'
ORDER BY tgl_peminjaman;

/*4*/
SELECT a.id_barang, nama_barang, COUNT(b.id_transaksi) AS jumlah_pinjam
FROM barang a
JOIN transaksi b ON a.id_barang = b.id_barang
GROUP BY a.id_barang, a.nama_barang
ORDER BY jumlah_pinjam DESC;

/*5*/
SELECT a.id_barang, nama_barang, COUNT(b.id_transaksi) AS jumlah_pinjam
FROM barang a
JOIN transaksi b ON a.id_barang = b.id_barang
GROUP BY a.id_barang, a.nama_barang
ORDER BY jumlah_pinjam ASC;

/*6*/
SELECT id_peminjam, nama_peminjam
FROM peminjam
WHERE nama_peminjam LIKE 'a%';

/*7*/
SELECT a.id_peminjam, nama_peminjam, COUNT(b.id_transaksi) AS jumlah_peminjam
FROM peminjam a
JOIN transaksi b ON a.id_peminjam = b.id_peminjam
GROUP BY a.id_peminjam, a.nama_peminjam
ORDER BY jumlah_peminjam DESC;

/*8*/
SELECT a.id_peminjam, nama_peminjam, COUNT(b.id_transaksi) AS jumlah_peminjam
FROM peminjam a
JOIN transaksi b ON a.id_peminjam= b.id_peminjam
GROUP BY a.Id_peminjam, a.nama_peminjam
HAVING COUNT(b.id_transaksi) >  3
ORDER BY jumlah_peminjam DESC;

/*9*/
SELECT a.id_peminjam, a.nama_peminjam, a.no_telp, b.tgl_peminjaman, b.tgl_pengembalian, c.nama_barang
FROM peminjam a
JOIN transaksi b ON a.id_peminjam = b.id_peminjam
JOIN barang c ON b.id_barang = c.id_barang
ORDER BY a.id_peminjam;
