// import 'package:epasys_app/models/employee_model.dart';

// class BroadcastModel {
//   int? id;
//   String? judul;
//   String? body;
//   String? imgUrl;
//   EmployeeModel? employee;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   BroadcastModel({
//     this.id,
//     this.judul,
//     this.body,
//     this.imgUrl,
//     this.employee,
//     this.createdAt,
//     this.updatedAt,
//   });

//   BroadcastModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     judul = json['judul'];
//     body = json['body'];
//     imgUrl = json['img_url'];
//     employee = EmployeeModel.fromJson(json['employee']);
//     createdAt = DateTime.parse(json['created_at']);
//     updatedAt = DateTime.parse(json['updated_at']);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'judul': judul,
//       'body': body,
//       'img_url': imgUrl,
//       'employee': employee!.toJson(),
//       'created_at': createdAt!.toIso8601String(),
//       'updated_at': updatedAt!.toIso8601String(),
//     };
//   }
// }

// To parse this JSON data, do
//
//     final broadcastModel = broadcastModelFromJson(jsonString);

import 'dart:convert';

BroadcastModel broadcastModelFromJson(String str) =>
    BroadcastModel.fromJson(json.decode(str));

String broadcastModelToJson(BroadcastModel data) => json.encode(data.toJson());

class BroadcastModel {
  BroadcastModel({
    this.id,
    this.judul,
    this.body,
    this.imgUrl,
    this.idKaryawan,
    this.createdAt,
    this.updatedAt,
    this.employee,
  });

  int? id;
  String? judul, body, imgUrl, idKaryawan;
  DateTime? createdAt, updatedAt;
  Employee? employee;

  factory BroadcastModel.fromJson(Map<String, dynamic> json) => BroadcastModel(
        id: json["id"],
        judul: json["judul"],
        body: json["body"],
        imgUrl: json["img_url"],
        idKaryawan: json["id_karyawan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        employee: Employee.fromJson(json["employee"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "body": body,
        "img_url": imgUrl,
        "id_karyawan": idKaryawan,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "employee": employee!.toJson(),
      };
}

class Employee {
  Employee({
    this.id,
    this.nama,
    this.deskripsi,
    this.email,
    this.isActive,
    this.role,
    this.alamat,
    this.noTelepon,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? nama, deskripsi, email, role, alamat, noTelepon, avatar;
  bool? isActive;
  DateTime? createdAt, updatedAt;

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        email: json["email"],
        isActive: json["is_active"] == '1' ? true : false,
        role: json["role"],
        alamat: json["alamat"],
        noTelepon: json["no_telepon"],
        avatar: json["avatar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "email": email,
        "is_active": isActive,
        "role": role,
        "alamat": alamat,
        "no_telepon": noTelepon,
        "avatar": avatar,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
