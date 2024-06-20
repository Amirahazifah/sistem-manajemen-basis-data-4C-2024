CREATE TABLE admin_perpus (
id_admin INTEGER NOT NULL AUTO_INCREMENT, 
nama_lengkap VARCHAR(125) NULL,
username VARCHAR(125) NOT NULL,
pass VARCHAR(125) NOT NULL,
CONSTRAINT pk_admin PRIMARY KEY (id_admin));

CREATE TABLE anggota (
id_anggota INTEGER NOT NULL AUTO_INCREMENT,
id_admin INTEGER NULL,
nama_full VARCHAR(125) NOT NULL,
tmpt_lahir VARCHAR(100) NOT NULL,
tgl_lahir DATE NOT NULL,
alamat LONG VARCHAR NULL,
gender CHAR(1),
hp VARCHAR(20),
CONSTRAINT pk_anggota PRIMARY KEY (id_anggota));

CREATE TABLE buku_pepus (
   id_buku INTEGER NOT NULL AUTO_INCREMENT,
   id_admin INTEGER NULL,
   judul VARCHAR(150) NULL,
   penulis VARCHAR(125) NULL,
   penerbit VARCHAR(125) NULL,
   tahun_terbit CHAR(4) NULL,
   jumlah INTEGER NULL,
   CONSTRAINT pk_buku PRIMARY KEY (id_buku));
   
CREATE TABLE detail_pinjam (
   id_peminjaman INTEGER NOT NULL AUTO_INCREMENT,
   id_pinjam INTEGER NULL,
   id_buku INTEGER NULL,
   tgl_kembali DATE NULL,
   denda INTEGER NULL,
   status_peminjaman VARCHAR(20) NULL,
   CONSTRAINT pk_detail_pinjam PRIMARY KEY (id_peminjaman));
   
CREATE TABLE peminjaman (
   id_pinjam INTEGER NOT NULL	AUTO_INCREMENT,
   id_anggota INTEGER NULL,
   id_admin INTEGER NULL,
   tgl_kembali DATE NULL,
   CONSTRAINT pk_peminjaman PRIMARY KEY (id_pinjam));
   
ALTER TABLE anggota
ADD CONSTRAINT fk_id_admin FOREIGN KEY (id_admin) REFERENCES admin_perpus (id_admin);

ALTER TABLE buku_pepus
ADD CONSTRAINT fk_buku_id_admin FOREIGN KEY (id_admin) REFERENCES admin_perpus (id_admin);

ALTER TABLE detail_pinjam
ADD CONSTRAINT fk_detail_id_pinjam 
FOREIGN KEY (id_pinjam) REFERENCES peminjaman (id_pinjam),
ADD CONSTRAINT fk_detail_buku
FOREIGN KEY (id_buku) REFERENCES buku_pepus (id_buku);

ALTER TABLE peminjaman
ADD CONSTRAINT fk_pinjam_id_admin
FOREIGN KEY (id_admin) REFERENCES admin_perpus (id_admin),
ADD CONSTRAINT fk_pinjam_id_anggota 
FOREIGN KEY (id_anggota) REFERENCES anggota (id_anggota);
