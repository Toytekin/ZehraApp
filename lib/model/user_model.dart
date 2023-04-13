class UserModel {
  UserModel({required this.id, required this.mail});

  String id;
  String mail;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'mail': mail,
    };
  }
}
