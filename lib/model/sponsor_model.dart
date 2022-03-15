class SponsorModel {
  String title;
  String thumbnail;
  String contentImage;
  String content;

  SponsorModel({
    required this.title,
    required this.thumbnail,
    required this.contentImage,
    required this.content,
  });

  factory SponsorModel.fromJson(Map<String, dynamic> json) {
    return SponsorModel(
      title: json['title'],
      thumbnail: json['thumbnail'],
      contentImage: json['contentImage'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        "thumbnail": thumbnail,
        "contentImage": contentImage,
        "content": content,
      };
}
