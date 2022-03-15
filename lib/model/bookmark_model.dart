class BookmarkModel {
  String address;
  String name;
  String image;
  int reviewId;

  BookmarkModel({
    required this.address,
    required this.name,
    required this.image,
    required this.reviewId,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      address: json['address'],
      name: json['name'],
      image: json['thumbnail'],
      reviewId: int.parse(json['reviewId']),
    );
  }

  Map<String, dynamic> toJson() => {
        'address': address,
        "name": name,
        'service': image,
        'reviewId': reviewId,
      };
}
