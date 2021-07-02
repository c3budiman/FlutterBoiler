class UserModel {
  UserModel({
    this.username,
    this.role,
    this.bio,
    this.images,
  });

  final String? username;
  final int? role;
  final String? bio;
  final String? images;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        username: json["username"] == null ? null : json["username"],
        role: json["role"] == null ? null : json["role"],
        bio: json["bio"] == null ? null : json["bio"],
        images: json["images"] == null ? null : json["images"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "role": role == null ? null : role,
        "bio": bio == null ? null : bio,
        "images": images == null ? null : images,
      };
}
