import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'user_id')
  final String? id;
  final String? email;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<String>? diseases;
  final List<String>? supervisors;
  final List<String>? supervisedBy;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final double? height;
  final double? weight;
  final bool? sex;
  final DateTime? birth;

  const User({
    this.id,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.diseases,
    this.supervisors,
    this.supervisedBy,
    this.firstName,
    this.lastName,
    this.height,
    this.weight,
    this.sex,
    this.birth,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class BirthConverter implements JsonConverter<DateTime, String> {
  @override
  fromJson(json) {
    return DateTime.parse(json);
  }

  @override
  toJson(object) {
    return '${object.year}-${object.month}-${object.day}';
  }
}
