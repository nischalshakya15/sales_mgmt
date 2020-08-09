// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    username: json['username'] as String,
    authorities: (json['authorities'] as List)
        ?.map((e) =>
            e == null ? null : Authority.fromJson(e as Map<String, dynamic>))
        ?.toSet(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'authorities': instance.authorities?.toList(),
    };
