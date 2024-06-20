CREATE TABLE catatInsert (
  Id INT AUTO_INCREMENT PRIMARY KEY,
  namaTabel VARCHAR(45),
  keterangan VARCHAR(45),
  IdData INT,
  waktu TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER catatInsertSiswa
AFTER INSERT ON siswa
FOR EACH ROW
BEGIN
  INSERT INTO catatInsert (namaTabel, keterangan, idData)
  VALUES ('siswa', 'INSERT', NEW.idSiswa);
END//

DROP TRIGGER catatInsert;
INSERT INTO siswa VALUES (29, 'Jono', 'Jl. Tulip 3', 2001-03-07, 'Laki-laki', 1011, '10 IPA 9' ,1011);


DELIMITER//
CREATE TRIGGER checkNilai
BEFORE INSERT ON nilai
FOR EACH ROW
BEGIN
  IF NEW.Nilai < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai tidak boleh negatif';
  END IF;
END//



DELIMITER //
CREATE TRIGGER checkNoTelp
AFTER UPDATE ON siswa
FOR EACH ROW
BEGIN
  IF CHAR_LENGTH(NEW.noTelp) < 10 OR NEW.noTelp < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
  END IF;
END//

DROP TRIGGER checkNoTelp;

UPDATE siswa SET noTelp = 1012200000 WHERE idSiswa = 3;

DELIMITER //

CREATE TRIGGER updatenamaKelassiswa
AFTER UPDATE ON kelas
FOR EACH ROW
BEGIN
  UPDATE siswa
  SET namaKelas = NEW.namaKelas
  WHERE idKelas = NEW.idKelas;
END //

DELIMITER ;

DROP TRIGGER updatenamaKelassiswa;



DELIMITER //

CREATE TRIGGER tampiltanggalDiubah
BEFORE UPDATE ON matapelajaran
FOR EACH ROW
BEGIN 
  SET NEW.tanggaldiUbah = NOW();
END //

DELIMITER ;

DROP TRIGGER tampiltanggalDiubah;
UPDATE matapelajaran SET namaMatapelajaran = "Hura" WHERE idMatapelajaran = 3
