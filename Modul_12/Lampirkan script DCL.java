app.createRole({
  role: "role_laporan_read",
  privileges: [
    { resource: { db: "marketplace_barang_bekas", collection: "transaksi" }, actions: ["find"] }
  ],
  roles: []
});app.createUser({
  user: "report_user",
  pwd: "ReportUser#2026",            // ganti sesuai kebutuhan; jangan dipakai di produksi
  roles: [{ role: "role_laporan_read", db: "marketplace_barang_bekas" }]
});

print("--- getUser(report_user) ---");
printjson(app.getUser("report_user", { showPrivileges: true }));
print("--- getRole(role_laporan_read) ---");
printjson(app.getRole("role_laporan_read", { showPrivileges: true }));
print("--- daftar user & role di database ---");
printjson(app.getUsers().map(u => ({ user: u.user, roles: u.roles })));
printjson(app.getRoles().map(r => r.role));

const d = db.getSiblingDB("marketplace_barang_bekas");
function uji(no, nama, harapan, fn) {
  try {
    const r = fn();
    print(`[${no}] ${nama}\n    harapan: ${harapan} | hasil: DIIZINKAN -> ${JSON.stringify(r)}`);
  } catch (e) {
    print(`[${no}] ${nama}\n    harapan: ${harapan} | hasil: DITOLAK -> ${e.codeName || e.name} (code ${e.code}): ${e.message}`);
  }
}

print("whoami:", JSON.stringify(d.runCommand({ connectionStatus: 1 }).authInfo.authenticatedUsers));

uji("U1", "find transaksi", "DIIZINKAN", () => d.transaksi.find({}, { _id: 1, status_transaksi: 1 }).toArray());
uji("U2", "countDocuments transaksi", "DIIZINKAN", () => d.transaksi.countDocuments());
uji("U3", "aggregate $group per status", "DIIZINKAN", () =>
  d.transaksi.aggregate([{ $group: { _id: "$status_transaksi", total: { $sum: "$total_pembayaran" } } }]).toArray());

uji("U4", "insertOne transaksi", "DITOLAK", () => d.transaksi.insertOne({ _id: 999, status_transaksi: "Uji" }));
uji("U5", "updateOne transaksi", "DITOLAK", () => d.transaksi.updateOne({ _id: 999 }, { $set: { status_transaksi: "Selesai" } }));
uji("U6", "deleteOne transaksi", "DITOLAK", () => d.transaksi.deleteOne({ _id: 999 }));
uji("U7", "find collection lain (produk)", "DITOLAK", () => d.produk.find().toArray());
uji("U8", "createIndex transaksi", "DITOLAK", () => d.transaksi.createIndex({ id_produk: 1 }));
uji("U9", "drop collection transaksi", "DITOLAK", () => d.transaksi.drop());
uji("U10", "createUser", "DITOLAK", () => d.createUser({ user: "x", pwd: "x", roles: [] }));
