import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';
part 'user.freezed.dart';

enum Sex { masculino, femenino, otro }

@freezed
class User with _$User {
  const User._();

  const factory User({
    @JsonKey(name: '_id') final String? id,
    final String? email,
    @JsonKey(defaultValue: 'assets/avatar/default.svg') final String? avatar,
    @JsonKey(name: 'created_at') final DateTime? createdAt,
    @JsonKey(name: 'updated_at') final DateTime? updatedAt,
    final List<String>? diseases,
    final List<User>? supervisors,
    final List<User>? supervised,
    @JsonKey(name: 'first_name') final String? firstName,
    @JsonKey(name: 'last_name') final String? lastName,
    final double? height,
    final double? weight,
    final Sex? sex,
    final DateTime? birth,
    final String? invitation,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const empty = User();

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;
}
