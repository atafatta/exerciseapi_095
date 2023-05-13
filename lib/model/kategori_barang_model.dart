// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class kategori_barang_model {
  final String nama;
  kategori_barang_model({
    required this.nama,
  });

  kategori_barang_model copyWith({
    String? nama,
  }) {
    return kategori_barang_model(
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama_kategori_barang': nama,
    };
  }

  factory kategori_barang_model.fromMap(Map<String, dynamic> map) {
    return kategori_barang_model(
      nama: map['nama_kategori_barang'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory kategori_barang_model.fromJson(String source) => kategori_barang_model
      .fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'kategori_barang_model(nama: $nama)';

  @override
  bool operator ==(covariant kategori_barang_model other) {
    if (identical(this, other)) return true;

    return other.nama == nama;
  }

  @override
  int get hashCode => nama.hashCode;
}
