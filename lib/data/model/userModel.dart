class userModel {
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

  userModel(
      {this.firstName,
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
      this.iV});

  userModel.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['password'] = this.password;
    data['role'] = this.role;
    data['emailVerified'] = this.emailVerified;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}