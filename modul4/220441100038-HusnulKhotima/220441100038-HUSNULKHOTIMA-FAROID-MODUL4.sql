-- menampilkan dan mengurutkan menggunakan ASC
SELECT*FROM karyawan
ORDER BY NamaKaryawan ASC;
-- menampilkan dan mengurutkan menggunakan DESC
SELECT*FROM karyawan
ORDER BY NamaKaryawan DESC;
---having--
SELECT TotalBiaya, COUNT(*) AS jumlah_paket
FROM pengiriman
GROUP BY Totalbiaya
HAVING TotalBiaya > 600000
ORDER BY jumlah_paket DESC;
--menampilkan data berdasarkan tanggal
SELECT TanggalPengiriman FROM pengiriman
WHERE TanggalPengiriman BETWEEN '2024-03-01' AND '2024-03-   30';
--menampilkan nam produk yang banyak muncul
SELECT NamaProduk, COUNT(*) AS jumlah_muncul
FROM produk
GROUP BY NamaProduk
ORDER BY jumlah_muncul DESC;
--menampilkan produk yang sedikit
SELECT NamaProduk, COUNT(*) AS jumlah_muncul
FROM produk
GROUP BY NamaProduk
ORDER BY jumlah_muncul ASC;
--menampilkan nama karyawan awalan huruf 'a'
SELECT*FROM karyawan
WHERE NamaKaryawan LIKE 'a%';
--menampilkan customer yang banyak melakukan transaksi
SELECT NamaCustomer, COUNT(*) AS jumlah_transaksi
FROM customer
GROUP BY NamaCustomer
ORDER BY jumlah_transaksi DESC
LIMIT 1;
---menampilkan customer yang melakukan transaksi lebih darai 3
SELECT NamaCustomer, COUNT(*) AS jumlah_transaksi
FROM customer
GROUP BY NamaCustomer
HAVING COUNT(*) > 3
LIMIT 1;
--menempilkan semua data customer dan transaksinya
SELECT customer.CustomerID,customer.NamaCustomer,customer.Alamat, customer.Kota,customer.Telp,pengiriman.pengirimanID,pengiriman.TanggalPengiriman,pengiriman.TotalBerat,pengiriman.TotalBiaya
FROM customer JOIN pengiriman ON customer.CustomerID = pengiriman.CustomerID;



