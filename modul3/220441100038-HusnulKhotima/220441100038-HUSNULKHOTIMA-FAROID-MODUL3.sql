==== IN ==========
DELIMITER//
CREATE PROCEDURE tambah_pengiriman (
    IN p_PengirimanID INT
    )
BEGIN
SELECT*FROM pengiriman WHERE PengirimanID = P_PengirimanID;
END//

DELIMITER;
CALL tambah_pengiriman(1008);

=========OUT===========  
DELIMITER//   
CREATE PROCEDURE total_biaya_pengiriman (
    OUT total_biaya INT
)
BEGIN
    SELECT SUM(TotalBiaya) INTO total_biaya FROM pengiriman;
END//

CALL total_biaya_pengiriman(@total_biaya);
SELECT @total_biaya AS Total_Biaya_Pengiriman;


==========INOUT============
DELIMITER //
CREATE PROCEDURE UpdateTotalBerat(
    INOUT p_CustomerID INT,
    IN p_new_total_berat DECIMAL(10, 2)
)
BEGIN 
    UPDATE pengiriman 
    SET TotalBerat = p_new_total_berat
    WHERE CustomerID = p_CustomerID;
END //
DELIMITER ;

SET @p_CustomerID=5;
CALL Updatetotalberat(@p_CustomerID, 800.00);

=======Tambah data pada tabel Customer============
DELIMITER //
CREATE PROCEDURE TambahCustomer(
    IN p_nama VARCHAR(255),
    IN p_alamat VARCHAR(100),
    IN p_kota VARCHAR(100),
    IN p_telp VARCHAR(100)
)
BEGIN
    INSERT INTO customer(NamaCustomer, Alamat, Kota, Telp) 
    VALUES(p_nama, p_alamat, p_kota, p_telp);
    
END //
DELIMITER ;

CALL TambahCustomer('Khotima', 'Telang', "Bangkalan", "0851453097");
SELECT * FROM customer;

=============update data pada taebl customer=================
DELIMITER //
CREATE PROCEDURE UpdateCustomer(
    IN p_CustomerID INT,
    IN p_nama VARCHAR(255),
    IN p_alamat VARCHAR(100),
    IN p_kota VARCHAR(100),
    IN p_telp VARCHAR(100)
)
BEGIN
    UPDATE customer
    SET NamaCustomer = p_nama,
        Alamat = p_alamat,
        Kota = p_kota,
        Telp = p_telp
    WHERE CustomerID = p_CustomerID;
END //
DELIMITER ;
CALL Updatecustomer(23, 'saya', 'Jl. Telang indah', 'Bangkl', 086458765321);


=============hapus data pada tabel customer================
DELIMITER //
CREATE PROCEDURE Deletecustomer(
    IN p_Customer_id INT
)
BEGIN
    DELETE FROM customer WHERE CustomerID = p_Customer_id;
END //

DELIMITER ;
CALL Deletecustomer(22);