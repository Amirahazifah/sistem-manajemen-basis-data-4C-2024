CREATE PROCEDURE transaksi_terakhir(
	IN id INT
	)

SELECT nama, DATEDIFF(NOW(),tanggal_kembali) AS transaksi_terakhir FROM pelanggan NATURAL JOIN transaksi_sewa WHERE id_pelanggan=id;
CALL transaksi_terakhir(17);

CREATE PROCEDURE jumlah_transaksi_produk(
	IN tgl_kembali INT
	)
	
SELECT model,COUNT(id_mobil)AS total_transaksi FROM mobil NATURAL JOIN transaksi_sewa 
NATURAL JOIN detail_transaksi WHERE MONTH(tanggal_kembali)=tgl_kembali
GROUP BY model;
CALL jumlah_transaksi_produk(03);

INSERT INTO transaksi_sewa (id_mobil, id_pelanggan, tanggal_sewa, tanggal_kembali, total_biaya) VALUES
(1, 8, '2024-02-01', '2024-02-05', 1250000)

CREATE PROCEDURE tambah_data_transaksi(
    IN id_mbl INT,
    IN id_plnggn INT,
    IN tgl_sewa DATE ,
    IN ttl_biaya BIGINT
)
    INSERT INTO transaksi_sewa (id_mobil, id_pelanggan,tanggal_sewa,tanggal_kembali,total_biaya)
    VALUES (id_mbl,id_plnggn,tgl_sewa,NOW(),ttl_biaya);

 CALL tambah_data_transaksi(15,15,'2024-05-19',150000);
 DROP PROCEDURE tambah_data_transaksi;