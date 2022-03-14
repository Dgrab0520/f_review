class SponsorModel {
  int id;
  String title;
  String thumbnail;
  String contentImage;

  SponsorModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.contentImage,
  });

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
      id: int.parse(json['id']),
      title: json['title'],
      thumbnail: json['thumbnail'],
      contentImage: json['contentImage'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        "thumbnail": thumbnail,
        "contentImage": contentImage,
      };
}
