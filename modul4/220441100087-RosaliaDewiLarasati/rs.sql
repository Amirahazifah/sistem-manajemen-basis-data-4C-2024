-- Menampilkan data pasien diurutkan berdasarkan nama secara ascending (A-Z) --
SELECT * FROM pasien ORDER BY nama ASC;
SELECT nama, id_pasien, tgl_lahir, alamat, jenis_kelamin, no_telepon FROM pasien ORDER BY nama ASC;

-- Menampilkan nama dan harga obat diurutkan dari harga tertinggi ke terendah
SELECT nama_obat, harga FROM obat ORDER BY harga DESC;
SELECT nama_obat, harga FROM obat ORDER BY nama_obat DESC;

-- Menampilkan jumlah rawat inap untuk setiap dokter yang memiliki lebih dari 5 rawat inap --
SELECT id_dokter,diagnosis, COUNT(*) AS jumlah_rawat_inap
FROM rawat_inap
GROUP BY id_dokter
HAVING COUNT(*) > 5
ORDER BY jumlah_rawat_inap DESC;

-- Menampilkan rawat inap yang terjadi antara tanggal 2024-01-01 dan 2024-03-03 --
SELECT * FROM rawat_inap
WHERE tgl_masuk BETWEEN '2024-01-14' AND '2024-03-03';

-- Menampilkan obat dengan jumlah transaksi terbanyak --
SELECT id_obat, COUNT(*) AS Jumlah_Transaksi_Obat
FROM rawat_inap
GROUP BY id_obat ORDER BY Jumlah_Transaksi_Obat DESC
LIMIT 1;

-- Menampilkan obat yang paling sedikit dimiliki --
SELECT id_obat, COUNT(*) AS Jumlah_Transaksi_Obat
FROM rawat_inap
GROUP BY id_obat ORDER BY Jumlah_Transaksi_Obat ASC
LIMIT 1;

SELECT o.id_obat, o.nama_obat, COUNT(ri.id_rawat_inap) AS jumlah_rawat_inap
FROM obat o
JOIN rawat_inap ri ON o.id_obat = ri.id_obat
GROUP BY o.id_obat, o.nama_obat
ORDER BY jumlah_rawat_inap ASC;


-- Menampil`dokter`kan dokter dengan nama yang dimulai dengan huruf "a" --
SELECT * FROM dokter WHERE nama LIKE 'A%';
SELECT * FROM dokter WHERE nama LIKE '%A';

-- Menampilkan pasien dengan jumlah rawat inap terbanyak --
SELECT id_pasien, COUNT(*) AS Jumlah_Rawat_Inap
FROM rawat_inap
GROUP BY id_pasien
ORDER BY Jumlah_Rawat_Inap DESC
LIMIT 1;

-- Menampilkan pasien yang memiliki lebih dari 3 rawat inap --
SELECT id_pasien, COUNT(*) AS Jumlah_Rawat_Inap
FROM rawat_inap
GROUP BY id_pasien
HAVING COUNT(*) > 3;

SELECT p.id_pasien, p.nama, COUNT(r.id_pasien) AS Jumlah_Rawat_Inap
FROM pasien p
JOIN rawat_inap r ON p.id_pasien = r.id_pasien
GROUP BY p.id_pasien, p.nama
HAVING COUNT(r.id_pasien) > 3 AND COUNT (r.id_pasien) < 5
ORDER BY Jumlah_Rawat_Inap;

-- Menampilkan data pasien beserta detail rawat inap --
SELECT * FROM pasien AS p
LEFT JOIN rawat_inap AS ri ON p.id_pasien = ri.id_pasien;