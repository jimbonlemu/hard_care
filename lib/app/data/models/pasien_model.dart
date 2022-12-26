// To parse this JSON data, do
//
//     final pasienModel = pasienModelFromJson(jsonString);

import 'dart:convert';

PasienModel pasienModelFromJson(String str) => PasienModel.fromJson(json.decode(str));

String pasienModelToJson(PasienModel data) => json.encode(data.toJson());

class PasienModel {
    PasienModel({
        this.uid,
        this.nama,
        this.email,
        this.jk,
        this.alamat,
        this.foto,
        this.password,
        this.chats,
    });

    String? uid;
    String? nama;
    String? email;
    String? jk;
    String? alamat;
    String? foto;
    String? password;
    List<ChatPasien>? chats;

    factory PasienModel.fromJson(Map<String, dynamic> json) => PasienModel(
        uid: json["uid"],
        nama: json["nama"],
        email: json["email"],
        jk: json["jk"],
        alamat: json["alamat"],
        foto: json["foto"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "nama": nama,
        "email": email,
        "jk": jk,
        "alamat": alamat,
        "foto": foto,
        "password": password,
    };
}

class ChatPasien {
    ChatPasien({
        this.connection,
        this.chatId,
        this.lastTime,
        this.total_unread,
    });

    String? connection;
    String? chatId;
    String? lastTime;
    int? total_unread;

    factory ChatPasien.fromJson(Map<String, dynamic> json) => ChatPasien(
        connection: json["connection"],
        chatId: json["chat_id"],
        lastTime:json["lastTime"],
        total_unread: json["total_unread"],
    );

    Map<String, dynamic> toJson() => {
        "connection": connection,
        "chat_id": chatId,
        "lastTime": lastTime,
        "total_unread": total_unread,
    };
}
