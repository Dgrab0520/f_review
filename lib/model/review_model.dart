class ReviewModel {
  int id;
  String profileImage;
  String userName;
  String date;
  String placeName;
  String review;
  int heartCount;
  List<String> tags;
  List<String> images;
  bool isHeart;
  bool isSaved;

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
    required this.isSaved,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      profileImage: json['profileImage'],
      userName: json['userName'],
      date: json['date'],
      placeName: json['placeName'],
      review: json['review'],
      heartCount: json['heartCount'],
      tags: json['tags'],
      images: json['images'],
      isHeart: json['isHeart'],
      isSaved: json['isSaved'],
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
        "isSaved": isSaved,
      };
}
