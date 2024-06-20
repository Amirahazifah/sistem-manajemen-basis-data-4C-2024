USE manage_gudang;

SELECT * FROM barang;

DELIMITER //
CREATE PROCEDURE get_data_by_id(IN id INT)
BEGIN
SELECT * FROM barang WHERE ID_Barang = id;
END //
DELIMITER ;

CALL get_data_by_id(5);

DROP PROCEDURE IF EXISTS get_data_by_id;


DELIMITER //
CREATE PROCEDURE total_barang(OUT total INT)
BEGIN
SELECT COUNT(*) INTO total FROM barang;
END //
DELIMITER ;

CALL total_barang(@total);
SELECT @total;


DROP PROCEDURE IF EXISTS total_alamat;

DELIMITER //
CREATE PROCEDURE total_alamat(IN alamat VARCHAR(255), OUT total2 INT)
BEGIN
SELECT COUNT(*) INTO total2 FROM gudang WHERE gudang.Alamat='Surabaya';
END //
DELIMITER ;

CALL total_alamat ('Surabaya', @total2);
SELECT @total2;


DELIMITER //
CREATE PROCEDURE insert_gudang(
	IN Nama_Gudang VARCHAR(255), IN Alamat VARCHAR(255)
)
BEGIN
INSERT INTO gudang(Nama_Gudang, Alamat) VALUES
(Nama_Gudang, Alamat);
END //
DELIMITER ;

CALL insert_gudang('Gudang V', 'Surabaya');
SELECT * FROM gudang;


DELIMITER //
CREATE PROCEDURE update_gudang(
	IN Id INT,
	IN Nama_Gudang VARCHAR(255), 
	IN Alamat VARCHAR(255)
)
BEGIN
UPDATE gudang 
SET Nama_Gudang = Nama_Gudang,
	Alamat = Alamat
WHERE ID_Gudang = Id;
END //
DELIMITER ;

CALL update_gudang(32, 'Gudang Y', 'Sidoarjo');
SELECT * FROM gudang;


DELIMITER //
CREATE PROCEDURE delete_gudang(
	IN Id INT
)
BEGIN
DELETE FROM gudang
WHERE ID_Gudang = Id;
END //
DELIMITER ;

CALL delete_gudang(32);
SELECT * FROM gudang;


SELECT ID_Penerimaan, Tanggal_Penerimaan, Nama_Supplier, Nama_Barang, Jumlah_Terima, Nama_Gudang, Nama_Pegawai 
FROM supplier a 
JOIN penerimaan b ON a.ID_Supplier = b.ID_Supplier
JOIN gudang c ON b.ID_Gudang = c.ID_Gudang
JOIN pegawai d ON b.ID_Pegawai = d.ID_Pegawai
JOIN barang e ON b.ID_Barang = e.ID_Barang;

DELIMITER//
CREATE PROCEDURE penbarang ()
BEGIN
SELECT ID_Penerimaan, Tanggal_Penerimaan, Nama_Supplier, Nama_Barang, Jumlah_Terima, Nama_Gudang, Nama_Pegawai 
FROM supplier a 
JOIN penerimaan b ON a.ID_Supplier = b.ID_Supplier
JOIN gudang c ON b.ID_Gudang = c.ID_Gudang
JOIN pegawai d ON b.ID_Pegawai = d.ID_Pegawai
JOIN barang e ON b.ID_Barang = e.ID_Barang;
END//
DELIMITER;

CALL penbarang();

def barang (Nama_Barang, ID_Kategori)
print {"barang : {Nama_Barang}, {ID_Kategori}"}

def total_pengiriman (
    print("jumlah pengiriman ada 25")

total_pengiriman()