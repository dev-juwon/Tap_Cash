class UserModel {
  String? message;
  UserData? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = UserData.fromJson(json['data']);
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
  String? token;

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
    token = json['token'];
  }
}
