class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  String? password;
  String? role;
  bool? emailVerified;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
    this.password,
    this.role,
    this.emailVerified,
    this.sId,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    password = json['password'];
    role = json['role'];
    emailVerified = json['emailVerified'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['password'] = password;
    data['role'] = role;
    data['emailVerified'] = emailVerified;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
