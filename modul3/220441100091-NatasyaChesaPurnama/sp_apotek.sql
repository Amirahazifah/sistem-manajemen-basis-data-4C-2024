---inn--
DELIMITER //
CREATE PROCEDURE nama_supplier(
    IN idsupplier INT
)
BEGIN
    DECLARE namasupp VARCHAR(50);
    SELECT Nama_Supplier INTO namasupp
    FROM supplier
    WHERE Id_Supplier = idsupplier;
    SELECT namasupp AS 'Nama_Supplier';
END //

CALL nama_supplier(1);

--out--
DELIMITER //
CREATE PROCEDURE tpenjualan(
     OUT pemasukan INT
)
BEGIN
    SELECT SUM(Total_Harga) INTO pemasukan FROM penjualan;
END//
DELIMITER ;

CALL tpenjualan(@pemasukan);
SELECT @pemasukan AS Total_Pemasukan;

--inout--
DELIMITER //
CREATE PROCEDURE updatapelanggan(
    INOUT idpelanggan INT,
    IN no_baru VARCHAR(20)
)
BEGIN
    UPDATE pelanggan
    SET No_Telp_Pelanggan = no_baru
    WHERE Id_Pelanggan = idpelanggan;
END //

SET @idpelanggan = 2;
CALL updatapelanggan(@idpelanggan, '081231237324');
SELECT * FROM pelanggan WHERE Id_Pelanggan = 2;

--tambahdata--
DELIMITER //
CREATE PROCEDURE tambahobat(
    IN idsupplier INT,
    IN nmobat VARCHAR(70),
    IN jnobat VARCHAR(30),
    IN hgobat INT,
    IN jmobat INT
)
BEGIN
    INSERT INTO obat (Id_Supplier, Nama_Obat, Jenis_Obat, Harga_Obat, Jumlah_Obat)
    VALUES (idsupplier, nmobat, jnobat, hgobat, jmobat);
END //

CALL tambahobat(3, 'Bodrex', 'Paracetamol', 6000, 25);

--updatedata--
DELIMITER //
CREATE PROCEDURE upobat(
    IN idobat INT,
    IN harga_baru INT
)
BEGIN
    UPDATE obat
    SET Harga_Obat = harga_baru
    WHERE Id_Obat = idobat;
END //

CALL upobat(2, 7000);
SELECT * FROM obat WHERE Id_Obat= 2;

--hapusdata--
DELIMITER //
CREATE PROCEDURE hapusdata(
    IN idsupplier INT
)
BEGIN
    DELETE FROM supplier
    WHERE Id_Supplier = idsupplier;
END //

CALL hapusdata(21);
SELECT * FROM supplier;
INSERT INTO supplier VALUES (21, 'CV Abadi Haha', 'Jl. Raya Telang no.24, Madura', 081212758539);
