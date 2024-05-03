`mahasiswa``mahasiswa``mahasiswa``mahasiswa`CREATE VIEW updatable_maskapai AS
SELECT * FROM Maskapai;

CREATE OR REPLACE VIEW updatable_maskapai AS
SELECT Kode_Maskapai, Nama_Maskapai
FROM Maskapai;

UPDATE updatable_maskapai
SET Nama_Maskapai = 'Maskapai_Baru'
WHERE Kode_Maskapai = 'MSK01';

SELECT* FROM maskapai;

UPDATE updatable_jadwal_penerbangan
SET Waktu_Berangkat = '2024-04-01 09:00:00'
WHERE ID_Jadwal = 1;

CREATE VIEW detail_penerbangan AS
SELECT 
    jadwal.ID_Jadwal,
    rute.Kode_Bandara_Asal,
    rute.Kode_Bandara_Tujuan,
    maskapai.Nama_Maskapai,
    jadwal.Waktu_Berangkat,
    jadwal.Waktu_Tiba
FROM 
    Jadwal_Penerbangan jadwal
JOIN 
    Rute rute ON jadwal.Kode_Rute = rute.Kode_Rute
JOIN 
    Maskapai maskapai ON jadwal.Kode_Maskapai = maskapai.Kode_Maskapai;
SELECT * FROM detail_penerbangan;

SELECT * FROM tiket_penerbangan;

CREATE VIEW detail_pembayaran AS
SELECT 
    tiket.ID_Tiket,
    pembayaran.Metode_Pembayaran,
    pembayaran.Total_Bayar
FROM 
    Tiket_Penerbangan tiket
JOIN 
    Pembayaran pembayaran ON tiket.ID_Tiket = pembayaran.ID_Tiket;
SELECT * FROM detail_pembayaran;
