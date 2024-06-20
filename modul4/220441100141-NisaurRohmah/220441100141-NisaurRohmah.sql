#1. Menampilkan data di urutkan berdasarkan ASC, DESC, ORDER BY
SELECT * FROM anggota ORDER BY nama ASC;
SELECT * FROM anggota ORDER BY nama DESC;

#2. Perintah SQL yang menggunakan klausa Order By, Group By, dan Having
SELECT id_departemen, COUNT(id_proker) AS jumlah_proker 
FROM proker GROUP BY id_departemen HAVING jumlah_proker > 0
ORDER BY jumlah_proker DESC;

#3. Menampilkan data berdasarkan rentang tanggal
SELECT * FROM anggota WHERE ttl BETWEEN '2002-01-01' AND '2002-11-11';

#4. Menampilkan data yang paling banyak muncul pada studi kasus
SELECT id_departemen, COUNT(nim) AS jumlah_anggota FROM anggota
GROUP BY id_departemen
ORDER BY jumlah_anggota DESC
LIMIT 1;

#5. Menampilkan data yang paling sedikit muncul pada studi kasus
SELECT id_departemen, COUNT(nim) AS jumlah_anggota FROM anggota
GROUP BY id_departemen
ORDER BY jumlah_anggota ASC
LIMIT 1;

#6. Menampilkan data yang memiliki huruf “a” didepan katanya
SELECT nama FROM anggota WHERE nama LIKE 'A%';

#7. Menampilkan data yang paling banyak melakukan transaksi
SELECT pj_agenda, COUNT(id_agenda) AS jumlah_agenda FROM agenda
GROUP BY pj_agenda
ORDER BY jumlah_agenda DESC
LIMIT 1;

#8. Mencari data yang melakukan transaksi lebih dari 3
SELECT pj_agenda, COUNT(id_agenda) AS jumlah_agenda FROM agenda
GROUP BY pj_agenda
HAVING jumlah_agenda > 3;
SELECT * FROM agenda;

#9. Menampilkan data mulai dari data diri, dan data melakukan transaksi apa saja
SELECT 
    anggota.nama AS nama_anggota,
    anggota.nim,
    anggota.jabatan,
    departemen.nama_departemen,
    proker.nama_proker AS proker_yang_dipimpin
FROM 
    anggota
JOIN 
    departemen ON anggota.id_departemen = departemen.id_departemen
JOIN 
    proker ON anggota.nim = proker.pj_proker
ORDER BY 
    anggota.nama;
