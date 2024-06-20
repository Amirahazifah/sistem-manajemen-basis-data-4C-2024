-- 1
SELECT * FROM Tamu ORDER BY Nama_Tamu ASC;
SELECT * FROM Kamar ORDER BY Harga_Malam DESC;

-- 2
SELECT ID_Kamar, COUNT(*) AS Jumlah_Pemesanan
FROM Pemesanan
GROUP BY ID_Kamar
HAVING Jumlah_Pemesanan > 1
ORDER BY Jumlah_Pemesanan DESC;

-- 3
SELECT * FROM Pemesanan WHERE Tanggal_Checkin BETWEEN '2024-03-01' AND '2024-03-20';

-- 4
SELECT Kamar.Tipe_Kamar, COUNT(*) AS Jumlah_Pemesanan
FROM Pemesanan
JOIN Kamar ON Pemesanan.ID_Kamar = Kamar.ID_Kamar
GROUP BY Kamar.Tipe_Kamar
ORDER BY Jumlah_Pemesanan DESC
LIMIT 1;

-- 5
SELECT Kamar.Tipe_Kamar, COUNT(*) AS Jumlah_Pemesanan
FROM Pemesanan
RIGHT JOIN Kamar ON Pemesanan.ID_Kamar = Kamar.ID_Kamar
GROUP BY Kamar.Tipe_Kamar
ORDER BY Jumlah_Pemesanan ASC
LIMIT 1;

-- 6
SELECT * FROM Kamar WHERE Tipe_Kamar LIKE 'S%';

-- 7
SELECT Tamu.ID_Tamu, Tamu.Nama_Tamu, COUNT(*) AS Jumlah_Transaksi
FROM Pemesanan
JOIN Tamu ON Pemesanan.ID_Tamu = Tamu.ID_Tamu
JOIN Transaksi ON Pemesanan.ID_Pemesanan = Transaksi.ID_Pemesanan
GROUP BY Tamu.ID_Tamu, Tamu.Nama_Tamu
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;

-- 8
SELECT ID_Tamu, COUNT(*) AS Jumlah_Transaksi
FROM Pemesanan
GROUP BY ID_Tamu
HAVING Jumlah_Transaksi > 3;

-- 9
SELECT Tamu.ID_Tamu, Tamu.Nama_Tamu, Tamu.Alamat, Tamu.Nomor_Telepon, 
       Transaksi.ID_Transaksi, Transaksi.ID_Pemesanan, Transaksi.Total_Harga, Transaksi.Metode_Pembayaran
FROM Tamu
JOIN Pemesanan ON Tamu.ID_Tamu = Pemesanan.ID_Tamu
JOIN Transaksi ON Pemesanan.ID_Pemesanan = Transaksi.ID_Pemesanan;

