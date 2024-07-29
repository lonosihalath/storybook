class AddDeliveryRequest {
  String? delVillage;
  String? delDistrict;
  String? delProvince;
  String? delPhone;

  AddDeliveryRequest(
      {this.delVillage, this.delDistrict, this.delProvince, this.delPhone});

  AddDeliveryRequest.fromJson(Map<String, dynamic> json) {
    delVillage = json['village'];
    delDistrict = json['district'];
    delProvince = json['province'];
    delPhone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['village'] = delVillage;
    data['district'] = delDistrict;
    data['province'] = delProvince;
    data['phone'] = delPhone;
    return data;
  }
}
