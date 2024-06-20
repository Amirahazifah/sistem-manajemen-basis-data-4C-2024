CREATE VIEW UpdatableView AS
SELECT student_id, nama_siswa, alamat, tanggal_lahir
FROM students;

DROP VIEW IF EXISTS UpdatableView;

INSERT INTO UpdatableView (student_id, nama_siswa, alamat, tanggal_lahir)
VALUES (21, 'anang', 'mekar jaya', '2024-03-21');

UPDATE UpdatableView
SET alamat = 'surabaya'
WHERE student_id = 21;

DELETE FROM UpdatableView
WHERE student_id = 21;

SELECT * FROM UpdatableView
SELECT * FROM students

-- --------------------------------

CREATE VIEW Updatableguru AS
SELECT teacher_id, nama_guru, mata_pelajaran
FROM teachers;

DROP VIEW IF EXISTS Updatableguru;

INSERT INTO Updatableguru (teacher_id, nama_guru, mata_pelajaran)
VALUES (21, 'anang', 'sejarah jepang');

UPDATE Updatableguru
SET mata_pelajaran = 'sejarah cina'
WHERE teacher_id = 21;

DELETE FROM Updatableguru
WHERE teacher_id = 21;

SELECT * FROM Updatableguru
SELECT * FROM students


-- -----------------------------------
CREATE VIEW StudentEnrollments AS
SELECT students.nama_siswa, enrollments.tahun_pelajaran
FROM Students
INNER JOIN Enrollments  ON students.student_id = enrollments.student_id;

SELECT * FROM StudentEnrollments;

DROP VIEW IF EXISTS StudentEnrollments;


-- ----------------------------------------

CREATE VIEW StudentGrades AS
SELECT s.nama_siswa, g.nilai
FROM Students s
INNER JOIN Enrollments e ON s.student_id = e.student_id
INNER JOIN Grades g ON e.enrollment_id = g.enrollment_id;

SELECT * FROM StudentGrades;

INSERT INTO StudentGrades (nama_siswa, nilai)
VALUES ( 'anang', 90);

