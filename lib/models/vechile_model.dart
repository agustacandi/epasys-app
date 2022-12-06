class VechileModel {
  int? id;
  String? merek;
  String? noPolisi;
  String? fotoKendaraan;
  String? fotoStnk;
  String? idUser;
  int? createdAt;
  int? updatedAt;

  VechileModel({
    this.id,
    this.merek,
    this.noPolisi,
    this.fotoKendaraan,
    this.fotoStnk,
    this.idUser,
    this.createdAt,
    this.updatedAt,
  });

  VechileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merek = json['merek'];
    noPolisi = json['no_polisi'];
    fotoKendaraan = json['foto_kendaraan'];
    fotoStnk = json['foto_stnk'];
    idUser = json['id_user'];
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
      'id_user': idUser,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
