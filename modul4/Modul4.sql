-- Menampilkan data tiket penerbangan diurutkan berdasarkan nama penumpang secara ASC
SELECT * FROM tiket_penerbangan ORDER BY Nama_Penumpang ASC;

-- Menampilkan data tiket penerbangan diurutkan berdasarkan nama penumpang secara DESC
SELECT * FROM tiket_penerbangan ORDER BY Nama_Penumpang DESC;

-- Menampilkan jumlah tiket penerbangan yang dibeli oleh setiap penumpang dan hanya menampilkan yang memiliki lebih dari 1 tiket
SELECT Nama_Penumpang, COUNT(*) AS Jumlah_Tiket  FROM tiket_penerbangan 
GROUP BY Nama_Penumpang 
HAVING Jumlah_Tiket > 1;

-- Menampilkan tiket penerbangan yang berangkat antara tanggal 2024-03-28 dan 2024-04-01
SELECT * FROM jadwal_penerbangan 
WHERE Waktu_Berangkat BETWEEN '2024-03-28' AND '2024-04-01';

-- Menampilkan maskapai yang paling banyak muncul pada jadwal penerbangan
SELECT Kode_Maskapai, COUNT(*) AS Total_Penerbangan FROM jadwal_penerbangan
GROUP BY Kode_Maskapai
ORDER BY Total_Penerbangan DESC;

-- Menampilkan maskapai yang paling sedikit muncul pada jadwal penerbangan
SELECT Kode_Maskapai, COUNT(*) AS Total_Penerbangan FROM jadwal_penerbangan
GROUP BY Kode_Maskapai
ORDER BY Total_Penerbangan ASC;

-- Menampilkan maskapai yang memiliki huruf 'a' di depan nama maskapai
SELECT * FROM maskapai
WHERE Nama_Maskapai LIKE 'a%';

-- Menampilkan penumpang yang paling banyak melakukan pembayaran
SELECT Nama_Penumpang, COUNT(*) AS Total_Transaksi FROM pembayaran
JOIN tiket_penerbangan ON pembayaran.ID_Tiket = tiket_penerbangan.ID_Tiket
GROUP BY Nama_Penumpang
ORDER BY Total_Transaksi DESC;

-- Menampilkan penumpang yang melakukan lebih dari 3 transaksi
SELECT Nama_Penumpang, COUNT(*) AS Total_Transaksi FROM pembayaran
JOIN tiket_penerbangan ON pembayaran.ID_Tiket = tiket_penerbangan.ID_Tiket
GROUP BY Nama_Penumpang
HAVING Total_Transaksi > 3;

-- Menampilkan data diri konsumen dan transaksi yang dilakukan
SELECT t.*, p.* FROM tiket_penerbangan t
JOIN pembayaran p ON tiket_penerbangan.ID_Tiket = pembayaran.ID_Tiket;
