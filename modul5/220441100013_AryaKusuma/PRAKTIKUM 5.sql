menghitung hari sejak transaksi terakhir konsumen:
DELIMITER $$

CREATE PROCEDURE `get_days_since_last_transaction`(IN customer_id INT)
BEGIN
    DECLARE last_transaction_date DATE;

    SELECT
        MAX(tanggal_pengembalian) INTO last_transaction_date
    FROM
        pengembalian
        JOIN peminjam ON pengembalian.id_peminjaman = peminjam.id_peminjaman
        JOIN anggota ON peminjam.id_anggota = anggota.id_anggota
    WHERE
        anggota.id_anggota = customer_id;

    SELECT
        anggota.nama_anggota,
        COALESCE(last_transaction_date, customer_id) AS message,
        CASE
            WHEN last_transaction_date IS NULL THEN 'No transactions'
            ELSE DATEDIFF(CURDATE(), last_transaction_date)
        END AS days_since_last_transaction
    FROM
        anggota
    WHERE
        anggota.id_anggota = customer_id;
END$$

DELIMITER ;
CALL get_days_since_last_transaction(1);


menampilkan jumlah transaksi pada produk/jasa tertentu dalam suatu bulan:
DELIMITER $$
CREATE PROCEDURE `get_transaction_count_by_month_and_product`(IN product_id INT, IN month INT, IN year INT)
BEGIN
    SELECT COUNT(*) AS transaction_count
    FROM peminjam
    WHERE id_buku = product_id
        AND MONTH(tanggal_peminjaman) = month
        AND YEAR(tanggal_peminjaman) = year;
END$$
DELIMITER ;
CALL get_transaction_count_by_month_and_product(119, 4, 2023);




menambahkan judul buku baru
DELIMITER $$
CREATE PROCEDURE `add_new_buku`(
    IN p_judul_buku VARCHAR(100),
    IN p_pengarang VARCHAR(100),
    IN p_penerbit VARCHAR(100),
    IN p_tahun_terbit INT,
    IN p_kategori VARCHAR(50)
)
BEGIN
    DECLARE new_id_buku INT;
    SELECT COALESCE(MAX(id_buku), 99) + 1 INTO new_id_buku FROM buku;
    
    INSERT INTO buku (id_buku, judul_buku, pengarang, penerbit, tahun_terbit, kategori)
    VALUES (new_id_buku, p_judul_buku, p_pengarang, p_penerbit, p_tahun_terbit, p_kategori);
END$$
DELIMITER ;
CALL add_new_buku('Kisah Jalanan', 'Surtanto', 'Gramedia', 2023, 'Fiksi');
DROP PROCEDURE IF EXISTS add_new_buku;
