import 'package:json_annotation/json_annotation.dart';

part 'authority.g.dart';

@JsonSerializable()
class Authority {
  String authority;

  Authority({this.authority});

  factory Authority.fromJson(Map<String, dynamic> authenticationRequest) =>
      _$AuthorityFromJson(authenticationRequest);

  Map<String, dynamic> toJson() => _$AuthorityToJson(this);
}
