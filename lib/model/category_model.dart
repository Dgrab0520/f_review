class CategoryModel {
  String area;
  String service;
  String image;

  CategoryModel({
    required this.area,
    required this.service,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      area: json['area'],
      service: json['service'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'area': area,
        'service': service,
        "image": image,
      };
}
