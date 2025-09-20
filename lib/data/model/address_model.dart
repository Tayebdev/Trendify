class AddressModel {
  String? sId;
  String? userId;
  String? name;
  String? phone;
  String? street;
  String? postalCode;
  String? city;
  String? state;
  String? country;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AddressModel({
    this.sId,
    this.userId,
    this.name,
    this.phone,
    this.street,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    name = json['name'];
    phone = json['phone'];
    street = json['street'];
    postalCode = json['postalCode'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    data['name'] = name;
    data['phone'] = phone;
    data['street'] = street;
    data['postalCode'] = postalCode;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
