class PlaceModel {
  String address;
  String service;
  String name;
  int reviewCount; // flu_review 테이블에서 placeId로 count
  bool isSave; // flu_review_place_check 테이블

  PlaceModel({
    required this.address,
    required this.service,
    required this.name,
    required this.reviewCount,
    required this.isSave,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      address: json['address'],
      service: json['service'],
      name: json['name'],
      reviewCount: int.parse(json['reviewCount']),
      isSave: json['isSave'] == '1' ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        'service': service,
        "name": name,
        "reviewCount": reviewCount,
        "isSave": isSave,
      };
}
