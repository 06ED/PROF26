class ItemModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final DateTime created;

  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.created,
  });

  ItemModel.fromJSON(Map<String, dynamic> json)
    : this(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        created: DateTime.parse(json["created"]),
      );
}
