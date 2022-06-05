import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'user.g.dart';

enum Sex { masculino, femenino, otro }

@JsonSerializable()
class User extends Equatable {
  @JsonKey(name: 'user_id')
  final String? id;
  final String? email;
  @JsonKey(defaultValue: 'assets/avatar/default.svg')
  final String? avatar;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<String>? diseases;
  final List<User>? supervisors;
  final List<User>? supervised;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final double? height;
  final double? weight;
  final Sex? sex;
  final DateTime? birth;
  final User? supervising;
  final String? invitation;

  const User(
      {this.id,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.diseases,
      this.supervisors,
      this.supervised,
      this.firstName,
      this.lastName,
      this.height,
      this.weight,
      this.sex,
      this.invitation,
      this.birth,
      this.avatar,
      this.supervising});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? diseases,
    List<User>? supervisors,
    List<User>? supervised,
    String? firstName,
    String? lastName,
    double? height,
    double? weight,
    Sex? sex,
    String? invitation,
    User? supervising,
    DateTime? birth,
    String? avatar,
  }) {
    return User(
        id: id ?? this.id,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        diseases: diseases ?? this.diseases,
        supervisors: supervisors ?? this.supervisors,
        supervised: supervised ?? this.supervised,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        sex: sex ?? this.sex,
        birth: birth ?? this.birth,
        avatar: avatar ?? this.avatar,
        invitation: invitation ?? this.invitation,
        supervising: supervising ?? this.supervising);
  }

  @override
  List<Object?> get props => [
        id,
        email,
        createdAt,
        updatedAt,
        diseases,
        supervisors,
        supervised,
        firstName,
        lastName,
        height,
        weight,
        sex,
        supervising,
        birth
      ];
}
