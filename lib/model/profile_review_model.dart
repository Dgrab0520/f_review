class ProfileReviewModel {
  String area;
  String name;
  String image;
  String serviceType;
  bool isHeart;
  int reviewId;

  ProfileReviewModel({
    required this.area,
    required this.name,
    required this.image,
    required this.serviceType,
    required this.isHeart,
    required this.reviewId,
  });

  factory ProfileReviewModel.fromJson(Map<String, dynamic> json) {
    return ProfileReviewModel(
      area: json['area'],
      name: json['name'],
      image: json['image'],
      serviceType: json['serviceType'],
      isHeart: json['isHeart'],
      reviewId: json['reviewId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'area': area,
        'name': name,
        "image": image,
        "serviceType": serviceType,
        "isHeart": isHeart,
        "reviewId": reviewId,
      };
}
