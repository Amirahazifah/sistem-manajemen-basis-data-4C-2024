CREATE VIEW ViewDaftarJadwal AS
SELECT jadwal_kereta.id_jadwal, kereta.nama_kereta, rute.stasiun_asal, rute.stasiun_tujuan, jadwal_kereta.waktu_berangkat, jadwal_kereta.waktu_sampai, tiket.jumlah_tiket
FROM jadwal_kereta
JOIN kereta ON jadwal_kereta.id_kereta = kereta.id_kereta
JOIN rute ON jadwal_kereta.id_rute = rute.id_rute
JOIN tiket ON jadwal_kereta.id_jadwal = tiket.id_jadwal;
SELECT * FROM ViewDaftarJadwal;

-- Update pada view ViewDaftarJadwal
UPDATE ViewDaftarJadwal
SET jumlah_tiket = 47
WHERE id_jadwal = 1;

CREATE VIEW ViewTiketDijual AS
SELECT tiket.id_tiket, jadwal_kereta.id_jadwal, kereta.nama_kereta, rute.stasiun_asal, rute.stasiun_tujuan, jadwal_kereta.waktu_berangkat, jadwal_kereta.waktu_sampai, tiket.harga, tiket.jumlah_tiket
FROM tiket
JOIN jadwal_kereta ON tiket.id_jadwal = jadwal_kereta.id_jadwal
JOIN kereta ON jadwal_kereta.id_kereta = kereta.id_kereta
JOIN rute ON jadwal_kereta.id_rute = rute.id_rute
WHERE tiket.jumlah_tiket > 0;
SELECT * FROM ViewTiketDijual;

-- Update pada view ViewTiketDijual
UPDATE ViewTiketDijual
SET harga = 255000
WHERE id_tiket = 2;

CREATE VIEW StasiunInfoView AS
SELECT id_stasiun, nama_stasiun, lokasi_tujuan
FROM stasiun;
SELECT * FROM StasiunInfoView;

CREATE VIEW InfoKeretaView AS
SELECT id_kereta, nama_kereta, jenis_kereta, kapasitas
FROM kereta;
SELECT * FROM InfoKeretaView;

