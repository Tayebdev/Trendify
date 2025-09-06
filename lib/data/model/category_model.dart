class CategoryModel {
  String? sId;
  String? name;
  String? nameAr;
  String? image;

  CategoryModel({
    this.sId,
    this.name,
    this.nameAr,
    this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['image'] = image;
    return data;
  }
}
