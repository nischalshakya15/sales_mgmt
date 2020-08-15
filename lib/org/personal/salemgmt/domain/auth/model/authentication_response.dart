import 'package:json_annotation/json_annotation.dart';

part 'authentication_response.g.dart';

@JsonSerializable()
class AuthenticationResponse {
  String accessToken;
  String refreshToken;

  AuthenticationResponse({this.accessToken, this.refreshToken});

  factory AuthenticationResponse.fromJson(
          Map<String, dynamic> authenticationRequest) =>
      _$AuthenticationResponseFromJson(authenticationRequest);

  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

  @override
  String toString() {
    return 'AuthenticationResponse{accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}
