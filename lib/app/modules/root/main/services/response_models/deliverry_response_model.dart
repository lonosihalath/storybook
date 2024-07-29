class GetDeliveryResponse {
  int? userId;
  String? firstName;
  String? lastName;
  String? dob;
  String? email;
  String? userName;
  String? password;
  String? createdAt;
  String? updatedAt;
  List<DeliveryDetail>? deliveryDetail;

  GetDeliveryResponse(
      {this.userId,
      this.firstName,
      this.lastName,
      this.dob,
      this.email,
      this.userName,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.deliveryDetail});

  GetDeliveryResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    email = json['email'];
    userName = json['userName'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['delivery_detail'] != null) {
      deliveryDetail = <DeliveryDetail>[];
      json['delivery_detail'].forEach((v) {
        deliveryDetail!.add(DeliveryDetail.fromJson(v));
      });
    }
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
    if (deliveryDetail != null) {
      data['delivery_detail'] = deliveryDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryDetail {
  int? deliveryId;
  String? delVillage;
  String? delDistrict;
  String? delProvince;
  String? delPhone;
  int? userId;
  String? createdAt;
  String? updatedAt;

  DeliveryDetail(
      {this.deliveryId,
      this.delVillage,
      this.delDistrict,
      this.delProvince,
      this.delPhone,
      this.userId,
      this.createdAt,
      this.updatedAt});

  DeliveryDetail.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    delVillage = json['del_village'];
    delDistrict = json['del_district'];
    delProvince = json['del_province'];
    delPhone = json['del_phone'];
    userId = json['user_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['delivery_id'] = deliveryId;
    data['del_village'] = delVillage;
    data['del_district'] = delDistrict;
    data['del_province'] = delProvince;
    data['del_phone'] = delPhone;
    data['user_id'] = userId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
