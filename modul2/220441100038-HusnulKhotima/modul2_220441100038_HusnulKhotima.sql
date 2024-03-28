--membuat view updatable detailpengiriman--
CREATE VIEW detailpengirimanView AS
SELECT sd.pengirimanID, p.NamaProduk, sd.kuantitas, sd.HargaSatuan
FROM detailpengiriman sd
JOIN produk p ON sd.ProdukID = p.ProdukID;
--view updatble pengriman---
CREATE VIEW daftarsimpan AS
SELECT s.PengirimanID, c.NamaCustomer, e.NamaKaryawan, s.TanggalPengiriman, s.TotalBerat, s.TotalBiaya
FROM pengiriman s
JOIN customer c ON s.CustomerID = c.CustomerID
JOIN karyawan e ON s.KaryawanID = e.KaryawanID;
--readonly customer---
CREATE VIEW CustomerReadOnly AS
SELECT CustomerID, NamaCustomer, Alamat, Kota, Telp
FROM Customer;
--readonly detailproduk---
CREATE VIEW ProductReadOnly AS
SELECT ProdukID, NamaProduk, DESCRIPTION, TotalBerat, HargaSatuan
FROM produk;
