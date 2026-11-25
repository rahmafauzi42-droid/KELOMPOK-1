db.createRole({
  role: "role_baca_katalog",
  privileges: [
    { resource: { db: "marketplace_barang_bekas", collection: "produk" },   actions: ["find"] },
    { resource: { db: "marketplace_barang_bekas", collection: "kategori" }, actions: ["find"] },
    { resource: { db: "marketplace_barang_bekas", collection: "stok" },     actions: ["find"] }
  ],
  roles: []
});
db.createUser({ user: "petugas_baca", pwd: "Password123!", roles: ["role_baca_katalog"] });
db.produk.find();                                        
db.produk.insertOne({ Nama_Produk: "Produk Ilegal" });   
db.pengguna.find();                                      
db.revokeRolesFromUser("petugas_baca", ["role_baca_katalog"]);
db.produk.find();  
