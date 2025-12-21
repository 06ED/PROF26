class AIModel {
  final String id;
  final String name;

  AIModel({required this.id, required this.name});

  AIModel.fromJSON(Map<String, dynamic> json)
    : this(id: json["id"], name: json["name"]);

  static List<AIModel> fromListJSON(List list) {
    return list.map((item) => AIModel.fromJSON(item)).toList();
  }

  bool isEqual(AIModel model) => id == model.id;

  @override
  String toString() => name;
}
