/*IN*/
DELIMITER//
CREATE PROCEDURE nama_barang_berdasarkan_id(
    IN id_barang_ INT
)
BEGIN
    SELECT * FROM barang WHERE id_barang = id_barang_;
END//
CALL nama_barang_berdasarkan_id(2);


/*OUT*/
DELIMITER //
CREATE PROCEDURE total_peminjam(
    OUT total_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO total_peminjam FROM peminjam;
END//
CALL total_peminjam(@total);
SELECT @total;


/*INOUT*/
DELIMITER //
CREATE PROCEDURE update_data_barang(
    INOUT id_barang_input INT,
    IN nama_barang_ VARCHAR(50),
    IN stok_barang INT,
    IN harga_sewa_barang INT
)
BEGIN
    UPDATE barang
    SET nama_barang = nama_barang_,
        jumlah_stok = stok_barang,
        harga_sewa = harga_sewa_barang
    WHERE id_barang = id_barang_input;
    
    SELECT 'Data barang dengan ID ', id_barang_input, ' berhasil diperbarui.';
END//
SET @id_barang := 1;
CALL update_data_barang(@id_barang, 'gendang', 5, 34000);
SELECT * FROM barang WHERE id_barang = @id_barang;


/*TAMBAH DATA*/
DELIMITER //
CREATE PROCEDURE tambah_data(
    IN nama_peminjam_baru VARCHAR(255),
    IN notlp_baru VARCHAR(20)
)
BEGIN
    INSERT INTO peminjam (nama_peminjam, no_telp)
    VALUES (nama_peminjam_baru, notlp_baru);
END//
CALL tambah_data ('Ayu', '09876542356');
SELECT * FROM peminjam;


/*UPDATE DATA*/
DELIMITER //
CREATE PROCEDURE data_update_baru(
    IN input_id_barang INT,
    IN nama_barang_ VARCHAR(50),
    IN stok_barang INT,
    IN harga_sewa_barang INT
)
BEGIN
    UPDATE barang
    SET nama_barang = nama_barang_,
        jumlah_stok = stok_barang,
        harga_sewa = harga_sewa_barang
        
    WHERE id_barang = input_id_barang;
END//
CALL data_update_baru(2, 'Seruling', 3, 18000);
SELECT * FROM barang;


/*HAPUS DATA*/
DELIMITER //
CREATE PROCEDURE DeletePeminjam(IN p_id_peminjam INT)
BEGIN
    DELETE FROM peminjam WHERE id_peminjam = p_id_peminjam;
END//
CALL DeletePeminjam(24);
SELECT * FROM peminjam;