import 'package:ai_notes_query/ai_notes_query.dart';

class NoteModel extends BaseModel {
  final String id;
  final String userId;
  final String name;
  final String text;
  final DateTime created;
  final DateTime updated;

  NoteModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.text,
    required this.created,
    required this.updated,
  });

  NoteModel.fromJSON(Map<String, dynamic> json)
    : this(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        text: json["text"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  static List<NoteModel> fromJSONList(List list) =>
      list.map((element) => NoteModel.fromJSON(element)).toList();

  @override
  Map<String, dynamic> toJSON() => {
    "id": id,
    "userId": userId,
    "name": name,
    "text": text,
    "created": created.toIso8601String(),
    "updated": updated.toIso8601String(),
  };
}
