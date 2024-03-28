CREATE VIEW view_anggota AS
SELECT id_anggota, nama_anggota,alamat,nomor_telepon,email
FROM anggota;
   

CREATE VIEW view_buku AS
SELECT id_buku,judul_buku,pengarang,penerbit,tahun_terbit,kategori
FROM buku;

SELECT * FROM view_buku 


  


