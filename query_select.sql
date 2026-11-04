CREATE TABLE rekap_transaksi_pembeli (
    ID_Pembeli INT PRIMARY KEY,
    Total_Transaksi INT DEFAULT 0,
    Total_Barang_Dibeli INT DEFAULT 0,
    Total_Pembayaran DECIMAL(14,2) DEFAULT 0,
    FOREIGN KEY (ID_Pembeli)
        REFERENCES pembeli(ID_Pembeli)
);


SELECT
    pb.ID_Pembeli,
    COUNT(t.ID_Transaksi),
    COALESCE(SUM(t.Jumlah), 0),
    COALESCE(SUM(t.Total_Pembayaran), 0)
FROM pembeli pb
LEFT JOIN transaksi t
    ON pb.ID_Pembeli = t.ID_Pembeli
GROUP BY pb.ID_Pembeli;

