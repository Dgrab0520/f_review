class ProfileReviewModel {
  String area;
  String name;
  String image;
  bool isHeart;
  int reviewId;

  ProfileReviewModel({
    required this.area,
    required this.name,
    required this.image,
    required this.isHeart,
    required this.reviewId,
  });

  factory ProfileReviewModel.fromJson(Map<String, dynamic> json) {
    return ProfileReviewModel(
      area: json['area'],
      name: json['name'],
      image: json['image'],
      isHeart: json['isHeart'],
      reviewId: json['reviewId'],
    );
  }

  Map<String, dynamic> toJson() => {
        'area': area,
        'name': name,
        "image": image,
        "isHeart": isHeart,
        "reviewId": reviewId,
      };
}
