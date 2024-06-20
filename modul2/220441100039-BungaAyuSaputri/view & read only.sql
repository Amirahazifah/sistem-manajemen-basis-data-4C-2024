--updatableview
CREATE VIEW datapasien AS
SELECT id_pasien, nama_pasien FROM pasien;
UPDATE datapasien SET nama_pasien='Nasywa Rina' WHERE id_pasien=2;
SELECT * FROM datapasien;

CREATE VIEW datadokter AS
SELECT id_dokter, nama_dokter FROM dokter;
UPDATE datadokter SET nama_dokter='Dr. Ayu Saputri' WHERE id_dokter=4102;
SELECT * FROM datadokter;

--readonly
CREATE VIEW datakunjung AS
SELECT nama_dokter, keluhan FROM dokter JOIN kunjungan ON dokter.id_dokter=kunjungan.id_dokter;
SELECT * FROM datakunjung;

CREATE VIEW databayar AS
SELECT keluhan, total FROM kunjungan JOIN pembayaran ON kunjungan.id_kunjungan=pembayaran.id_kunjungan;
SELECT * FROM databayar;