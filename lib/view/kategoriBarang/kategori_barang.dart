import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../controller/kategori_barang_controler.dart';
import '../../model/kategori_barang_model.dart';
import 'add_kategori_barang.dart';
import 'edit_kategori_barang.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  final kategoriBarangController = BarangController();
  List<kategori_barang_model> listKategoriBarang = [];

  @override
  void initState() {
    // TODO: implement initState
    getKategoriBarang();
    super.initState();
  }

  void getKategoriBarang() async {
    final kategoriBarang = await kategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = kategoriBarang;
    });
  }

  void editKategoriBarang(kategori_barang_model kategoriBarang) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditKategoriBarang(
          kategoriBarang: kategori_Barang,
        ),
      ),
    );
    getKategoriBarang();
  }

  void deleteKategoriBarang(kategori_barang_model kategoriBarang) {
    setState(() {
      listKategoriBarang.remove(kategoriBarang);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kategori Barang"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: listKategoriBarang.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(listKategoriBarang[index].nama),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        editKategoriBarang(listKategoriBarang[index]);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        deleteKategoriBarang(listKategoriBarang[index]);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const addKategoriBarang(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
