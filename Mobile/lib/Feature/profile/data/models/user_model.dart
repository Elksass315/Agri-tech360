class UserModel {
  final String fullName;
  final String email;
  final String phone;
  final String profilePic;
  final String message;
  final bool status;

  UserModel(
      {required this.message,
      required this.status,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.profilePic});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['fullName'],
      email: json['email'],
      phone: json['phoneNumber'],
      profilePic: json['profilePic'],
      message: json['message'],
      status: json['status'],
    );
  }
}
