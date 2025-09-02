class categoryModel {
  String? sId;
  String? name;
  String? nameAr;
  String? image;

  categoryModel({this.sId, this.name, this.nameAr, this.image});

  categoryModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    nameAr = json['name_ar'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['image'] = this.image;
    return data;
  }
}
