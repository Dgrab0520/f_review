class SearchResultModel {
  String type;
  //tag = flu_review_tag / place = flu_review_place / user = flu_user
  String name;
  String subTitle;
  //tag & place = 총 게시물 수 / user = 자기소개
  int? userId; //type == user 일때만

  SearchResultModel({
    required this.type,
    required this.name,
    required this.subTitle,
    this.userId,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      type: json['type'],
      name: json['name'],
      subTitle: json['subTitle'],
      userId: json['userId'] == null ? null : int.parse(json['userId']),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        "subTitle": subTitle,
        "userId": userId,
      };
}
