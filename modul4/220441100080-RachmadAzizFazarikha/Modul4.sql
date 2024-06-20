USE tugas_modul_1;

#nomor 1
SELECT nama_full, gender FROM anggota ORDER BY nama_full ASC; 

SELECT id_anggota, nama_full FROM anggota ORDER BY id_anggota DESC;

#nomor 2
SELECT alamat, COUNT(alamat) AS anggota_tiap_daerah FROM anggota GROUP BY alamat 
HAVING anggota_tiap_daerah > 1 ORDER BY anggota_tiap_daerah;

#nomor 3
SELECT nama_full, tgl_kembali FROM anggota JOIN peminjaman ON anggota.id_anggota = peminjaman.id_anggota 
WHERE tgl_kembali BETWEEN '2023-08-10' AND '2023-08-20';

#nomor 4
SELECT alamat, COUNT(*) AS jumlah_tiap_daerah FROM anggota GROUP BY alamat ORDER BY jumlah_tiap_daerah DESC;

#nomor 5
SELECT alamat, COUNT(*) AS jumlah_tiap_daerah FROM anggota GROUP BY alamat ORDER BY jumlah_tiap_daerah ASC;

#nomor 6
SELECT nama_full, gender FROM anggota WHERE nama_full LIKE "a%";

#nomor 7
SELECT nama_lengkap, a.id_admin, COUNT(b.id_admin) AS c FROM admin_perpus AS a JOIN peminjaman AS b ON a.id_admin = b.id_admin 
GROUP BY a.id_admin ORDER BY c DESC;

#nomor 8
SELECT nama_full, a.id_anggota, COUNT(b.id_anggota) AS c FROM anggota AS a JOIN peminjaman AS b ON a.id_anggota = b.id_anggota
GROUP BY b.id_anggota HAVING c > 3 ORDER BY c;

#nomor 9
SELECT a.nama_full AS nama, a.alamat, a.gender, c.tgl_kembali AS tanggal_buku_kemabali, d.judul AS buku_yang_dipinjam 
FROM anggota AS a 
JOIN peminjaman AS b ON a.id_anggota = b.id_anggota
JOIN detail_pinjam AS c ON b.id_pinjam = c.id_pinjam
JOIN buku_pepus AS d ON c.id_buku = d.id_buku
ORDER BY c.tgl_kembali;