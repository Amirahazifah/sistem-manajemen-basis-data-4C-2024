CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    nama_siswa VARCHAR(50),
    alamat VARCHAR(100),
    tanggal_lahir DATE
);

INSERT INTO Students (student_id, nama_siswa, alamat, tanggal_lahir)
VALUES
(1, 'azmi', 'Jl. Merdeka No. 10', '2005-03-15'),
(2, 'izmi', 'Jl. Cendana No. 5', '2004-07-20'),
(3, 'uzmi', 'Jl. Kebon Sirih No. 3', '2006-01-10'),
(4, 'ezmi', 'Jl. Pahlawan No. 8', '2005-09-25'),
(5, 'ozmi', 'Jl. Diponegoro No. 15', '2004-11-30'),
(6, 'azma', 'Jl. Gajah Mada No. 12', '2005-06-05'),
(7, 'izma', 'Jl. Sudirman No. 7', '2004-04-12'),
(8, 'ezma', 'Jl. Thamrin No. 4', '2006-02-18'),
(9, 'uzma', 'Jl. Hayam Wuruk No. 9', '2005-07-22'),
(10, 'ozma', 'Jl. Asia Afrika No. 6', '2004-12-28'),
(11, 'azmu', 'Jl. Pemuda No. 11', '2005-08-14'),
(12, 'izmu', 'Jl. Veteran No. 14', '2006-03-19'),
(13, 'ezmu', 'Jl. A. Yani No. 13', '2004-05-24'),
(14, 'uzmu', 'Jl. Pahlawan No. 16', '2005-10-29'),
(15, 'ozmu', 'Jl. Diponegoro No. 18', '2004-02-03'),
(16, 'izme', 'Jl. Gajah Mada No. 17', '2006-04-08'),
(17, 'azme', 'Jl. Sudirman No. 20', '2005-01-13'),
(18, 'ozme', 'Jl. Thamrin No. 21', '2004-06-18'),
(19, 'uzme', 'Jl. Hayam Wuruk No. 24', '2006-05-23'),
(20, 'ezme', 'Jl. Asia Afrika No. 25', '2005-02-28');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    nama_mata_pelajaran VARCHAR(50),
    deskripsi TEXT
);

INSERT INTO Courses (course_id, nama_mata_pelajaran, deskripsi)
VALUES
(1, 'Matematika', 'Mata pelajaran matematika dasar untuk siswa SMA'),
(2, 'Bahasa Indonesia', 'Mata pelajaran bahasa Indonesia dengan fokus pada tata bahasa dan kosa kata'),
(3, 'IPA', 'Mata pelajaran IPA yang mencakup berbagai topik ilmiah'),
(4, 'Sejarah', 'Mata pelajaran sejarah yang mengeksplorasi berbagai peristiwa dan periode sejarah'),
(5, 'Ilmu Komputer', 'Pengenalan ilmu komputer dan pemrograman'),
(6, 'Fisika', 'Mata pelajaran fisika yang mencakup prinsip-prinsip dasar dan teori'),
(7, 'Seni Budaya', 'Mata pelajaran seni budaya yang fokus pada berbagai bentuk seni dan teknik'),
(8, 'Biologi', 'Mata pelajaran biologi yang mengeksplorasi organisme hidup dan interaksi mereka'),
(9, 'Kimia', 'Mata pelajaran kimia yang mencakup reaksi kimia dan sifat-sifat zat'),
(10, 'Pendidikan Jasmani', 'Mata pelajaran yang fokus pada kebugaran jasmani dan aktivitas olahraga'),
(11, 'Musik', 'Mata pelajaran musik yang mencakup teori musik dan keterampilan praktis'),
(12, 'Geografi', 'Mata pelajaran geografi yang mengeksplorasi berbagai wilayah geografis dan fitur'),
(13, 'Ekonomi', 'Pengenalan prinsip-prinsip dan konsep ekonomi dasar'),
(14, 'Sastra', 'Mata pelajaran sastra yang mencakup berbagai karya sastra dan genre'),
(15, 'Bahasa Asing', 'Mata pelajaran yang fokus pada pembelajaran bahasa asing'),
(16, 'Psikologi', 'Pengenalan teori-teori dan konsep psikologis dasar'),
(17, 'Sosiologi', 'Mata pelajaran sosiologi yang mengeksplorasi struktur sosial dan interaksi'),
(18, 'Ilmu Lingkungan', 'Mata pelajaran yang mencakup isu-isu lingkungan dan solusinya'),
(19, 'Studi Bisnis', 'Pengenalan konsep dan praktik bisnis dasar'),
(20, 'Pendidikan Kesehatan', 'Mata pelajaran yang fokus pada topik kesehatan dan kesejahteraan');


CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    tahun_pelajaran VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, tahun_pelajaran)
VALUES
(1, 1, 1, '2023/2024'),
(2, 2, 3, '2023/2024'),
(3, 3, 2, '2023/2024'),
(4, 4, 5, '2023/2024'),
(5, 5, 4, '2023/2024'),
(6, 6, 6, '2023/2024'),
(7, 7, 8, '2023/2024'),
(8, 8, 10, '2023/2024'),
(9, 9, 9, '2023/2024'),
(10, 10, 7, '2023/2024'),
(11, 11, 11, '2023/2024'),
(12, 12, 13, '2023/2024'),
(13, 13, 12, '2023/2024'),
(14, 14, 15, '2023/2024'),
(15, 15, 14, '2023/2024'),
(16, 16, 16, '2023/2024'),
(17, 17, 18, '2023/2024'),
(18, 18, 17, '2023/2024'),
(19, 19, 19, '2023/2024'),
(20, 20, 20, '2023/2024');

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    nama_guru VARCHAR(50),
    mata_pelajaran VARCHAR(50)
);

INSERT INTO Teachers (teacher_id, nama_guru, mata_pelajaran)
VALUES
(1, 'Bapak Susanto', 'Matematika'),
(2, 'Ibu Sari', 'Bahasa Indonesia'),
(3, 'Bapak Wibowo', 'IPA'),
(4, 'Ibu Rahayu', 'Sejarah'),
(5, 'Bapak Santoso', 'Ilmu Komputer'),
(6, 'Ibu Darmawati', 'Fisika'),
(7, 'Bapak Budiman', 'Seni Budaya'),
(8, 'Ibu Wulandari', 'Biologi'),
(9, 'Bapak Wijaya', 'Kimia'),
(10, 'Ibu Fitri', 'Pendidikan Jasmani'),
(11, 'Bapak Hadi', 'Musik'),
(12, 'Ibu Ani', 'Geografi'),
(13, 'Bapak Hidayat', 'Ekonomi'),
(14, 'Ibu Desi', 'Sastra'),
(15, 'Bapak Joko', 'Bahasa Asing'),
(16, 'Ibu Ratna', 'Psikologi'),
(17, 'Bapak Budi', 'Sosiologi'),
(18, 'Ibu Dewi', 'Ilmu Lingkungan'),
(19, 'Bapak Adi', 'Studi Bisnis'),
(20, 'Ibu Putri', 'Pendidikan Kesehatan');

CREATE TABLE Assignments (
    assignment_id INT PRIMARY KEY,
    course_id INT,
    teacher_id INT,
    deadline DATE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

INSERT INTO Assignments (assignment_id, course_id, teacher_id, deadline)
VALUES
(1, 1, 1, '2024-03-01'),
(2, 3, 3, '2024-03-02'),
(3, 2, 2, '2024-03-03'),
(4, 5, 5, '2024-03-04'),
(5, 4, 4, '2024-03-05'),
(6, 6, 6, '2024-03-06'),
(7, 8, 8, '2024-03-07'),
(8, 10, 10, '2024-03-08'),
(9, 9, 9, '2024-03-09'),
(10, 7, 7, '2024-03-10'),
(11, 11, 11, '2024-03-11'),
(12, 13, 13, '2024-03-12'),
(13, 12, 12, '2024-03-13'),
(14, 15, 15, '2024-03-14'),
(15, 14, 14, '2024-03-15'),
(16, 16, 16, '2024-03-16'),
(17, 18, 18, '2024-03-17'),
(18, 17, 17, '2024-03-18'),
(19, 19, 19, '2024-03-19'),
(20, 20, 20, '2024-03-20');

CREATE TABLE Grades (
    grade_id INT PRIMARY KEY,
    enrollment_id INT,
    nilai DECIMAL(5,2),
    tanggal_input DATE,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);

INSERT INTO Grades (grade_id, enrollment_id, nilai, tanggal_input) 
VALUES 
    (1, 1, 85.50, '2024-03-01'),
    (2, 2, 78.75, '2024-03-02'),
    (3, 3, 92.00, '2024-03-03'),
    (4, 4, 67.25, '2024-03-04'),
    (5, 5, 80.00, '2024-03-05'),
    (6, 6, 88.50, '2024-03-06'),
    (7, 7, 75.25, '2024-03-07'),
    (8, 8, 91.75, '2024-03-08'),
    (9, 9, 83.00, '2024-03-09'),
    (10, 10, 79.50, '2024-03-10'),
    (11, 11, 95.25, '2024-03-11'),
    (12, 12, 72.00, '2024-03-12'),
    (13, 13, 87.75, '2024-03-13'),
    (14, 14, 84.50, '2024-03-14'),
    (15, 15, 69.75, '2024-03-15'),
    (16, 16, 76.25, '2024-03-16'),
    (17, 17, 93.50, '2024-03-17'),
    (18, 18, 82.25, '2024-03-18'),
    (19, 19, 89.00, '2024-03-19'),
    (20, 20, 96.00, '2024-03-20');

ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Students
FOREIGN KEY (student_id) 
REFERENCES Students(student_id);

ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Courses
FOREIGN KEY (course_id) 
REFERENCES Courses(course_id);

ALTER TABLE Assignments
ADD CONSTRAINT FK_Assignments_Courses
FOREIGN KEY (course_id) 
REFERENCES Courses(course_id);

ALTER TABLE Assignments
ADD CONSTRAINT FK_Assignments_Teachers
FOREIGN KEY (teacher_id) 
REFERENCES Teachers(teacher_id);

ALTER TABLE Grades
ADD CONSTRAINT FK_Grades_Enrollments
FOREIGN KEY (enrollment_id) 
REFERENCES Enrollments(enrollment_id);