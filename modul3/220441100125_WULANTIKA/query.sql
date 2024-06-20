-- IN --
DELIMITER //

CREATE PROCEDURE NamaAnggota(
    IN id INT,
    IN p_nama_anggota VARCHAR(50)
)
BEGIN
    SELECT * FROM anggota
    WHERE id = id_anggota;
END //

DELIMITER ;

CALL NamaAnggota(1,'Wulan');

-- OUT --
DELIMITER //

CREATE PROCEDURE nPenulis(
    OUT total_penulis INT
)
BEGIN
    SELECT COUNT(*) INTO total_penulis FROM penulis ; 
END //

DELIMITER ;

CALL nPenulis(@total_penulis);
SELECT @total_penulis AS total_penulis; 

-- INOUT --
DELIMITER //

CREATE PROCEDURE UBuku(
    INOUT b_id INT,
    INOUT b_tahun_baru INT
)
BEGIN
    DECLARE TahunLama INT;
    SELECT tahun_terbit INTO TahunLama
    FROM buku
    WHERE id_buku = b_id;

    -- Update tahun terbit buku --
    UPDATE buku
    SET tahun_terbit = b_tahun_baru
    WHERE id_buku = b_id;
    SET b_tahun_baru = TahunLama;
END //

DELIMITER ;
SET @b_id := 1;
SET @b_tahun_baru := 1999;
CALL UBuku(@b_id,@b_tahun_baru);
SELECT @b_id, @b_tahun_baru;

SELECT * FROM buku;

-- Memasukan Data Baru --
DELIMITER //

CREATE PROCEDURE Insert_Bk(
    IN id INT,
    IN p_judul VARCHAR(50),
    IN p_tahun_terbit INT,
    IN p_id_kategori INT
)
BEGIN
    INSERT INTO buku (id_buku,judul, tahun_terbit, id_kategori) 
    VALUES (id,p_judul, p_tahun_terbit, p_id_kategori);
END //

DELIMITER ;

CALL Insert_Bk(21,'Bintang Kejora', 2024, 20);
SELECT*FROM buku;

-- Memperbarui Data --
DELIMITER //

CREATE PROCEDURE Update_Ktg(
    IN id INT,
    IN k_kategori VARCHAR(50)
    
)
BEGIN
    UPDATE kategori 
    SET nama_kategori = k_kategori 
    WHERE id_kategori = id;
END //

DELIMITER ;
CALL Update_Ktg(1, 'Horor');
SELECT * FROM kategori;

-- Menghapus Data --
DELIMITER //

CREATE PROCEDURE Delete_Bku(
    IN id INT
)
BEGIN
    DELETE FROM buku WHERE id_buku = id;
END //

DELIMITER ;
CALL Delete_Bku(21);
SELECT * FROM buku;

