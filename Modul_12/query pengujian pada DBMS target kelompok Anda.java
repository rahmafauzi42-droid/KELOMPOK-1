db.kategori.insertMany([
  { kategori_id: 1, nama_kategori: "Elektronik" },
  { kategori_id: 2, nama_kategori: "Fashion" }
]);
db.produk.insertMany([
  { produk_id: 1, kategori_id: 1, nama_produk: "iPhone 12 128GB", harga: 4500000, kondisi: "Bekas - Baik", status: "tersedia" },
  { produk_id: 2, kategori_id: 2, nama_produk: "Jaket Denim Levi's", harga: 250000, kondisi: "Bekas - Sangat Baik", status: "tersedia" },
  { produk_id: 3, kategori_id: 1, nama_produk: "Samsung Galaxy S21", harga: 4500000, kondisi: "Bekas - Baik", status: "tersedia" },
  { produk_id: 5, kategori_id: 2, nama_produk: "Laptop Lenovo IdeaPad Slim 3", harga: 4800000, kondisi: "Bekas - Baik", status: "tersedia" }
]);
db.produk.aggregate([
  { $match: { kategori_id: 1, harga: { $gte: 4000000 } } },
  { $lookup: { from: "kategori", localField: "kategori_id", foreignField: "kategori_id", as: "kat" } },
  { $unwind: "$kat" },
  { $project: { _id: 0, produk_id: 1, nama_produk: 1, harga: 1, nama_kategori: "$kat.nama_kategori" } }
]);
 
