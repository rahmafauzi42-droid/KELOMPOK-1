START TRANSACTION;

-- Kurangi stok & buat transaksi baru
UPDATE stok SET Jumlah_Terjual = Jumlah_Terjual + 1 WHERE ID_Produk = 1;
INSERT INTO transaksi (Jumlah, Harga, ID_Pembeli, ID_Penjual, ID_Produk, Status_Transaksi)
VALUES (1, 4500000.00, 1, 1, 1, 'Menunggu');

-- Simulasikan error (misalnya stok habis)
-- ROLLBACK;   -- batalkan semua perubahan

-- Jika berhasil:
COMMIT;
