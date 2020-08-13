class Produit {
  String id;
  String name;
  String codeSh;

  Produit({this.id, this.name, this.codeSh});

  factory Produit.fromJson(Map<String, dynamic> json) {
    return Produit(
      id: json["id"] as String,
      name: json["name"] as String,
      codeSh: json["coseSh"] as String,
    );
  }
}
