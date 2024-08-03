class UserInfoModel {
  final int userId;
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final bool isAdmin;
  final String token;
  final String createdBy;
  final DateTime creationDate;
  final int clientId;
  final String clientEmail;

  UserInfoModel({
    required this.userId,
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.isAdmin,
    required this.token,
    required this.createdBy,
    required this.creationDate,
    required this.clientId,
    required this.clientEmail,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      userId: json['userId'],
      userName: json['userName'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      isAdmin: json['isAdmin'],
      token: json['token'],
      createdBy: json['createdBy'],
      creationDate: DateTime.parse(json['creationDate']),
      clientId: json['clientId'],
      clientEmail: json['clientEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'isAdmin': isAdmin,
      'token': token,
      'createdBy': createdBy,
      'creationDate': creationDate.toIso8601String(),
      'clientId': clientId,
      'clientEmail': clientEmail,
    };
  }
}
