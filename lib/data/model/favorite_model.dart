import 'product_model.dart';

class FavoriteModel {
  String? sId;
  String? userId;
  ProductModel? product;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FavoriteModel({
    this.sId,
    this.userId,
    this.product,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    product = json['productId'] != null
        ? ProductModel.fromJson(json['productId'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    if (product != null) {
      data['productId'] = product!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
