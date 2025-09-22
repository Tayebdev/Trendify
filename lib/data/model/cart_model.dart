class CartModel {
  String? sId;
  List<CartItem>? cartItems;
  int? totalCartPrice;
  int? totalPriceAfterDiscount;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CartModel({
    this.sId,
    this.cartItems,
    this.totalCartPrice,
    this.totalPriceAfterDiscount,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['cartItems'] != null) {
      cartItems = <CartItem>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(CartItem.fromJson(v));
      });
    }
    totalCartPrice = json['totalCartPrice'];
    totalPriceAfterDiscount = json['totalPriceAfterDiscount'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    if (cartItems != null) {
      data['cartItems'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['totalCartPrice'] = totalCartPrice;
    data['totalPriceAfterDiscount'] = totalPriceAfterDiscount;
    data['user'] = user;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class CartItem {
  Product? product;
  int? quantity;
  String? color;
  String? nameBrand;
  String? size;
  int? price;
  int? priceAfterDiscount;
  String? sId;

  CartItem({
    this.product,
    this.quantity,
    this.color,
    this.nameBrand,
    this.size,
    this.price,
    this.priceAfterDiscount,
    this.sId,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? Product.fromJson(json['product'])
        : null;
    quantity = json['quantity'];
    color = json['color'];
    nameBrand = json['nameBrand'];
    size = json['size'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    data['color'] = color;
    data['nameBrand'] = nameBrand;
    data['size'] = size;
    data['price'] = price;
    data['priceAfterDiscount'] = priceAfterDiscount;
    data['_id'] = sId;
    return data;
  }
}

class Product {
  String? sId;
  String? title;
  List<Images>? images;

  Product({this.sId, this.title, this.images});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? color;
  String? image;
  String? sId;

  Images({this.color, this.image, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    image = json['image'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['color'] = color;
    data['image'] = image;
    data['_id'] = sId;
    return data;
  }
}
