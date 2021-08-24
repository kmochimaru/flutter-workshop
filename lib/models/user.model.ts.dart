class UserModel {
  int? userId;
  String? username;
  String? password;
  String? userAvatar;
  String? userPhoneNumber;
  String? userEmail;

  UserModel(
      {this.userId,
      this.username,
      this.password,
      this.userAvatar,
      this.userPhoneNumber,
      this.userEmail});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
        userId: json["user_id"],
        username: json["username"],
        password: json["password"],
        userAvatar: json["user_avatar"],
        userPhoneNumber: json["user_phone_number"],
        userEmail: json["user_email"],
      );
    } catch (ex) {
      print('Exception ====> UserModel.fromJson $ex');
      return UserModel();
    }
  }
}
