import 'dart:convert';

import 'package:hivedb/model/kategori_barang_model.dart';
import 'package:http/http.dart' as http;

class BarangController {
  final String apiUrl = "http://10.0.2.2:8000/api/";

  Future<List<kategori_barang_model>> getKategoriBarang() async {
    var result = await http.get(Uri.parse("${apiUrl}barang/getAllKB/"));
    if (result.statusCode == 200) {
      var data = json.decode(result.body);
      List<kategori_barang_model> kategoriBarang = [];
      for (var i in data) {
        kategori_barang_model kategori = kategori_barang_model.fromMap(i);
        kategoriBarang.add(kategori);
      }
      return kategoriBarang;
    } else {
      throw Exception("Gagal mengambil data kategori barang");
    }
  }

  Future addKategoriBarang(kategori_barang_model kategoriBarang) async {
    var result = await http.post(Uri.parse("${apiUrl}barang/addKB/"), body: {
      "nama_kategori_barang": kategoriBarang.nama,
    });
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception("Gagal menambahkan  data kategori barang");
    }
  }
}
