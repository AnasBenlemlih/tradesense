class Regime {

  String id;
  String name;

  Regime({this.id,this.name});
  factory Regime.fromJson(Map<String, dynamic> json){
    
    return Regime(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }}