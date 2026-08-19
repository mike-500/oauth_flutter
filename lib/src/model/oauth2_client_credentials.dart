/// A wrapper for OAuth2 client credentials
class OAuth2ClientCredentials {
  /// The client ID
  final String id;

  /// The client secret
  final String? secret;

  /// Constructor
  const new({required this.id, this.secret});
}
