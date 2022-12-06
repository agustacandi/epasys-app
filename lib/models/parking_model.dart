class BroadcastModel {
  int? id;
  String? status;
  int? helm;
  bool? isExpired;
  int? idKendaraan;
  int? idKaryawan;
  int? idUser;
  int? createdAt;
  int? updatedAt;

  BroadcastModel({
    this.id,
    this.status,
    this.helm,
    this.isExpired,
    this.idKaryawan,
    this.idKendaraan,
    this.idUser,
    this.createdAt,
    this.updatedAt,
  });

  BroadcastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    helm = json['helm'];
    isExpired = json['is_expired'];
    idKendaraan = json['id_kendaraan'];
    idKaryawan = json['id_karyawan'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'helm': helm,
      'is_expired': isExpired,
      'id_kendaraan': idKendaraan,
      'id_karyawan': idKaryawan,
      'id_user': idUser,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
