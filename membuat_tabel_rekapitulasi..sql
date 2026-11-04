SELECT
    pb.ID_Pembeli,
    COUNT(t.ID_Transaksi),
    COALESCE(SUM(t.Jumlah), 0),
    COALESCE(SUM(t.Total_Pembayaran), 0)
FROM pembeli pb
LEFT JOIN transaksi t
    ON pb.ID_Pembeli = t.ID_Pembeli
GROUP BY pb.ID_Pembeli;
