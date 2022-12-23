class EmployeeModel {
  EmployeeModel({
    this.id,
    this.nama,
    this.deskripsi,
    this.email,
    this.role,
    this.alamat,
    this.noTelepon,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  int? id;
  String? nama, deskripsi, email, role, alamat, noTelepon, avatar, token;
  DateTime? createdAt, updatedAt;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        email: json["email"],
        role: json["role"],
        alamat: json["alamat"],
        noTelepon: json["no_telepon"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "email": email,
        "role": role,
        "alamat": alamat,
        "no_telepon": noTelepon,
        "avatar": avatar,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "token": token,
      };
}
