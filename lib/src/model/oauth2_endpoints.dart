import 'package:json_annotation/json_annotation.dart';

part 'oauth2_endpoints.g.dart';

/// Wrapper for all OAuth2 endpoints
@JsonSerializable()
class OAuth2Endpoints {
  /// URI for authorization
  @JsonKey(name: 'authorization_endpoint')
  final Uri authorization;

  /// URI for token exchange
  @JsonKey(name: 'token_endpoint')
  final Uri token;

  /// URI for token revocation
  @JsonKey(name: 'revocation_endpoint')
  final Uri? revocation;

  /// URI to end the current session
  @JsonKey(name: 'end_session_endpoint')
  final Uri? endSession;

  /// Construct with explicit URLs
  OAuth2Endpoints({
    required String authorization,
    required String token,
    String? revocation,
    String? endSession,
  })  : authorization = Uri.parse(authorization),
        token = Uri.parse(token),
        revocation = revocation != null ? Uri.parse(revocation) : null,
        endSession = endSession != null ? Uri.parse(endSession) : null;

  /// Construct with a base URL
  ///
  /// Convenient for services that have a consistent base URL. Optionally
  /// override endpoints with non-standard names.
  OAuth2Endpoints.base(
    String base, {
    String authorization = 'authorize',
    String token = 'token',
    String? revocation = 'revoke',
    String? endSession = 'end_session',
  }) : this(
          authorization: '$base/$authorization',
          token: '$base/$token',
          revocation: revocation != null ? '$base/$revocation' : null,
          endSession: endSession != null ? '$base/$endSession' : null,
        );

  /// From json
  factory OAuth2Endpoints.fromJson(Map<String, dynamic> json) =>
      _$OAuth2EndpointsFromJson(json);

  /// To json
  Map<String, dynamic> toJson() => _$OAuth2EndpointsToJson(this);
}
