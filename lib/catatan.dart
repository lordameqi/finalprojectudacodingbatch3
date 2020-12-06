class Catatan {
  String id;
  String catatan;
  String lastName;

  Catatan({this.id, this.catatan});

  factory Catatan.fromJson(Map<String, dynamic> json) {
    return Catatan(
      id: json['id_catatan'] as String,
      catatan: json['catatan'] as String,
    );
  }
}
