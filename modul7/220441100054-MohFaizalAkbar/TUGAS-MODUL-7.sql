CREATE TABLE Students_Log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    nama_siswa VARCHAR(50),
    alamat VARCHAR(100),
    tanggal_lahir DATE,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_students_insert
AFTER INSERT ON Students
FOR EACH ROW
BEGIN
    INSERT INTO Students_Log (student_id, nama_siswa, alamat, tanggal_lahir)
    VALUES (NEW.student_id, NEW.nama_siswa, NEW.alamat, NEW.tanggal_lahir);
END;//
DELIMITER ;

INSERT INTO Students (nama_siswa, alamat, tanggal_lahir)
VALUES ('Budi', 'Jl. Mawar No. 22', '2005-05-05');

SELECT * FROM Students_Log;

-- -------------------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER before_grades_insert
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF NEW.nilai < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai tidak boleh negatif';
    END IF;
END;//
DELIMITER ;

INSERT INTO Grades (nilai, tanggal_input) VALUES (60.5, '2024-05-30');

INSERT INTO Grades (nilai, tanggal_input) VALUES (-10.0, '2024-05-29');

UPDATE Grades SET nilai = -5.0 WHERE grade_id = 1;


-- -------------------------------------------------------------------------------------------------

ALTER TABLE Assignments ADD student_name VARCHAR(50);

DELIMITER //
CREATE TRIGGER after_students_update
AFTER UPDATE ON Students
FOR EACH ROW
BEGIN
    UPDATE Assignments
    SET student_name = NEW.nama_siswa
    WHERE student_id = NEW.student_id;
END;//
DELIMITER ;

UPDATE Students
SET nama_siswa = 'jakop'
WHERE student_id = 20;

SELECT * FROM Assignments WHERE student_id = 20;
-- -------------------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER before_students_update
BEFORE UPDATE ON Students
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.no_telp) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telpon tidak boleh kurang dari 10 angka';
    END IF;
END;//
DELIMITER ;

UPDATE Students
SET no_telp = '08234567890'
WHERE student_id = 1;

UPDATE Students
SET no_telp = '0823'
WHERE student_id = 1;
