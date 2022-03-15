class ProfileModel {
  String userId;
  String profileImg; //flu_user : user_id, profile_img
  String profile; //flu_review_profile 테이블
  int heartCount; // flu_review : SUM(heartCount)
  int imageCount; // flu_review_image : COUNT(id)

  ProfileModel({
    required this.userId,
    required this.profileImg,
    required this.profile,
    required this.heartCount,
    required this.imageCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['user_id'],
      profileImg: json['profile_img'],
      profile: json['profile'],
      heartCount: int.parse(json['heartCount']),
      imageCount: int.parse(json['imageCount']),
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'profileImg': profileImg,
        "profile": profile,
        "heartCount": heartCount,
        "imageCount": imageCount,
      };
}
