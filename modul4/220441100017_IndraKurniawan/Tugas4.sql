SELECT * FROM Siswa ORDER BY namaSiswa ASC;
SELECT * FROM Nilai ORDER BY Nilai DESC;
SELECT Kelas.namaKelas, COUNT(Siswa.idSiswa) AS jumlahSiswa
FROM Siswa
JOIN Kelas ON Siswa.idKelas = Kelas.idKelas
GROUP BY Kelas.namaKelas
ORDER BY namaKelas ASC;

SELECT Guru.namaGuru, AVG(Nilai.Nilai) AS rataRataNilai
FROM Nilai
JOIN Matapelajaran ON Nilai.idMatapelajaran = Matapelajaran.idMatapelajaran
JOIN Guru ON Matapelajaran.idGuru = Guru.idGuru
GROUP BY Guru.namaGuru
HAVING AVG(Nilai.Nilai) > 65
ORDER BY rataRataNilai DESC;

SELECT * FROM Absensi
WHERE tanggal BETWEEN '2024-01-01' AND '2024-04-31';

SELECT Matapelajaran.namaMataPelajaran, COUNT(Nilai.idNilai) AS jumlahSiswa
FROM Nilai
JOIN Matapelajaran ON Nilai.idMatapelajaran = Matapelajaran.idMatapelajaran
GROUP BY Matapelajaran.namaMataPelajaran
ORDER BY jumlahSiswa DESC
LIMIT 1;

SELECT Kelas.namaKelas, COUNT(Siswa.idSiswa) AS jumlahSiswa
FROM Siswa
JOIN Kelas ON Siswa.idKelas = Kelas.idKelas
GROUP BY Kelas.namaKelas
ORDER BY jumlahSiswa ASC
LIMIT 1;

SELECT * FROM siswa
WHERE namaSiswa LIKE 'A%';

SELECT Siswa.namaSiswa, COUNT(Absensi.idAbsensi) AS jumlahAbsensi
FROM Siswa
JOIN Absensi ON Siswa.idSiswa = Absensi.idSiswa
GROUP BY Siswa.namaSiswa
ORDER BY jumlahAbsensi DESC
LIMIT 1;

SELECT Siswa.namaSiswa, COUNT(Absensi.idAbsensi) AS jumlahAbsensi
FROM Siswa
JOIN Absensi ON Siswa.idSiswa = Absensi.idSiswa
GROUP BY Siswa.namaSiswa
having jumlahAbsensi > 2;

SELECT siswa.idSiswa, siswa.namaSiswa, siswa.alamat, siswa.tglLahir, absensi.tanggal, absensi.keterangan
FROM siswa
LEFT JOIN absensi ON siswa.idSiswa = absensi.idSiswa;

SELECT max(ratarataNilai) FROM 
(
    SELECT namaSiswa, AVG(nilai) AS ratarataNilai FROM siswa a JOIN nilai b ON a.idSiswa=b.idSiswa GROUP BY namaSiswa
) AS nilaiSiswa;

select namaMatapelajaran, count(b.idMatapelajaran) as mapel 
from matapelajaran a 
left join jadwalpelajaran b on a.idMatapelajaran = b.idMatapelajaran 
group by namaMatapelajaran 
having mapel = 0;

SELECT MIN(namaMatapelajaran) FROM
(
    SELECT a.namaMatapelajaran, COUNT(b.idMatapelajaran) AS mapel 
    FROM Matapelajaran a 
    LEFT JOIN JadwalPelajaran b ON a.idMatapelajaran = b.idMatapelajaran 
    GROUP BY a.namaMatapelajaran 
) as mapelkosong having mapel = 0;

SELECT a.namaMatapelajaran, COUNT(b.idMatapelajaran) AS mapel 
    FROM Matapelajaran a 
    LEFT JOIN JadwalPelajaran b ON a.idMatapelajaran = b.idMatapelajaran 
    GROUP BY a.namaMatapelajaran;

SELECT namaMatapelajaran FROM
(
    SELECT a.namaMatapelajaran, COUNT(b.idMatapelajaran) AS mapel 
    FROM matapelajaran a 
    LEFT JOIN jadwalpelajaran b ON a.idMatapelajaran = b.idMatapelajaran 
    GROUP BY namaMatapelajaran 
) AS subquery
WHERE mapel = 0;

SELECT namaMatapelajaran
FROM Matapelajaran
WHERE idMatapelajaran NOT IN (
    SELECT DISTINCT idMatapelajaran
    FROM JadwalPelajaran
);








