DELIMITER $$
CREATE PROCEDURE check_top_product(IN input_id_buku INT)
BEGIN
    DECLARE product_name VARCHAR(101);
    DECLARE top_count INT;
    DECLARE current_count INT;

    -- Mendapatkan nama buku dari id_buku
    SELECT judul_buku INTO product_name
    FROM buku
    WHERE id_buku = input_id_buku;

    -- Mendapatkan jumlah peminjaman tertinggi
    SELECT COUNT(*) INTO top_count
    FROM peminjam
    GROUP BY id_buku
    ORDER BY COUNT(*) DESC
    LIMIT 1;

    -- Mendapatkan jumlah peminjaman untuk produk yang diberikan
    SELECT COUNT(*) INTO current_count
    FROM peminjam
    WHERE id_buku = input_id_buku;

    -- Menampilkan hasil
    IF current_count = top_count THEN
        SELECT CONCAT(product_name, ' adalah produk/jasa terlaris') AS result;
    ELSE
        SELECT CONCAT(product_name, ' bukan produk/jasa terlaris') AS result;
    END IF;
END$$
DELIMITER ;
CALL check_top_product(101); -- Mengganti 100 dengan id_buku yang diinginkan

DROP PROCEDURE IF EXISTS check_top_product;



--------------------------------------------------------------------------------


DROP PROCEDURE IF EXISTS show_data;
DELIMITER $$
CREATE PROCEDURE show_data()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE finished INT DEFAULT 0;

    DROP TEMPORARY TABLE IF EXISTS temp_data;
    CREATE TEMPORARY TABLE temp_data (
        id_anggota INT,
        nama_anggota VARCHAR(100),
        alamat VARCHAR(200),
        nomor_telepon VARCHAR(20),
        email VARCHAR(100)
    );

    WHILE i <= 10 AND finished = 0 DO
        INSERT INTO temp_data
        SELECT id_anggota, nama_anggota, alamat, nomor_telepon, email
        FROM anggota
        WHERE id_anggota = i;

        IF ROW_COUNT() = 0 THEN
            SET finished = 1;
        END IF;

        SET i = i + 1;
    END WHILE;

    SELECT * FROM temp_data;
END$$
DELIMITER ;
CALL show_data();