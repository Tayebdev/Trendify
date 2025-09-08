class SubCategoryModel {
  String? sId;
  String? name;
  String? nameAr;
  String? category;

  SubCategoryModel({
    this.sId,
    this.name,
    this.category,
  });

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['category'] = category;
    return data;
  }
}
