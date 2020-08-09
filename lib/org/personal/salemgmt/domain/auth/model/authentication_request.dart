import 'package:json_annotation/json_annotation.dart';

part 'authentication_request.g.dart';

@JsonSerializable()
class AuthenticationRequest {
  String userName;
  String password;

  AuthenticationRequest({this.userName, this.password});

  factory AuthenticationRequest.fromJson(
          Map<String, dynamic> authenticationRequest) =>
      _$AuthenticationRequestFromJson(authenticationRequest);

  Map<String, dynamic> toJson() => _$AuthenticationRequestToJson(this);
}
