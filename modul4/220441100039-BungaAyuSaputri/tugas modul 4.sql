-- 1
SELECT * FROM dokter
ORDER BY nama_dokter ASC;

SELECT * FROM pasien
ORDER BY id_pasien DESC;

--2--
SELECT dokter.nama_dokter, COUNT(kunjungan.id_kunjungan) AS jumlah_kunjungan
FROM kunjungan JOIN dokter ON kunjungan.id_dokter = dokter.id_dokter
GROUP BY dokter.nama_dokter
HAVING jumlah_kunjungan > 3
ORDER BY jumlah_kunjungan DESC;

--3--
SELECT ps.nama_pasien, d.nama_dokter, p.tanggal_bayar FROM pembayaran p
JOIN kunjungan k ON p.id_kunjungan=k.id_kunjungan
JOIN pasien ps ON ps.id_pasien=k.id_pasien
JOIN dokter d ON d.id_dokter=k.id_dokter
WHERE tanggal_bayar BETWEEN '2024-03-01' AND '2024-03-10';

--4--
SELECT dokter.nama_dokter, spesialis, COUNT(kunjungan.id_kunjungan) AS jumlah_kunjungan
FROM dokter JOIN kunjungan ON dokter.id_dokter = kunjungan.id_dokter
GROUP BY dokter.nama_dokter, spesialis
ORDER BY jumlah_kunjungan DESC;

--5--
SELECT dokter.spesialis, COUNT(kunjungan.id_kunjungan) AS jumlah_kunjungan
FROM dokter JOIN kunjungan ON dokter.id_dokter = kunjungan.id_dokter
GROUP BY dokter.spesialis
ORDER BY jumlah_kunjungan ASC;

--6--
SELECT * FROM pasien WHERE nama_pasien LIKE 'a%';

--7--
SELECT p.nama_pasien, COUNT(pb.id_pembayaran) AS jumlah_transaksi
FROM pembayaran pb JOIN kunjungan k ON pb.id_kunjungan = k.id_kunjungan
JOIN pasien p ON k.id_pasien = p.id_pasien
GROUP BY p.id_pasien
ORDER BY jumlah_transaksi DESC;

--8--
SELECT p.id_pasien, nama_pasien, COUNT(pb.id_pembayaran) AS jumlah_transaksi
FROM pembayaran pb JOIN kunjungan k ON pb.id_kunjungan = k.id_kunjungan
JOIN pasien p ON k.id_pasien = p.id_pasien
GROUP BY p.id_pasien
HAVING jumlah_transaksi > 3;

--9--
SELECT pasien.id_pasien,nama_pasien,umur,jeni_kelamin,alamat, kunjungan.tanggal_kunjungan,keluhan, pembayaran.total 
AS total_pembayaran, pembayaran.tanggal_bayar
FROM pasien
JOIN kunjungan ON pasien.id_pasien = kunjungan.id_pasien
JOIN pembayaran ON kunjungan.id_kunjungan = pembayaran.id_kunjungan
ORDER BY pasien.id_pasien, kunjungan.tanggal_kunjungan;