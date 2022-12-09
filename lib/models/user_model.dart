class UserModel {
  int? id;
  String? nama;
  String? nim;
  String? email;
  String? alamat;
  String? noTelepon;
  String? tanggalLahir;
  String? avatar;
  String? token;

  UserModel({
    this.id,
    this.nama,
    this.nim,
    this.email,
    this.alamat,
    this.noTelepon,
    this.tanggalLahir,
    this.avatar,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nim = json['nim'];
    email = json['email'];
    alamat = json['alamat'];
    noTelepon = json['no_telepon'];
    tanggalLahir = json['tanggal_lahir'];
    avatar = json['avatar'] ?? '';
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'nim': nim,
      'alamat': alamat,
      'no_telepon': noTelepon,
      'tanggal_lahir': tanggalLahir,
      'avatar': avatar,
      'token': token,
    };
  }
}
