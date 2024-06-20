--updatable
CREATE VIEW supplieralamat AS
SELECT Nama_Supplier, Nomor_Telepon FROM supplier;
SELECT * FROM supplieralamat;

--readonly
CREATE VIEW pgudang AS
SELECT Nama_Gudang, Nama_Pegawai FROM gudang JOIN pegawai ON gudang.ID_Gudang=pegawai.ID_Gudang;
SELECT * FROM pgudang;

CREATE VIEW pegawaipenerimaan AS
SELECT Nama_Pegawai, Tanggal_Penerimaan FROM pegawai JOIN penerimaan ON pegawai.ID_Pegawai=penerimaan.ID_Pegawai;
SELECT * FROM pegawaipenerimaan;

INSERT INTO supplieralamat (Nama_Supplier, Nomor_Telepon) VALUES ('Supplier V', '123456789');
UPDATE supplieralamat SET Nomor_Telepon = '987654321' WHERE Nama_Supplier = 'Supplier B';
DELETE FROM supplieralamat WHERE Nama_Supplier = 'Supplier T';


SELECT a.Nama_Supplier, c.Nama_Barang 
FROM supplier a
JOIN penerimaan b ON a.ID_Supplier = b.ID_Supplier 
JOIN barang c ON b.ID_Barang = c.ID_Barang;

CREATE VIEW supbarang AS
SELECT a.Nama_Supplier, c.Nama_Barang 
FROM supplier a
JOIN penerimaan b ON a.ID_Supplier = b.ID_Supplier 
JOIN barang c ON b.ID_Barang = c.ID_Barang;
SELECT * FROM supbarang;

DROP VIEW supbarang;

CREATE VIEW total AS
SELECT SUM(Jumlah_Terima), YEAR (Tanggal_Penerimaan) FROM penerimaan
WHERE YEAR (Tanggal_Penerimaan) = '2024';
SELECT * FROM total;

DROP VIEW total;