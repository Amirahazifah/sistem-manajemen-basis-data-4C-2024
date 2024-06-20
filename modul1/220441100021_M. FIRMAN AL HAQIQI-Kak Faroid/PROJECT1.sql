CREATE TABLE Perpustakaan (
    id_buku INT PRIMARY KEY,
    judul_buku VARCHAR(255),
    pengarang VARCHAR(255),
    tahun_terbit INT,
    id_kategori INT,
    id_penulis INT,
    FOREIGN KEY (id_kategori) REFERENCES kategori_buku(id_kategori),
    FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis)
);

CREATE TABLE Anggota (
    id_anggota INT PRIMARY KEY,
    nama_anggota VARCHAR(255),
    alamat VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE Peminjaman (
    id_peminjaman INT PRIMARY KEY,
    id_anggota INT,
    id_buku INT,
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    FOREIGN KEY (id_anggota) REFERENCES Anggota(id_anggota),
    FOREIGN KEY (id_buku) REFERENCES Perpustakaan(id_buku)
);

CREATE TABLE Kategori_Buku (
    id_kategori INT PRIMARY KEY,
    nama_kategori VARCHAR(255)
);

CREATE TABLE Penulis (
    id_penulis INT PRIMARY KEY,
    nama_penulis VARCHAR(255),
    negara_asal VARCHAR(255)
);

SELECT * FROM Penulis
SELECT * FROM Kategori_Buku
SELECT * FROM Peminjaman
SELECT * FROM Anggota
SELECT * FROM Perpustakaan


INSERT INTO Perpustakaan (id_buku, judul_buku, pengarang, tahun_terbit, id_kategori, id_penulis) VALUES
(1, 'Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 1997, 01, 001),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960, 02, 002),
(3, '1984', 'George Orwell', 1949, 03, 003),
(4, 'Pride and Prejudice', 'Jane Austen', 1813, 04, 004),
(5, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 05, 005),
(6, 'The Catcher in the Rye', 'J.D. Salinger', 1951, 06, 006),
(7, 'Moby Dick', 'Herman Melville', 1851, 07, 007),
(8, 'The Lord of the Rings', 'J.R.R. Tolkien', 1954, 08, 008),
(9, 'Jane Eyre', 'Charlotte Bronte', 1847, 09, 009),
(10, 'Wuthering Heights', 'Emily Bronte', 1847, 010, 0010),
(11, 'The Hobbit', 'J.R.R. Tolkien', 1937, 011, 0011),
(12, 'Gone with the Wind', 'Margaret Mitchell', 1936, 012, 0012),
(13, 'The Alchemist', 'Paulo Coelho', 1988, 013, 0013),
(14, 'The Little Prince', 'Antoine de Saint-Exupery', 1943, 014, 0014),
(15, 'Brave New World', 'Aldous Huxley', 1932, 015, 0015),
(16, 'The Picture of Dorian Gray', 'Oscar Wilde', 1890, 016, 0016),
(17, 'Don Quixote', 'Miguel de Cervantes', 1605, 017, 0017),
(18, 'The Odyssey', 'Homer', 8, 018, 0018),
(19, 'The Adventures of Huckleberry Finn', 'Mark Twain', 1884, 019, 0019),
(20, 'Crime and Punishment', 'Fyodor Dostoevsky', 1866, 020, 0020);

INSERT INTO Anggota (id_anggota, nama_anggota, alamat, email) VALUES
(21, 'Alice Johnson', '123 Main Street, Cityville', 'alice@example.com'),
(22, 'Bob Smith', '456 Elm Street, Townsville', 'bob@example.com'),
(23, 'Charlie Brown', '789 Oak Street, Villagetown', 'charlie@example.com'),
(24, 'Diana Miller', '321 Maple Street, Hamletville', 'diana@example.com'),
(25, 'Ella Davis', '654 Pine Street, Countrytown', 'ella@example.com'),
(26, 'Frank Wilson', '987 Cedar Street, Suburbia', 'frank@example.com'),
(27, 'Grace Lee', '135 Walnut Street, Riverside', 'grace@example.com'),
(28, 'Henry Parker', '468 Birch Street, Mountainview', 'henry@example.com'),
(29, 'Isabel Adams', '753 Cherry Street, Lakeside', 'isabel@example.com'),
(30, 'Jack Harris', '159 Spruce Street, Hilltop', 'jack@example.com'),
(31, 'Katie Roberts', '246 Acorn Street, Seaside', 'katie@example.com'),
(32, 'Liam Thompson', '579 Sycamore Street, Countryside', 'liam@example.com'),
(33, 'Mia Clark', '792 Willow Street, Parkview', 'mia@example.com'),
(34, 'Noah Young', '123 Pinecone Street, Forestville', 'noah@example.com'),
(35, 'Olivia White', '456 Birchbark Street, Lakewood', 'olivia@example.com'),
(36, 'Peter King', '789 Mapleleaf Street, Valleyview', 'peter@example.com'),
(37, 'Quinn Scott', '321 Oakleaf Street, Meadowville', 'quinn@example.com'),
(38, 'Rachel Green', '654 Redwood Street, Beachside', 'rachel@example.com'),
(39, 'Samuel Brown', '987 Cedarwood Street, Hillside', 'samuel@example.com'),
(40, 'Taylor Moore', '135 Birchwood Street, Lakeshore', 'taylor@example.com');

INSERT INTO Peminjaman (id_peminjaman, id_anggota, id_buku, tanggal_pinjam, tanggal_kembali) VALUES
(41, 21, 1, '2022-05-01', '2022-05-15'),
(42, 22, 2, '2022-05-02', '2022-05-16'),
(43, 23, 3, '2022-05-03', '2022-05-17'),
(44, 24, 4, '2022-05-04', '2022-05-18'),
(45, 25, 5, '2022-05-05', '2022-05-19'),
(46, 26, 6, '2022-05-06', '2022-05-20'),
(47, 27, 7, '2022-05-07', '2022-05-21'),
(48, 28, 8, '2022-05-08', '2022-05-22'),
(49, 29, 9, '2022-05-09', '2022-05-23'),
(50, 30, 10, '2022-05-10', '2022-05-24'),
(51, 31, 11, '2022-05-11', '2022-05-25'),
(52, 32, 12, '2022-05-12', '2022-05-26'),
(53, 33, 13, '2022-05-13', '2022-05-27'),
(54, 34, 14, '2022-05-14', '2022-05-28'),
(55, 35, 15, '2022-05-15', '2022-05-29'),
(56, 36, 16, '2022-05-16', '2022-05-30'),
(57, 37, 17, '2022-05-17', '2022-05-31'),
(58, 38, 18, '2022-05-18', '2022-06-01'),
(59, 39, 19, '2022-05-19', '2022-06-02'),
(60, 40, 20, '2022-05-20', '2022-06-03');

INSERT INTO Kategori_Buku (id_kategori, nama_kategori) VALUES 
(01, 'Fiksi'),
(02, 'Non-Fiksi'),
(03, 'Sains'),
(04, 'Sejarah'),
(05, 'Biografi'),
(06, 'Pendidikan'),
(07, 'Bisnis'),
(08, 'Seni'),
(09, 'Sastra'),
(010, 'Teknologi'),
(011, 'Kesehatan'),
(012, 'Olahraga'),
(013, 'Hobi'),
(014, 'Kuliner'),
(015, 'Agama'),
(016, 'Politik'),
(017, 'Psikologi'),
(018, 'Pariwisata'),
(019, 'Musik'),
(020, 'Film');

INSERT INTO Penulis (id_penulis, nama_penulis, negara_asal) VALUES 
(001, 'Agatha Christie', 'Inggris'),
(002, 'J.K. Rowling', 'Inggris'),
(003, 'Stephen King', 'Amerika Serikat'),
(004, 'Haruki Murakami', 'Jepang'),
(005, 'Jane Austen', 'Inggris'),
(006, 'George Orwell', 'Inggris'),
(007, 'Tolkien', 'Inggris'),
(008, 'Leo Tolstoy', 'Rusia'),
(009, 'Dan Brown', 'Amerika Serikat'),
(0010, 'Paulo Coelho', 'Brasil'),
(0011, 'Mark Twain', 'Amerika Serikat'),
(0012, 'Herman Melville', 'Amerika Serikat'),
(0013, 'Emily Bronte', 'Inggris'),
(0014, 'Arthur Conan Doyle', 'Inggris'),
(0015, 'William Shakespeare', 'Inggris'),
(0016, 'Victor Hugo', 'Prancis'),
(0017, 'Ernest Hemingway', 'Amerika Serikat'),
(0018, 'Gabriel Garcia Marquez', 'Kolombia'),
(0019, 'Fyodor Dostoyevsky', 'Rusia'),
(0020, 'Khaled Hosseini', 'Afganistan');


ALTER TABLE Peminjaman
ADD CONSTRAINT fk_peminjaman_buku FOREIGN KEY (id_buku) REFERENCES tabelbuku(id_buku);

ALTER TABLE Peminjaman
ADD CONSTRAINT fk_peminjaman_anggota FOREIGN KEY (id_anggota) REFERENCES Anggota(id_anggota);

ALTER TABLE tabelbuku
ADD CONSTRAINT fk_tabelbuku_kategori FOREIGN KEY (id_kategori) REFERENCES Kategori_Buku(id_kategori);

ALTER TABLE tabelbuku
ADD CONSTRAINT fk_tabelbuku_penulis FOREIGN KEY (id_penulis) REFERENCES Penulis(id_penulis);

ALTER TABLE tabelbuku RENAME TO buku;