import 'package:ai_notes_query/ai_notes_query.dart';

class AuthModel extends BaseModel {
  final String token;
  final UserModel record;

  AuthModel({required this.token, required this.record});

  AuthModel.fromJSON(Map<String, dynamic> json)
    : this(token: json["token"], record: UserModel.fromJSON(json["record"]));

  @override
  Map<String, dynamic> toJSON() => {"token": token, "record": record.toJSON()};
}
