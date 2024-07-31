class PaymentRequest {
  String? deliveryId;
  String? totalPrice;
  String? items;

  PaymentRequest({this.deliveryId, this.totalPrice, this.items});

  PaymentRequest.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    totalPrice = json['total_price'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['delivery_id'] = deliveryId;
    data['total_price'] = totalPrice;
    data['items'] = items;
    return data;
  }
}
