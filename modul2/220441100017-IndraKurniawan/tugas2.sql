CREATE VIEW produktersedia AS
SELECT
  idProduk, namaProduk, STATUS, harga
FROM produk
WHERE STATUS = "Tersedia";
SELECT * FROM produktersedia;

CREATE VIEW mesinrusak AS 
SELECT 
idMesin, namaMesin, Keterangan, Tgl_Pembelian, STATUS
FROM mesin
WHERE STATUS = "Rusak";
SELECT * FROM mesinrusak;

CREATE VIEW karyawan_mesin AS 
SELECT a.namaKaryawan, c.namaMesin
FROM karyawan a JOIN operator b ON a.idKaryawan=b.idKaryawan JOIN mesin c ON b.idMesin=c.idMesin;
SELECT * FROM karyawan_mesin;

CREATE VIEW jumlahproduksi AS
SELECT SUM(jml_Produksi) AS produksihariini 
FROM produksi WHERE tglProduksi = CURRENT_DATE; 
SELECT * FROM jumlahproduksi;
