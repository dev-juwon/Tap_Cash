class UserModel {
  String? message;
  bool? status;
  String? token;
  UserData? user;

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    status = json['status'];
    user = UserData.fromJson(json['user']);
  }
}

class UserData {
  int? phoneNumber;
  String? firstName;
  String? lastName;
  String? password;
  String? nationalID;
  DateTime? expirationDate;
  String? dateOfBirth;
  String? validationCode;

  UserData(
    this.phoneNumber,
    this.firstName,
    this.lastName,
    this.password,
    this.nationalID,
    this.expirationDate,
    this.dateOfBirth,
    this.validationCode,
  );

  UserData.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password = json['password'];
    nationalID = json['national_ID'];
    expirationDate = json['expiration_date'];
    dateOfBirth = json['date_of_birth'];
    validationCode = json['validation_code'];
  }
}
