class RegisterRequestModel {
  String? firstName;
  String? lastName;
  String? dob;
  String? userName;
  String? email;
  String? password;

  RegisterRequestModel(
      {this.firstName,
      this.lastName,
      this.dob,
      this.userName,
      this.email,
      this.password});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dob'] = dob;
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
