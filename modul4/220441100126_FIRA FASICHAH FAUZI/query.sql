-- Menampilkan daftar stasiun dengan urutan nama stasiun secara ascending --
SELECT * FROM stasiun ORDER BY nama_stasiun ASC;

-- Menampilkan daftar kereta dengan urutan kapasitas secara descending --
SELECT * FROM kereta ORDER BY kapasitas DESC;

-- Menampilkan data tiket diurutkan berdasarkan harga --
SELECT * FROM tiket ORDER BY harga;

-- Menampilkan jumlah tiket untuk setiap jadwal yang memiliki jumlah tiket tersedia lebih dari 50 --
SELECT id_jadwal, SUM(jumlah_tiket) AS total_tiket
FROM tiket
GROUP BY id_jadwal
HAVING total_tiket > 50
ORDER BY total_tiket;

-- Menampilkan data jadwal_kereta dengan waktu keberangkatan tanggal 06 Maret 2024 pukul 08:00:00 hingga tanggal 25 Maret 2024 pukul 08:00:00  --
SELECT * FROM jadwal_kereta
WHERE waktu_berangkat BETWEEN '2024-03-06 09:00:00' AND '2024-03-25 08:00:00';

-- Menampilkan jenis kereta yang paling banyak tersedia --
SELECT jenis_kereta, COUNT(*) AS jumlah
FROM kereta
GROUP BY jenis_kereta
ORDER BY jumlah DESC
LIMIT 1;

-- Menampilkan jenis kereta yang paling sedikit tersedia --
SELECT jenis_kereta, COUNT(*) AS jumlah
FROM kereta
GROUP BY jenis_kereta
ORDER BY jumlah ASC
LIMIT 1;

-- Menampilkan nama kereta yang berawalan huruf a --
SELECT nama_kereta 
FROM kereta
WHERE nama_kereta LIKE 'a%';

-- Menampilkan id kereta yang melakukan perjalanan terbanyak --
SELECT id_kereta, COUNT(*) AS jumlah_perjalanan
FROM jadwal_kereta
GROUP BY id_kereta
ORDER BY jumlah_perjalanan DESC
LIMIT 1;

-- Menampilkan id kereta yang melakukan perjalanan lebih dari 3 --
SELECT id_kereta, COUNT(*) AS jumlah_perjalanan
FROM jadwal_kereta
GROUP BY id_kereta
HAVING COUNT(*) > 3;

-- Menampilkan data kereta beserta detail transaksinya --
SELECT *
FROM kereta 
LEFT JOIN jadwal_kereta ON kereta.id_kereta = jadwal_kereta.id_kereta;