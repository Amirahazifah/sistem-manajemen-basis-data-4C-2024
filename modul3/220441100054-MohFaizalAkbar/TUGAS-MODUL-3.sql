-- IN
DELIMITER //
CREATE PROCEDURE lihatnama(IN alamats CHAR (100))
BEGIN
SELECT * FROM students
WHERE alamat = alamats;
END //
DELIMITER;
CALL lihatnama('Jl. Merdeka No. 10');


--  OUT
DELIMITER //
CREATE PROCEDURE count_siswa(
    OUT total_siswa INT
)
BEGIN
    SELECT COUNT(*) INTO total_siswa FROM students;
END //
DELIMITER ;
CALL count_siswa(@total);
SELECT @total AS total_siswa;


-- IN OUT
DELIMITER //

CREATE PROCEDURE CountStudentsByAddress(
    IN address_param VARCHAR(100),
    OUT student_count INT
)
BEGIN
    SELECT COUNT(*) INTO student_count FROM Students WHERE alamat = address_param;
END //

DELIMITER ;

CALL CountStudentsByAddress('Jl. Merdeka No. 101', @result);
SELECT @result AS jumlah_siswa;


-- data baru
DELIMITER //

CREATE PROCEDURE InsertStudent(
    IN student_name VARCHAR(50),
    IN student_address VARCHAR(100),
    IN student_birthdate DATE
)
BEGIN
    INSERT INTO Students (nama_siswa, alamat, tanggal_lahir) VALUES (student_name, student_address, student_birthdate);
END //

DELIMITER ;
CALL InsertStudent('Azm', 'Jl. Merdeka No. 10', '2005-03-15');


-- hapus
DELIMITER //

CREATE PROCEDURE delete_student_by_id(
    IN student_id INT
)
BEGIN
    DELETE FROM Students WHERE student_id = student_id;
END //

DELIMITER ;

CALL delete_student_by_id(1);

DROP PROCEDURE IF EXISTS DeleteStudent;

-- update
DELIMITER //

CREATE PROCEDURE update_student(
    IN stuid INT,
    IN new_nama_siswa VARCHAR(50),
    IN new_alamat VARCHAR(100),
    IN new_tanggal_lahir DATE
)
BEGIN
    UPDATE Students
    SET nama_siswa = new_nama_siswa, alamat = new_alamat, tanggal_lahir = new_tanggal_lahir
    WHERE student_id = stuid;
END //

DELIMITER ;
CALL update_student(1, 'azmwe', 'Jl. Merdeka No. 10', '2005-03-16');
SELECT * FROM students;

DROP PROCEDURE IF EXISTS update_student;

--   out trampili apa yang dicari

DELIMITER //
CREATE PROCEDURE nsiswa(
INOUT nama_siswa VARCHAR(50)
)
BEGIN
SELECT * FROM students
WHERE nama_siswa = nama_siswas;
END //
CALL nsiswa('azma');
SELECT nsiswa;