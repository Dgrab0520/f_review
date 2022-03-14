class ProfileReviewModel {
  String area;
  String name;
  String serviceType; //area, name, serviceType = flu_review_place
  String image; //flu_review_image
  bool isHeart; //flu_review_heart_check
  int reviewId;
  DateTime date;
  int heartCount;

  ProfileReviewModel({
    required this.area,
    required this.name,
    required this.serviceType,
    required this.image,
    required this.isHeart,
    required this.reviewId,
    required this.date,
    required this.heartCount,
  });

  factory ProfileReviewModel.fromJson(Map<String, dynamic> json) {
    return ProfileReviewModel(
      area: json['area'],
      name: json['name'],
      serviceType: json['serviceType'],
      image: json['image'],
      isHeart: json['isHeart'] == '1' ? true : false,
      reviewId: int.parse(json['reviewId']),
      date: DateTime.parse(json['date']),
      heartCount: int.parse(json['heartCount']),
    );
  }

  Map<String, dynamic> toJson() => {
        'area': area,
        'name': name,
        "serviceType": serviceType,
        "image": image,
        "isHeart": isHeart,
        "reviewId": reviewId,
        "date": date,
        "heartCount": heartCount,
      };
}
