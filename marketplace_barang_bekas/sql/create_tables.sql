CREATE TABLE pengguna (
    ID_Pengguna INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    No_HP VARCHAR(20),
    Alamat TEXT,
    Tipe_Pengguna ENUM('Pembeli','Penjual','Admin') NOT NULL
) ENGINE=InnoDB;

CREATE TABLE kategori (
    ID_Kategori INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Kategori VARCHAR(100) NOT NULL,
    Deskripsi_Kategori TEXT
) ENGINE=InnoDB;

CREATE TABLE pembeli (
    ID_Pembeli INT AUTO_INCREMENT PRIMARY KEY,
    No_Pembeli VARCHAR(30),
    ID_Pengguna INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Pengguna)
        REFERENCES pengguna(ID_Pengguna)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE penjual (
    ID_Penjual INT AUTO_INCREMENT PRIMARY KEY,
    No_Penjual VARCHAR(30),
    ID_Pengguna INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Pengguna)
        REFERENCES pengguna(ID_Pengguna)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE admin (
    ID_Admin INT AUTO_INCREMENT PRIMARY KEY,
    No_Admin VARCHAR(30),
    ID_Pengguna INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Pengguna)
        REFERENCES pengguna(ID_Pengguna)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE produk (
    ID_Produk INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Produk VARCHAR(150) NOT NULL,
    Kondisi VARCHAR(50) NOT NULL,
    Harga DECIMAL(12,2) NOT NULL,
    Deskripsi TEXT,
    Foto VARCHAR(255),
    Lokasi VARCHAR(150),
    Berat DECIMAL(10,2),
    ID_Kategori INT NOT NULL,
    ID_Penjual INT NOT NULL,
    INDEX idx_produk_nama (Nama_Produk),
    INDEX idx_produk_lokasi (Lokasi),
    FOREIGN KEY (ID_Kategori)
        REFERENCES kategori(ID_Kategori)
        ON UPDATE CASCADE,
    FOREIGN KEY (ID_Penjual)
        REFERENCES penjual(ID_Penjual)
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE stok (
    ID_Stok INT AUTO_INCREMENT PRIMARY KEY,
    ID_Produk INT NOT NULL UNIQUE,
    Jumlah_Awal INT NOT NULL DEFAULT 0,
    Jumlah_Terjual INT NOT NULL DEFAULT 0,
    Jumlah_Tersedia INT
        GENERATED ALWAYS AS
        (Jumlah_Awal - Jumlah_Terjual) STORED,
    FOREIGN KEY (ID_Produk)
        REFERENCES produk(ID_Produk)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE transaksi (
    ID_Transaksi INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Transaksi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Jumlah INT NOT NULL,
    Harga DECIMAL(12,2) NOT NULL,
    ID_Pembeli INT NOT NULL,
    ID_Penjual INT NOT NULL,
    ID_Produk INT NOT NULL,
    Status_Transaksi VARCHAR(30) NOT NULL DEFAULT 'Menunggu',
    Total_Pembayaran DECIMAL(14,2)
        GENERATED ALWAYS AS (Jumlah * Harga) STORED,
    INDEX idx_transaksi_status (Status_Transaksi),
    FOREIGN KEY (ID_Pembeli)
        REFERENCES pembeli(ID_Pembeli)
        ON UPDATE CASCADE,
    FOREIGN KEY (ID_Penjual)
        REFERENCES penjual(ID_Penjual)
        ON UPDATE CASCADE,
    FOREIGN KEY (ID_Produk)
        REFERENCES produk(ID_Produk)
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE detail_transaksi (
    ID_Detail INT AUTO_INCREMENT PRIMARY KEY,
    ID_Transaksi INT NOT NULL,
    ID_Produk INT NOT NULL,
    Jumlah INT NOT NULL,
    Status_Transaksi VARCHAR(30) NOT NULL,
    Total_Pembayaran DECIMAL(14,2) NOT NULL,
    FOREIGN KEY (ID_Transaksi)
        REFERENCES transaksi(ID_Transaksi),
    FOREIGN KEY (ID_Produk)
        REFERENCES produk(ID_Produk)
) ENGINE=InnoDB;

CREATE TABLE pembayaran (
    ID_Pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    Metode_Pembayaran VARCHAR(50) NOT NULL,
    Jumlah_Pembayaran DECIMAL(14,2) NOT NULL,
    Status_Pembayaran VARCHAR(30) NOT NULL DEFAULT 'Menunggu',
    Tanggal_Pembayaran DATETIME,
    ID_Transaksi INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Transaksi)
        REFERENCES transaksi(ID_Transaksi)
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE pengiriman (
    ID_Pengiriman INT AUTO_INCREMENT PRIMARY KEY,
    Alamat_Pengiriman TEXT NOT NULL,
    Kurir VARCHAR(100),
    No_Resi VARCHAR(100) UNIQUE,
    Status_Pengiriman VARCHAR(30) NOT NULL DEFAULT 'Menunggu',
    ID_Transaksi INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Transaksi)
        REFERENCES transaksi(ID_Transaksi)
        ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE laporan (
    ID_Laporan INT AUTO_INCREMENT PRIMARY KEY,
    Jenis_Laporan VARCHAR(100) NOT NULL,
    Tanggal_Laporan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Keterangan TEXT,
    ID_Pengguna INT NOT NULL,
    FOREIGN KEY (ID_Pengguna)
        REFERENCES pengguna(ID_Pengguna)
        ON UPDATE CASCADE
) ENGINE=InnoDB;
