-- Stored Procedure dengan parameter IN
DELIMITER //
CREATE PROCEDURE InsertTiket(
    IN jadwal_id INT,
    IN penumpang_nama VARCHAR(100),
    IN nomor_kursi VARCHAR(10)
)
BEGIN
    INSERT INTO tiket_penerbangan (ID_Jadwal, Nama_Penumpang, Nomor_Kursi) 
    VALUES (jadwal_id, penumpang_nama, nomor_kursi);
END //
DELIMITER ;
CALL InsertTiket(1, 'Joni', 'A01');

-- Stored Procedure dengan parameter OUT
DELIMITER //
CREATE PROCEDURE GetTotalPembayaran(
    IN tiket_id INT,
    OUT total_pembayaran DECIMAL(10,2)
)
BEGIN
    SELECT Total_Bayar INTO total_pembayaran
    FROM pembayaran
    WHERE ID_Tiket = tiket_id;
END //
DELIMITER ;

CALL GetTotalPembayaran(1, @total_pembayaran);
SELECT @total_pembayaran;


-- Stored Procedure dengan parameter INOUT
DELIMITER //
CREATE PROCEDURE UpdateNamaPenumpang(
    INOUT tiket_id INT,
    IN nama_baru VARCHAR(100)
)
BEGIN
    UPDATE tiket_penerbangan
    SET Nama_Penumpang = nama_baru
    WHERE ID_Tiket = tiket_id;
END //
DELIMITER ;

SET @tiket_id = 1;
CALL UpdateNamaPenumpang(@tiket_id, 'Joni Doe');


-- Stored Procedure untuk memasukkan data baru pada sebuah tabel
DELIMITER //
CREATE PROCEDURE InsertDataTabel(
    IN kode_rute VARCHAR(5),
    IN kode_bandara_asal VARCHAR(5),
    IN kode_bandara_tujuan VARCHAR(5)
)
BEGIN
    INSERT INTO rute (Kode_Rute, Kode_Bandara_Asal, Kode_Bandara_Tujuan)
    VALUES (kode_rute, kode_bandara_asal, kode_bandara_tujuan);
END //
DELIMITER ;

CALL InsertDataTabel('RT026', 'BND26', 'BND27');


-- Stored Procedure untuk memperbaharui data pada sebuah tabel
DELIMITER //
CREATE PROCEDURE UpdateDataTabel(
    IN kode_rute_lama VARCHAR(5),
    IN kode_bandara_asal_baru VARCHAR(5),
    IN kode_bandara_tujuan_baru VARCHAR(5)
)
BEGIN
    UPDATE rute
    SET Kode_Bandara_Asal = kode_bandara_asal_baru,
        Kode_Bandara_Tujuan = kode_bandara_tujuan_baru
    WHERE Kode_Rute = kode_rute_lama;
END //
DELIMITER ;

CALL UpdateDataTabel('RT026', 'BND28', 'BND29');

-- Stored Procedure untuk menghapus data pada sebuah tabel
DELIMITER //
CREATE PROCEDURE DeleteDataTabel(
    IN kode_rute_hapus VARCHAR(5)
)
BEGIN
    DELETE FROM rute WHERE Kode_Rute = kode_rute_hapus;
END //
DELIMITER ;

CALL DeleteDataTabel('RT026');
