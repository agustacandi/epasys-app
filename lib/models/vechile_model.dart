import 'package:epasys_app/models/user_model.dart';

class VechileModel {
  int? id;
  String? merek;
  String? noPolisi;
  String? fotoKendaraan;
  String? fotoStnk;
  UserModel? user;
  int? createdAt;
  int? updatedAt;

  VechileModel({
    this.id,
    this.merek,
    this.noPolisi,
    this.fotoKendaraan,
    this.fotoStnk,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  VechileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merek = json['merek'];
    noPolisi = json['no_polisi'];
    fotoKendaraan = json['foto_kendaraan'];
    fotoStnk = json['foto_stnk'];
    user = UserModel.fromJson(json['user']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'merek': merek,
      'no_polisi': noPolisi,
      'foto_kendaraan': fotoKendaraan,
      'foto_stnk': fotoStnk,
      'user': user,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
