class EmployeeModel {
  int? id;
  String? nama;
  String? email;
  String? role;
  String? alamat;
  String? noTelepon;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;

  EmployeeModel({
    this.id,
    this.nama,
    this.email,
    this.avatar,
    this.role,
    this.noTelepon,
    this.alamat,
    this.createdAt,
    this.updatedAt,
    this.token,
  });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    email = json['email'];
    avatar = json['avatar'];
    role = json['role'];
    noTelepon = json['no_telepon'];
    alamat = json['alamat'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'avatar': avatar,
      'role': role,
      'no_telepon': noTelepon,
      'alamat': alamat,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'token': token,
    };
  }
}
