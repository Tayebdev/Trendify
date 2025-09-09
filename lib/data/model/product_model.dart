class ProductModel {
  String? sId;
  String? title;
  String? description;
  int? quantity;
  int? sold;
  int? price;
  int? priceAfterDiscount;
  List<Images>? images;
  List<String>? sizes;
  Category? category;
  Category? subCategory;
  Category? brand;
  int? ratingAverage;
  int? quantityResidents;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModel({
    this.sId,
    this.title,
    this.description,
    this.quantity,
    this.sold,
    this.price,
    this.priceAfterDiscount,
    this.images,
    this.sizes,
    this.category,
    this.subCategory,
    this.brand,
    this.ratingAverage,
    this.quantityResidents,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    quantity = json['quantity'];
    sold = json['sold'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    sizes = json['sizes'].cast<String>();
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    subCategory = json['subCategory'] != null
        ? Category.fromJson(json['subCategory'])
        : null;
    brand = json['brand'] != null ? Category.fromJson(json['brand']) : null;
    ratingAverage = json['ratingAverage'];
    quantityResidents = json['quantityResidents'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['quantity'] = quantity;
    data['sold'] = sold;
    data['price'] = price;
    data['priceAfterDiscount'] = priceAfterDiscount;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['sizes'] = sizes;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategory != null) {
      data['subCategory'] = subCategory!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['ratingAverage'] = ratingAverage;
    data['quantityResidents'] = quantityResidents;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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

class Category {
  String? name;

  Category({this.name});

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
