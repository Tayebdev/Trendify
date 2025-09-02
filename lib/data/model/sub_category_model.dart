class subCategoryModel {
  String? sId;
  String? name;
  String? category;

  subCategoryModel({this.sId, this.name, this.category});

  subCategoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    return data;
  }
}
