import 'dart:convert';
class BlogModel {
  BlogModel({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
    this.email,
    this.password,
  });

  String id;
  DateTime createdAt;
  String title;
  String imageUrl;
  String email;
  String password;

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        imageUrl: json["imageUrl"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

      
List<BlogModel> blogModelFromJson(String str) =>
    List<BlogModel>.from(json.decode(str).map((x) => BlogModel.fromJson(x)));
}
