SELECT * FROM students ORDER BY nama_siswa ; 
SELECT * FROM students ORDER BY nama_siswa ASC ; 
SELECT * FROM students ORDER BY nama_siswa DESC ; 

SELECT course_id, COUNT(*) AS jumlah_siswa
FROM Enrollments
GROUP BY course_id
HAVING jumlah_siswa > 0
ORDER BY enrollment_id DESC;

SELECT * FROM grades WHERE nilai BETWEEN '80' AND '90';

SELECT nama_siswa,COUNT(nama_siswa) FROM students GROUP BY nama_siswa;

SELECT * FROM students WHERE nama_siswa LIKE '%a' ;

SELECT MAX(nilai) AS nilai_tertinggi FROM Grades ;

SELECT nilai FROM Grades ORDER BY nilai DESC LIMIT 3;

SELECT s.nama_siswa,g.nilai, c.nama_mata_pelajaran
FROM Grades g
INNER JOIN Enrollments e ON g.enrollment_id = e.enrollment_id
INNER JOIN Students s ON e.student_id = s.student_id
INNER JOIN Courses c ON e.course_id = c.course_id
WHERE g.nilai = (SELECT MAX(nilai) FROM Grades); -- sub query (query didalam query)