class ReviewModel {
  int id;
  String profileImage;
  String userName; //userId로 join 해서 프로필 사진과 이름 가져오기
  String date;
  String placeName;
  String review;
  int heartCount;
  List<dynamic> tags; //flu_review_tag 테이블
  List<dynamic> images; //flu_review_image 테이블
  bool isHeart; // flu_review_heart_check 테이블

  ReviewModel({
    required this.id,
    required this.profileImage,
    required this.userName,
    required this.date,
    required this.placeName,
    required this.review,
    required this.heartCount,
    required this.tags,
    required this.images,
    required this.isHeart,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: int.parse(json['id']),
      profileImage: json['profileImage'],
      userName: json['userName'],
      date: json['date'],
      placeName: json['placeName'],
      review: json['review'],
      heartCount: int.parse(json['heartCount']),
      tags: json['tags'] ?? [],
      images: json['images'] ?? [],
      isHeart: json['isHeart'] != null ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'profileImage': profileImage,
        "userName": userName,
        "date": date,
        "placeName": placeName,
        "review": review,
        "heartCount": heartCount,
        "tags": tags,
        "images": images,
        "isHeart": isHeart,
      };
}
