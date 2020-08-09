// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequest _$AuthenticationRequestFromJson(
    Map<String, dynamic> json) {
  return AuthenticationRequest(
    userName: json['userName'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthenticationRequestToJson(
        AuthenticationRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
    };
