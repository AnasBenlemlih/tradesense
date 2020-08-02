class Pays {
  String id;
  String name;

  Pays({this.id, this.name});

  factory Pays.fromJson(Map<String, dynamic> json) {
    return Pays(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
  String getName() {
    return name;
  }
}
