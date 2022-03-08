class PlaceModel {
  String area;
  String service;
  String name;
  int reviewCount;

  PlaceModel({
    required this.area,
    required this.service,
    required this.name,
    required this.reviewCount,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      area: json['area'],
      service: json['service'],
      name: json['name'],
      reviewCount: json['reviewCount'],
    );
  }

  Map<String, dynamic> toJson() => {
        'area': area,
        'service': service,
        "name": name,
        "reviewCount": reviewCount,
      };
}
