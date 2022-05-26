import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'user.g.dart';

enum Sex { masculino, femenino, otro }

@JsonSerializable()
class User extends Equatable {
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
  final Sex? sex;
  final DateTime? birth;
  final User? supervising;

  const User(
      {this.id,
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
      this.supervising});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? diseases,
    List<String>? supervisors,
    List<String>? supervisedBy,
    String? firstName,
    String? lastName,
    double? height,
    double? weight,
    Sex? sex,
    User? supervising,
    DateTime? birth,
  }) {
    return User(
        id: id ?? this.id,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        diseases: diseases ?? this.diseases,
        supervisors: supervisors ?? this.supervisors,
        supervisedBy: supervisedBy ?? this.supervisedBy,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        sex: sex ?? this.sex,
        birth: birth ?? this.birth,
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
        supervisedBy,
        firstName,
        lastName,
        height,
        weight,
        sex,
        supervising,
        birth
      ];
}
