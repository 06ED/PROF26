class AuthModel {
  final String accessToken;
  final String tokenType;
  final int expiresIn;
  final int expiresAt;
  final String refreshToken;

  AuthModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.expiresAt,
    required this.refreshToken,
  });

  AuthModel.fromJSON(Map<String, dynamic> json)
    : this(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        expiresAt: json["expires_at"],
        refreshToken: json["refresh_token"],
      );
}
