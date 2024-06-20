USE perpus;

-- modul 7
-- no 1
-- Membuat tabel log untuk mencatat penyisipan
CREATE TABLE Log_Insert_Buku (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    id_buku INT,
    judul_buku VARCHAR(255),
    pengarang VARCHAR(255),
    tahun_terbit INT,
    id_kategori INT,
    id_penulis INT,
    insert_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Membuat trigger untuk mencatat penyisipan ke tabel Buku
DELIMITER //

CREATE TRIGGER trg_insert_buku
AFTER INSERT ON Buku
FOR EACH ROW
BEGIN
    INSERT INTO Log_Insert_Buku (id_buku, judul_buku, pengarang, tahun_terbit, id_kategori, id_penulis)
    VALUES (NEW.id_buku, NEW.judul_buku, NEW.pengarang, NEW.tahun_terbit, NEW.id_kategori, NEW.id_penulis);
END//

DELIMITER ;

-- Contoh penyisipan ke tabel Buku
INSERT INTO Buku (id_buku, judul_buku, pengarang, tahun_terbit, id_kategori, id_penulis) VALUES
(26, 'Test Book', 'Test Author', 2024, 1, 1);

-- Melihat catatan yang tersimpan di tabel log
SELECT * FROM Log_Insert_Buku;

-- Drop Trigger
DROP TRIGGER trg_insert_buku;

-- no 2
-- Membuat trigger untuk memastikan bahwa tahun_terbit tidak negatif
DELIMITER //

CREATE TRIGGER trg_check_tahun_terbit
BEFORE INSERT ON Buku
FOR EACH ROW
BEGIN
    IF NEW.tahun_terbit < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nilai tahun_terbit tidak boleh negatif';
    END IF;
END//

DELIMITER ;

-- Contoh penyisipan ke tabel Buku yang tidak berhasil
INSERT INTO Buku (id_buku, judul_buku, pengarang, tahun_terbit, id_kategori, id_penulis) VALUES
(28, 'Book Title', 'Author Name', 2024, 1, 1);


-- Melihat catatan yang tersimpan di tabel log
SELECT * FROM Log_Insert_Buku;



-- no 3
DELIMITER //
CREATE TRIGGER updatePenerimaanAnggota
AFTER UPDATE ON anggota
FOR EACH ROW
BEGIN
    UPDATE peminjaman
    SET nama_anggota = NEW.nama_anggota
    WHERE id_anggota = NEW.id_anggota;
END//
DELIMITER ;


-- no 4
ALTER TABLE Anggota ADD COLUMN IF NOT EXISTS no_telp VARCHAR(15);

DELIMITER //
CREATE TRIGGER cek_no_telp
BEFORE INSERT ON Anggota
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.no_telp) < 10 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No Telepon tidak boleh kurang dari 10 angka';
    END IF;
END//
DELIMITER ;

-- Contoh penyisipan ke tabel Anggota dengan nomor telepon yang tidak sesuai
INSERT INTO Anggota (id_anggota, nama_anggota, alamat, email, no_telp) VALUES
(43, 'Tono', '456 Elm Street', 'tono@example.com', '1234567891');

SELECT * FROM Anggota;

DELIMITER //
CREATE TRIGGER tanggal
AFTER UPDATE ON peminjaman
FOR EACH ROW
BEGIN
  IF NEW.tanggal_pinjam > NEW.tanggal_kembali THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'tanggal pinjam tidak boleh lebih besar';
  END IF;
 END//
 
DROP TRIGGER tanggal;
 
INSERT INTO peminjaman VALUES (72,23,5,2029-01-28,2028-02-01,'Indra');

UPDATE peminjaman SET tanggal_kembali = 2030-09-10 WHERE id_peminjaman=72;
