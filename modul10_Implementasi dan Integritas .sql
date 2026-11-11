
INSERT INTO pengguna (Nama, Email, No_HP, Alamat, Tipe_Pengguna) VALUES
('Dafin Hazzaki', 'dafin@email.com', '081234567890', 'Jakarta Selatan', 'Penjual'),
('Bramantha Bagaskara', 'bagas@email.com', '081298765432', 'Bandung', 'Pembeli'),
('Admin Utama', 'admin@marketplace.com', '081111111111', 'Jakarta', 'Admin');


INSERT INTO penjual (No_Penjual, ID_Pengguna) VALUES ('PJ-001', 1);
INSERT INTO pembeli (No_Pembeli, ID_Pengguna) VALUES ('PB-001', 2);
INSERT INTO admin (No_Admin, ID_Pengguna) VALUES ('AD-001', 3);


INSERT INTO kategori (Nama_Kategori, Deskripsi_Kategori) VALUES
('Elektronik', 'Gadget dan perangkat elektronik bekas'),
('Fashion', 'Pakaian dan aksesoris bekas berkualitas');


INSERT INTO produk (Nama_Produk, Kondisi, Harga, Deskripsi, Lokasi, Berat, ID_Kategori, ID_Penjual) VALUES
('iPhone 12 128GB', 'Bekas - Baik', 4500000.00, 'Mulus, baterai 87%', 'Jakarta', 0.20, 1, 1),
('Jaket Denim Levi''s', 'Bekas - Sangat Baik', 250000.00, 'Size M, jarang dipakai', 'Bandung', 0.80, 2, 1);


INSERT INTO stok (ID_Produk, Jumlah_Awal, Jumlah_Terjual) VALUES
(1, 3, 0),
(2, 5, 1);


INSERT INTO transaksi (Jumlah, Harga, ID_Pembeli, ID_Penjual, ID_Produk, Status_Transaksi) VALUES
(1, 4500000.00, 1, 1, 1, 'Selesai'),
(1, 250000.00, 1, 1, 2, 'Menunggu');


INSERT INTO detail_transaksi (ID_Transaksi, ID_Produk, Jumlah, Status_Transaksi, Total_Pembayaran) VALUES
(1, 1, 1, 'Selesai', 4500000.00);

INSERT INTO pembayaran (Metode_Pembayaran, Jumlah_Pembayaran, Status_Pembayaran, Tanggal_Pembayaran, ID_Transaksi) VALUES
('Transfer Bank', 4500000.00, 'Berhasil', NOW(), 1);

INSERT INTO pengiriman (Alamat_Pengiriman, Kurir, No_Resi, Status_Pengiriman, ID_Transaksi) VALUES
('Jl. Melati No. 12, Bandung', 'JNE', 'JNE123456789', 'Dikirim', 1);
INSERT INTO pembayaran (Metode_Pembayaran, Jumlah_Pembayaran, Status_Pembayaran, Tanggal_Pembayaran, ID_Transaksi) VALUES
('Transfer Bank', 4500000.00, 'Berhasil', NOW(), 1);

INSERT INTO pengiriman (Alamat_Pengiriman, Kurir, No_Resi, Status_Pengiriman, ID_Transaksi) VALUES
('Jl. Melati No. 12, Bandung', 'JNE', 'JNE123456789', 'Dikirim', 1);

--Integritas Referensial
INSERT INTO produk (Nama_Produk, Kondisi, Harga, ID_Kategori, ID_Penjual)
VALUES ('Jaket Denim Levi''s', 'Bekas - Sangat Baik', 250000.00, 2, 1);
DELETE FROM pengguna WHERE ID_Pengguna = 1;
UPDATE kategori SET ID_Kategori = 10 WHERE ID_Kategori = 1;

