import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
class User {
  User({
    this.tel,
    this.code,
    this.status,
    this.email,
    this.pin,
    this.name,
    this.sex,
    this.avatarSex,
    this.handness,
    this.type,
    this.higth,
    this.weight,
    this.fatMass,
    this.muscle,
    this.visceralMass,
    this.bmi,
    this.taget,
    this.wallet,
    this.str,
    this.vit,
    this.int,
    this.agi,
    this.dex,
    this.level,
    this.createBy,
    this.updateBy,
    this.id,
    this.otpStatus,
    this.sended = false,
  });

  String? tel;
  String? code;
  bool? status;
  String? email;
  String? password;
  String? pin;
  String? name;
  String? sex;
  String? avatarSex;
  String? handness;
  String? type;
  double? higth;
  double? weight;
  double? fatMass;
  double? muscle;
  double? visceralMass;
  double? bmi;
  String? taget;
  double? wallet;
  double? str;
  double? vit;
  double? int;
  double? agi;
  double? dex;
  double? level;
  String? createBy;
  String? updateBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  bool sended;
  num? id;
  bool? otpStatus;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
