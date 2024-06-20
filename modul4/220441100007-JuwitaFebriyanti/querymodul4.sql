-- Menampilkan data Penyewa diurutkan berdasarkan nama secara ascending --
SELECT * FROM penyewa ORDER BY nama_penyewa ASC;

-- Menampilkan data Unit diurutkan berdasarkan harga sewa secara descending --
SELECT * FROM unit ORDER BY harga DESC;


-- Menampilkan jumlah tipe untuk setiap tipe kamar yang memiliki lebih dari 5 --
SELECT tipe, COUNT(tipe) FROM unit
GROUP BY tipe
HAVING COUNT(tipe) > 5 ORDER BY tipe DESC;


-- Menampilkan transaksi yang terjadi antara tanggal 2023-01-01 dan 2023-12-31 --
SELECT * FROM sewa
WHERE tgl_masuk BETWEEN '2023-01-01' AND '2023-12-31';


-- Menampilkan tipe kamar dengan jumlah transaksi terbanyak --
SELECT tipe, COUNT(*) AS Jumlah_Sewa
FROM unit
GROUP BY tipe
ORDER BY Jumlah_Sewa DESC
LIMIT 1;


-- Menampilkan tipe kamar apartemen yang paling sedikit dimiliki --
SELECT tipe, COUNT(*) AS Jumlah_Unit
FROM unit
GROUP BY tipe
ORDER BY Jumlah_Unit ASC
LIMIT 1;


-- Menampilkan nama penyewa dengan nama yang dimulai dengan huruf "a" --
SELECT * FROM penyewa WHERE nama_penyewa LIKE 'a%';


-- Menampilkan konsumen dengan jumlah transaksi terbanyak
SELECT id_penyewa, COUNT(*) AS Jumlah_Transaksi
FROM sewa
GROUP BY id_penyewa
ORDER BY Jumlah_Transaksi DESC
LIMIT 1;


-- Menampilkan konsumen yang melakukan lebih dari 3 transaksi
SELECT id_penyewa, COUNT(*) AS Jumlah_Transaksi
FROM sewa
GROUP BY id_penyewa
HAVING COUNT(*) > 3;


-- Menampilkan data konsumen beserta detail transaksi --
SELECT *
FROM penyewa AS P
LEFT JOIN sewa AS S ON P.id_penyewa = S.id_penyewa;