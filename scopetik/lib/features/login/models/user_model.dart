class UserModel {
  //A firebase Auth ID token for the authenticated user.
  final String idToken;
  final String email;

  //A firebase Auth refresh token for authenticated user.
  final String refreshToken;

  //The number of seconds in which the ID token expires.
  final String expiresIn;

  //The uid of the authenticated user.
  final String localId;
  final bool registered;

  final String displayName;

  UserModel({
    required this.idToken,
    required this.email,
    required this.expiresIn,
    required this.localId,
    required this.refreshToken,
    required this.registered,
    required this.displayName,
  });

  //from Json function
 factory  UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idToken: json['idToken'],
      email: json['email'],
      expiresIn: json['expiresIn'],
      localId: json['localId'],
      refreshToken: json['refreshToken'],
      registered: json['registered'],
      displayName: json['displayName'],
    );
  }
}
