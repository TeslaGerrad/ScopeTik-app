class UserModel {
  //A firebase Auth ID token for the authenticated user.
  final String idToken;
  final String email;

  //A firebase Auth refresh token for authenticated user.
  final String refreshToken;

  //The number of seconds in which the ID token expires.
  final String expiresln;

  //The uid of the authenticated user.
  final String localId;
  final bool registered;

  UserModel({
    required this.idToken,
    required this.email,
    required this.expiresln,
    required this.localId,
    required this.refreshToken,
    required this.registered,
  });
}
