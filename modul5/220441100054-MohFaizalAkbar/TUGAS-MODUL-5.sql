-- NO 1
DELIMITER //
CREATE PROCEDURE hitunghari_assignment(
    IN p_student_id INT,
    OUT hari INT
)
BEGIN
    DECLARE tanggal_terakhir DATE;

    -- Mengambil tanggal deadline terakhir untuk student_id yang diberikan
    SELECT MAX(deadline) INTO tanggal_terakhir
    FROM Assignments
    WHERE student_id = p_student_id;
    
    -- Menghitung jumlah hari sejak tugas terakhir
    IF tanggal_terakhir IS NOT NULL THEN
        SET hari = DATEDIFF(CURDATE(), tanggal_terakhir);
    ELSE
        SET hari = NULL; -- Jika tidak ada tugas, nilai NULL
    END IF;
END //
DELIMITER ;

-- Deklarasi variabel untuk menyimpan hasil
SET @hari = 0;
-- Panggil stored procedure dengan student_id yang diinginkan, misalnya 1
CALL hitunghari_assignment(3, @hari);
-- Tampilkan hasil
SELECT @hari;

-- NO 2
DELIMITER //
CREATE PROCEDURE TransaksiBulananCourse(
  IN p_course_id INT,
  IN p_bulan INT,
  IN p_tahun INT,
  OUT jumlah_transaksi INT
)
BEGIN
  SELECT COUNT(*) INTO jumlah_transaksi
  FROM Assignments
  WHERE course_id = p_course_id
    AND MONTH(deadline) = p_bulan
    AND YEAR(deadline) = p_tahun;
END //
DELIMITER ;

-- Deklarasi variabel untuk menyimpan hasil
SET @jumlah_transaksi = 0;
-- Panggil stored procedure dengan course_id, bulan, dan tahun 
CALL TransaksiBulananCourse(20, 3, 2024, @jumlah_transaksi);
-- Tampilkan hasil
SELECT @jumlah_transaksi AS JumlahTransaksi;

-- NO 3
DELIMITER //
CREATE PROCEDURE TambahAssignment(
  IN p_student_id INT,
  IN p_course_id INT,
  IN p_teacher_id INT,
  IN p_enrollment_id INT,
  IN p_grade_id INT
)
BEGIN
  INSERT INTO Assignments (student_id, course_id, teacher_id, enrollment_id, grade_id, deadline)
  VALUES (p_student_id, p_course_id, p_teacher_id, p_enrollment_id, p_grade_id, CURRENT_DATE);
END //
DELIMITER ;

CALL TambahAssignment(3, 2, 10, 20, 19);
SELECT * FROM Assignments;