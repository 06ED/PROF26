import 'package:ai_notes_query/ai_notes_query.dart';

class UserModel extends BaseModel {
  final String id;
  final String email;
  final DateTime created;

  UserModel({required this.id, required this.email, required this.created});

  UserModel.fromJSON(Map<String, dynamic> json)
    : this(
        id: json["id"],
        email: json["email"],
        created: DateTime.parse(json["created"]),
      );

  @override
  Map<String, dynamic> toJSON() => {
    "id": id,
    "email": email,
    "created": created.toIso8601String(),
  };
}
