class UserInfoModel {
  int? userId;
  String? firstName;
  String? lastName;
  String? dob;
  String? email;
  String? userName;
  String? password;
  String? createdAt;
  String? updatedAt;

  UserInfoModel(
      {this.userId,
      this.firstName,
      this.lastName,
      this.dob,
      this.email,
      this.userName,
      this.password,
      this.createdAt,
      this.updatedAt});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    email = json['email'];
    userName = json['userName'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['dob'] = dob;
    data['email'] = email;
    data['userName'] = userName;
    data['password'] = password;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
