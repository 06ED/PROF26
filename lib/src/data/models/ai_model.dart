class AIModel {
  final String id;
  final String name;

  AIModel({required this.id, required this.name});

  AIModel.fromJSON(Map<String, dynamic> json)
    : this(id: json["id"], name: json["name"]);
}
