class AuthModel {
  final String token;

  AuthModel({required this.token});

  AuthModel.fromJSON(Map<String, dynamic> json) : this(token: json["token"]);
}
