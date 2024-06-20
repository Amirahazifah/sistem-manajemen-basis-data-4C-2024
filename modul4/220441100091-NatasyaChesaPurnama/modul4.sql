--ASC---
SELECT nama_dokter FROM dokter ORDER BY nama_dokter ASC;

--DESC---
SELECT nama_dokter FROM dokter ORDER BY nama_dokter DESC;

--orderby, groupby, havingg---
SELECT p.Id_Penjualan, o.Nama_Obat, SUM(p.Total_Harga) AS Total_Harga
FROM penjualan p
JOIN laporan_penjualan lp ON p.Id_Penjualan = lp.Id_Penjualan
JOIN obat o ON lp.Id_Obat = o.Id_Obat
GROUP BY p.Id_Penjualan, o.Nama_Obat
HAVING SUM(p.Total_Harga) > 5000
ORDER BY Total_Harga ASC;

--Rentang tanggal---
SELECT * FROM penjualan WHERE Tgl_Penjualan 
BETWEEN '2024-03-01' AND '2024-03-31';

--data paling banyak---
SELECT o.Id_Obat, o.Nama_Obat, COUNT(lp.Id_Obat) AS Jumlah_Penjualan
FROM laporan_penjualan lp 
JOIN obat o ON lp.Id_Obat = o.Id_Obat
GROUP BY o.Id_Obat, o.Nama_Obat
ORDER BY Jumlah_Penjualan DESC;

--data paling sedikit---
SELECT o.Id_Obat, o.Nama_Obat, COUNT(lp.Id_Obat) AS Jumlah_Penjualan
FROM laporan_penjualan lp 
JOIN obat o ON lp.Id_Obat = o.Id_Obat
GROUP BY o.Id_Obat, o.Nama_Obat
ORDER BY Jumlah_Penjualan ASC;

--data yang memiliki huruf a didepan---
SELECT Nama_Obat
FROM obat
WHERE Nama_Obat LIKE 'A%'
ORDER BY Nama_Obat ASC;

--pelanggan yang paling banyak melakukan transaksi---
SELECT pj.Id_Pelanggan, p.nama_pelanggan ,COUNT(Id_Penjualan) AS Jumlah_Transaksi
FROM penjualan pj
JOIN pelanggan p ON pj.Id_Pelanggan = p.id_pelanggan
GROUP BY Id_Pelanggan
ORDER BY Jumlah_Transaksi DESC;

--pelanggan yang melakukan transaksi lebih dari 3---
SELECT pj.Id_Pelanggan, p.nama_pelanggan ,COUNT(Id_Penjualan) AS Jumlah_Transaksi
FROM penjualan pj
JOIN pelanggan p ON pj.Id_Pelanggan = p.id_pelanggan
GROUP BY Id_Pelanggan
HAVING COUNT(Id_Penjualan) > 3;

--data pelanggan dan transaksinya---
SELECT p.Nama_Pelanggan, ob.Nama_Obat, j.Tgl_Penjualan
FROM penjualan j
JOIN laporan_penjualan lp ON j.Id_Penjualan = lp.Id_Penjualan
JOIN obat ob ON lp.Id_Obat = ob.Id_Obat
JOIN pelanggan p ON j.Id_Pelanggan = p.Id_Pelanggan
ORDER BY Tgl_Penjualan ASC;