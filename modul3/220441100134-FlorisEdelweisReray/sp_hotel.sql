--1a--
DELIMITER //

CREATE PROCEDURE GetRoomByType(
    IN room_type VARCHAR(30)
)
BEGIN
    SELECT * FROM Kamar WHERE Tipe_Kamar = room_type;
END//

DELIMITER ;
CALL GetRoomByType('Standard Room');

--1b--
DELIMITER //

CREATE PROCEDURE CountTotalGuests(OUT total_guests INT)
BEGIN
    SELECT COUNT(*) INTO total_guests FROM Tamu;
END//

DELIMITER ;
CALL CountTotalGuests(@total_guests);
SELECT @total_guests;

--1c--
DELIMITER //

CREATE PROCEDURE UpdateRoomTypeByNumber(INOUT room_number VARCHAR(10), IN new_type VARCHAR(30))
BEGIN
    UPDATE Kamar SET Tipe_Kamar = new_type WHERE Nomor_Kamar = room_number;
END//

DELIMITER ;
SET @room_num := '11';
SET @new_type := Superior Room;
CALL UpdateRoomTypeByNumber(@room_num, @new_type);

--2--
DELIMITER //

CREATE PROCEDURE InsertNewGuest(IN guest_id INT(20), IN guest_name VARCHAR(50), IN guest_address VARCHAR(100), IN guest_phone VARCHAR(15))
BEGIN
    INSERT INTO Tamu(Id_Tamu, Nama_Tamu, Alamat, Nomor_Telepon) VALUES (guest_id, guest_name, guest_address, guest_phone);
END//

DELIMITER ;
CALL InsertNewGuest('21', 'Dwi Septiana', 'Jl. Sememi No. 30, Malang', '086543976542'); 

--3--
DELIMITER //

CREATE PROCEDURE UpdateGuestAddress(IN guest_id INT, IN new_address VARCHAR(100))
BEGIN
    UPDATE Tamu SET Alamat = new_address WHERE ID_Tamu = guest_id;
END//

DELIMITER ;
CALL UpdateGuestAddress(1, 'Jl. Mastrip No. 6, Jakarta Pusat');

--4--
DELIMITER //

CREATE PROCEDURE DeleteTransaction(
    IN transaction_id INT,
    IN booking_id INT,
    IN total_price INT(20),
    IN payment_method VARCHAR(20)
)
BEGIN
    DELETE FROM Transaksi 
    WHERE Id_Transaksi = transaction_id 
    AND Id_Pemesanan = booking_id 
    AND Total_Harga = total_price 
    AND Metode_Pembayaran = payment_method;
END//

DELIMITER ;
CALL DeleteTransaction(20, 20, 1240000, 'Kartu Kredit');

