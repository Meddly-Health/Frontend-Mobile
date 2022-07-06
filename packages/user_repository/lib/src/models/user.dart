import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';
part 'user.freezed.dart';

enum Sex { masculino, femenino, otro }

@freezed
class User with _$User {
  const User._();

  @HiveType(typeId: 1, adapterName: 'UserAdapater')
  @JsonSerializable(
      explicitToJson:
          true) // TODO: Fijarse si esto sirve para la lista de tratamientos.
  const factory User({
    @JsonKey(name: '_id') @HiveField(1) final String? id,
    @HiveField(2) final String? email,
    @HiveField(3, defaultValue: 'assets/ava`tar/avatar0-1-1.svg')
    @JsonKey(defaultValue: 'assets/avatar/avatar0-1-1.svg')
        final String? avatar,
    @JsonKey(name: 'created_at') @HiveField(4) final DateTime? createdAt,
    @JsonKey(name: 'updated_at') @HiveField(5) final DateTime? updatedAt,
    @HiveField(6) final List<String>? diseases,
    @HiveField(7) final List<User>? supervisors,
    @HiveField(8) final List<User>? supervised,
    @JsonKey(name: 'first_name') @HiveField(9) final String? firstName,
    @JsonKey(name: 'last_name') @HiveField(10) final String? lastName,
    @HiveField(11) final double? height,
    @HiveField(12) final double? weight,
    @HiveField(13) final Sex? sex,
    @HiveField(14) final DateTime? birth,
    @HiveField(15) final String? invitation,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const empty = User();

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;
}
