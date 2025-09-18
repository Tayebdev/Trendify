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
  Brand? brand;
  int? ratingAverage;
  int? quantityResidents;
  bool? isFavorite;
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
    this.isFavorite,
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

    // Images
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }

    // Sizes
    if (json['sizes'] != null) {
      sizes = List<String>.from(json['sizes']);
    }

    // Category
    if (json['category'] != null) {
      if (json['category'] is String) {
        category = Category(name: json['category']);
      } else if (json['category'] is Map) {
        category = Category.fromJson(json['category']);
      }
    }
    if (json['subCategory'] != null) {
      if (json['subCategory'] is String) {
        subCategory = Category(name: json['subCategory']);
      } else if (json['subCategory'] is Map) {
        subCategory = Category.fromJson(json['subCategory']);
      }
    }
    if (json['brand'] != null) {
      if (json['brand'] is String) {
        brand = Brand(name: json['brand']);
      } else if (json['brand'] is Map) {
        brand = Brand.fromJson(json['brand']);
      }
    }

    ratingAverage = json['ratingAverage'];
    quantityResidents = json['quantityResidents'];
    isFavorite = json['isFavorite'];
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
    if (sizes != null) {
      data['sizes'] = sizes;
    }
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
    data['isFavorite'] = isFavorite;
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

class Brand {
  String? name;
  String? image;

  Brand({this.name, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
