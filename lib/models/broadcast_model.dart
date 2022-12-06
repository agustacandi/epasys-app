class BroadcastModel {
  int? id;
  String? judul;
  String? body;
  String? imgUrl;
  String? idKaryawan;
  int? createdAt;
  int? updatedAt;

  BroadcastModel({
    this.id,
    this.judul,
    this.body,
    this.imgUrl,
    this.idKaryawan,
    this.createdAt,
    this.updatedAt,
  });

  BroadcastModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    body = json['body'];
    imgUrl = json['img_url'];
    idKaryawan = json['id_karyawan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'body': body,
      'img_url': imgUrl,
      'id_karyawan': idKaryawan,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
