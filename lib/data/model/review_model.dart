class ReviewModel {
  String? sId;
  String? review;
  double? rating;
  String? product;
  User? user;
  String? responseReview;
  String? dateResponseReview;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ReviewModel({
    this.sId,
    this.review,
    this.rating,
    this.product,
    this.user,
    this.responseReview,
    this.dateResponseReview,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    review = json['review'];
    rating = json['rating'];
    product = json['product'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    responseReview = json['responseReview'];
    dateResponseReview = json['dateResponseReview'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['review'] = review;
    data['rating'] = rating;
    data['product'] = product;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['responseReview'] = responseReview;
    data['dateResponseReview'] = dateResponseReview;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? image;

  User({this.sId, this.firstName, this.lastName, this.image});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['image'] = image;
    return data;
  }
}
