import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_token_dto.g.dart';

@JsonSerializable()
class UserTokenDto {
  @JsonKey(name: "id_token")
  String idToken;

  UserTokenDto({
    @required this.idToken,
  });

  factory UserTokenDto.fromJson(Map<String, dynamic> json) => _$UserTokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenDtoToJson(this);
}
