SELECT
    pg.ID_Pengguna,
    pg.Nama,
    COUNT(t.ID_Transaksi) AS Total_Transaksi,
    SUM(t.Jumlah) AS Total_Barang_Dibeli,
    SUM(t.Total_Pembayaran) AS Total_Pembayaran
FROM pengguna pg
JOIN pembeli pb
    ON pg.ID_Pengguna = pb.ID_Pengguna
JOIN transaksi t
    ON pb.ID_Pembeli = t.ID_Pembeli
GROUP BY
    pg.ID_Pengguna,
    pg.Nama;

