USE manage_gudang;

SELECT * FROM barang ORDER BY Nama_Barang ASC;
SELECT * FROM gudang ORDER BY Nama_Gudang ASC;


SELECT Nama_Supplier, SUM(Jumlah_Terima) AS Total_Penerimaan
FROM supplier s JOIN penerimaan p ON s.ID_Supplier=p.ID_Supplier
GROUP BY Nama_Supplier
ORDER BY Total_Penerimaan DESC;

SELECT Nama_Supplier, SUM(Jumlah_Terima) AS Total_Penerimaan
FROM supplier s JOIN penerimaan p ON s.ID_Supplier=p.ID_Supplier
GROUP BY Nama_Supplier
HAVING SUM(Jumlah_Terima) > 250;


SELECT ID_Penerimaan, Tanggal_Penerimaan, Nama_Supplier, Nama_Barang, Jumlah_Terima, ID_Gudang, ID_Pegawai
FROM Penerimaan p JOIN supplier s ON p.ID_Supplier=s.ID_Supplier JOIN barang b ON b.ID_Barang=p.ID_Barang
WHERE Tanggal_Penerimaan BETWEEN '2025-03-02' AND '2025-03-10'
ORDER BY Tanggal_Penerimaan;


SELECT penerimaan.ID_Barang, Nama_Barang, COUNT(*) AS Jumlah_Penerimaan
FROM penerimaan
JOIN barang ON penerimaan.ID_Barang = barang.ID_Barang
GROUP BY ID_Barang, Nama_Barang
ORDER BY ID_Barang DESC;


SELECT penerimaan.ID_Barang, Nama_Barang, COUNT(*) AS Jumlah_Penerimaan
FROM penerimaan
JOIN barang ON penerimaan.ID_Barang = barang.ID_Barang
GROUP BY ID_Barang, Nama_Barang
ORDER BY ID_Barang ASC;


SELECT ID_Pegawai, Nama_Pegawai
FROM pegawai
WHERE Nama_Pegawai LIKE 'a%';


SELECT s.ID_Supplier, s.Nama_Supplier, COUNT(*) AS Jumlah_Transaksi
FROM Penerimaan p
JOIN Supplier s ON p.ID_Supplier = s.ID_Supplier
GROUP BY s.ID_Supplier, s.Nama_Supplier
ORDER BY Jumlah_Transaksi DESC;


SELECT s.ID_Supplier, s.Nama_Supplier, COUNT(*) AS Jumlah_Transaksi
FROM Penerimaan p
JOIN Supplier s ON p.ID_Supplier = s.ID_Supplier
GROUP BY s.ID_Supplier, s.Nama_Supplier
HAVING COUNT(*) >  3
ORDER BY Jumlah_Transaksi DESC;


SELECT s.ID_Supplier, s.Nama_Supplier, s.ID_Kota, s.Nomor_Telepon, 
       p.Tanggal_Penerimaan, b.Nama_Barang, p.Jumlah_Terima
FROM Supplier s
LEFT JOIN Penerimaan p ON s.ID_Supplier = p.ID_Supplier
LEFT JOIN Barang b ON p.ID_Barang = b.ID_Barang
ORDER BY s.ID_Supplier, p.Tanggal_Penerimaan;


SELECT *
FROM Supplier s
LEFT JOIN Penerimaan p ON s.ID_Supplier = p.ID_Supplier
LEFT JOIN Barang b ON p.ID_Barang = b.ID_Barang
ORDER BY s.ID_Supplier, p.Tanggal_Penerimaan;

--menampilkan nama supier yg belum melakukan transaksi(subquery)

SELECT Nama_Supplier
FROM supplier
WHERE ID_Supplier NOT IN (
    SELECT s.ID_Supplier
    FROM supplier s
    LEFT JOIN penerimaan p ON s.ID_Supplier = p.ID_Supplier
    WHERE p.ID_Penerimaan IS NOT NULL
);
