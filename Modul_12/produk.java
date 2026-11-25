db.produk.insertMany([
  {
    _id: 1,
    nama_produk: "iPhone 12 128GB",
    kondisi: "Bekas - Baik",
    harga: 4500000,
    deskripsi: "Mulus, baterai 87%",
    foto: null,
    lokasi: "Jakarta",
    berat: 0.20,
    atribut: null,
    metadata: null,
    id_kategori: 1,
    id_penjual: 1
  },
  {
    _id: 2,
    nama_produk: "Jaket Denim Levi's",
    kondisi: "Bekas - Sangat Baik",
    harga: 250000,
    deskripsi: "Size M, jarang dipakai",
    foto: null,
    lokasi: "Bandung",
    berat: 0.80,
    atribut: null,
    metadata: null,
    id_kategori: 2,
    id_penjual: 1
  },
  {
    _id: 3,
    nama_produk: "Samsung Galaxy S21",
    kondisi: "Bekas - Baik",
    harga: 4500000,
    deskripsi: "HP bekas mulus, lengkap box",
    foto: "s21.jpg",
    lokasi: "Jakarta Selatan",
    berat: 0.17,
    atribut: {
      merek: "Samsung",
      ram: "8GB",
      penyimpanan: "128GB",
      kelengkapan: ["Box", "Charger", "Kabel"],
      kondisi_baterai: "85%",
      kelengkapan_tambahan: ["Earphone", "Manual Book"]
    },
    metadata: {
      rating: 4.5,
      tags: ["android", "flagship", "bekas-bagus"],
      garansi_sisa_bulan: 3
    },
    id_kategori: 1,
    id_penjual: 1
  },
  {
    _id: 5,
    nama_produk: "Laptop Lenovo IdeaPad Slim 3",
    kondisi: "Bekas - Baik",
    harga: 4800000,
    deskripsi: "Laptop bekas mulus, performa masih kencang, lengkap charger & box",
    foto: "ideapad-slim3.jpg",
    lokasi: "Bekasi",
    berat: 1.35,
    atribut: {
      merek: "Lenovo",
      processor: "AMD Ryzen 5 5500U",
      ram: "8GB",
      storage: "512GB SSD",
      ukuran_layar: "14 inch",
      tahun_beli: 2023,
      kelengkapan: ["Charger", "Box", "Tas Laptop"]
    },
    metadata: {
      rating: 4.6,
      tags: ["laptop", "kuliah", "kerja", "ringan"],
      garansi_sisa_bulan: 5
    },
    id_kategori: 2,
    id_penjual: 1
  }
]);
