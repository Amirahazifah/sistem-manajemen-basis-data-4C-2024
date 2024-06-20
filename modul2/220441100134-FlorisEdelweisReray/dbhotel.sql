CREATE VIEW datatamu AS
SELECT Id_Tamu, Alamat FROM tamu;
UPDATE datatamu SET Alamat='Jl. Cikini Raya No. 15, Jakarta Pusat' WHERE Id_Tamu=1;
SELECT * FROM datatamu;

CREATE VIEW datatransaksi AS
SELECT Id_Transaksi, Metode_Pembayaran FROM transaksi;
UPDATE datatransaksi SET Metode_Pembayaran='Kartu Kredit' WHERE Id_Transaksi=10;
SELECT * FROM datatransaksi;



CREATE VIEW data_pemesanan AS
SELECT 
    p.ID_Pemesanan,
    t.Nama_Tamu,
    k.Nomor_Kamar,
    p.Tanggal_Checkin,
    p.Tanggal_Checkout
FROM 
    Pemesanan p
    JOIN Tamu t ON p.ID_Tamu = t.ID_Tamu
    JOIN Kamar k ON p.ID_Kamar = k.ID_Kamar;
SELECT * FROM data_pemesanan;


CREATE VIEW informasi_kamar_pemesanan AS
SELECT  
    Kamar.ID_Kamar, 
    Kamar.Nomor_Kamar, 
    Kamar.Tipe_Kamar, 
    Kamar.Harga_Malam, 
    Pemesanan.ID_Pemesanan, 
    Pemesanan.Tanggal_Checkin, 
    Pemesanan.Tanggal_Checkout 
FROM 
    Kamar 
INNER JOIN 
    Pemesanan ON Kamar.ID_Kamar = Pemesanan.ID_Kamar;

SELECT * FROM informasi_kamar_pemesanan;