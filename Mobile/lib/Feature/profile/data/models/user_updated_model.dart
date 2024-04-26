class UserUpdatedModel {
  final String city;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String message;
  final bool status;

  UserUpdatedModel({
    required this.city,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.message,
    required this.status,
  });

  factory UserUpdatedModel.fromJson(Map<String, dynamic> json) {
    return UserUpdatedModel(
      city: json['data']['city'] as String,
      email: json['data']['email'] as String,
      fullName: json['data']['fullName'] as String,
      phoneNumber: json['data']['phoneNumber'] as String,
      message: json['message'] as String,
      status: json['status'] as bool,
    );
  }
}
