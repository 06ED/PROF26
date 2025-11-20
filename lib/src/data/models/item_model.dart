class ItemModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final String created;

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
        created: json["created"],
      );
}
