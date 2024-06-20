
DELIMITER //
CREATE PROCEDURE InsertSiswa (
  IN p_id INT,
  IN p_nama VARCHAR(45),
  IN p_alamat VARCHAR(45),
  IN p_tglLahir DATE,
  IN p_jenisKelamin ENUM('Laki-laki', 'Perempuan')
)
BEGIN
  INSERT INTO Siswa (idSiswa, namaSiswa, alamat, tglLahir, jenisKelamin)
  VALUES (p_id, p_nama, p_alamat, p_tglLahir, p_jenisKelamin);
END;
//

DELIMITER ;

CALL InsertSiswa(21, 'Budi', 'Jl. Merdeka 12', '2000-01-01', 'Laki-laki');


DROP PROCEDURE InsertSiswa;


DELIMITER //

CREATE PROCEDURE UpdateSiswa (
  IN p_idSiswa INT,
  IN p_nama VARCHAR(45),
  IN p_alamat VARCHAR(45),
  IN p_tglLahir DATE,
  IN p_jenisKelamin ENUM('Laki-laki','Perempuan')
)
BEGIN
  UPDATE Siswa
  SET namaSiswa = p_nama,
    alamat = p_alamat,
    tglLahir = p_tglLahir,
    jenisKelamin = p_jenisKelamin
  WHERE idSiswa = p_idSiswa;
END;
//

DELIMITER ;

CALL UpdateSiswa(1, 'Andi', 'Jl. Sudirman 10', '2001-02-02', 'Laki-laki');

DROP PROCEDURE IF EXISTS UpdateSiswa;
DELIMITER //

CREATE PROCEDURE DeleteSiswa (
  IN p_idSiswa INT
)
BEGIN
  DELETE FROM Siswa
  WHERE idSiswa = p_idSiswa;
END;
//

DELIMITER ;

CALL DeleteSiswa(21);

DELIMITER //
CREATE PROCEDURE `nilaisiswa` (
    IN id_pelajaran INT
)
BEGIN
    SELECT a.namaSiswa, SUM(b.Nilai) AS total_nilai
    FROM Siswa a
    JOIN Nilai b ON a.idSiswa = b.idSiswa
    WHERE b.idMatapelajaran = id_pelajaran
    GROUP BY a.namaSiswa;
END //
DELIMITER ;

CALL nilaisiswa(1); 

DROP PROCEDURE nilaisiswa;



SELECT @jumlah_siswa;

DELIMITER //

CREATE PROCEDURE `updatenamasiswa`(
  INOUT `siswa_nama` VARCHAR(45),
  IN `siswa_id` INT
)
BEGIN
  UPDATE Siswa
  SET namaSiswa = siswa_nama
  WHERE idSiswa = siswa_id;
END //

DELIMITER ;

SET @siswa_nama = 'Andi Setiawan';

CALL updatenamasiswa(@siswa_nama, 1);

DELIMITER //

CREATE PROCEDURE rataratanilai (
    IN id_siswa INT,
    OUT rata_rata_nilai DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Nilai)
    INTO rata_rata_nilai
    FROM Nilai
    WHERE idSiswa = id_siswa;
END //

DELIMITER ;

CALL rataratanilai(14, @nilairatarata);

SELECT @nilairatarata;

SELECT namaSiswa, namaKelas, namaMatapelajaran FROM siswa a JOIN kelas b ON a.idKelas=b.idKelas JOIN jadwalpelajaran c ON b.idKelas = c.idKelas
JOIN Matapelajaran d ON c.idMatapelajaran = d.idMatapelajaran;

SELECT namaSiswa, namaMatapelajaran, keterangan FROM siswa a JOIN nilai b ON a.idSiswa = b.idSiswa JOIN matapelajaran c ON b.idMatapelajaran = c.idMatapelajaran;

SELECT COUNT(namaSiswa) FROM siswa a JOIN nilai b ON a.idSiswa = b.idSiswa JOIN matapelajaran c ON b.idMatapelajaran = c.idMatapelajaran WHERE namaMatapelajaran = 'Bahasa Indonesia';

SELECT AVG(nilai) FROM siswa a JOIN nilai b ON a.idSiswa = b.idSiswa JOIN matapelajaran c ON b.idMatapelajaran = c.idMatapelajaran WHERE namaMatapelajaran = 'Matematika' AND keterangan = 'Tidak Lulus';

DELIMITER //
CREATE PROCEDURE `nilaisiswabymapel` (
    IN p_namaMatapelajaran VARCHAR(255)
)
BEGIN
    SELECT a.namaSiswa, SUM(b.Nilai) AS total_nilai
    FROM Siswa a
    JOIN Nilai b ON a.idSiswa = b.idSiswa JOIN matapelajaran c ON b.idMatapelajaran = c.idMatapelajaran
    WHERE c.namaMatapelajaran = p_namaMatapelajaran
    GROUP BY a.namaSiswa;
END //
DELIMITER ;

DROP PROCEDURE nilaisiswabymapel;

CALL nilaisiswabymapel('Matematika');