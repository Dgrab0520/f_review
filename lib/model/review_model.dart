class ReviewModel {
  int id;
  int userId;
  String profileImage;
  String userName; //userId로 join 해서 프로필 사진과 이름 가져오기
  DateTime date;
  String placeName;
  int placeId;
  String review;
  int heartCount;
  List<dynamic> tags; //flu_review_tag 테이블
  List<dynamic> images; //flu_review_image 테이블
  bool isHeart; // flu_review_heart_check 테이블

  ReviewModel({
    required this.id,
    required this.userId,
    required this.profileImage,
    required this.userName,
    required this.date,
    required this.placeName,
    required this.placeId,
    required this.review,
    required this.heartCount,
    required this.tags,
    required this.images,
    required this.isHeart,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: int.parse(json['id']),
      userId: int.parse(json['userId']),
      profileImage: json['profileImage'],
      userName: json['userName'],
      date: DateTime.parse(json['date']),
      placeName: json['placeName'],
      placeId: int.parse(json['placeId']),
      review: json['review'],
      heartCount: int.parse(json['heartCount']),
      tags: json['tags'] ?? [],
      images: json['images'] ?? [],
      isHeart: json['isHeart'] != null ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'profileImage': profileImage,
        "userName": userName,
        "date": date,
        "placeName": placeName,
        "placeId": placeId,
        "review": review,
        "heartCount": heartCount,
        "tags": tags,
        "images": images,
        "isHeart": isHeart,
      };
}
