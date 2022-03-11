import 'package:f_review/model/review_model.dart';
import 'package:f_review/model/sponsor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubPageController extends GetxController {
  final _bestReview = [
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_1.png',
      userName: '유라희',
      date: "6.12.일",
      placeName: "마시랑게",
      review:
          "매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...",
      heartCount: 0,
      tags: ["하남카페", "포토존", "비쥬얼맛집"],
      images: ["assets/sub_img.png"],
      isHeart: false,
      isSaved: false,
    ),
  ].obs;
  set bestReview(value) => _bestReview.value = value;
  List<ReviewModel> get bestReview => _bestReview;
  //베스트 리뷰

  final _selectedValue = "최신순".obs;
  set selectedValue(value) => _selectedValue.value = value;
  get selectedValue => _selectedValue.value;

  final _items = [
    '최신순',
    '조회수',
    '추천순',
  ].obs;
  set items(value) => _items.value = value;
  List<String> get items => _items;

  setItem(String value) {
    selectedValue = value;
  }
  //정렬

  final _reviews = <ReviewModel>[
    ReviewModel(
      id: 1,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '6.12.일',
      placeName: '카페웨더',
      heartCount: 0,
      review:
          '빈티지한 느낌의 카페에요. 분위기 너무 좋고, 조용해요. 분위기 뿐만 아니라 매장에 디저트류도 많고, 음료도 다양해서 앞으로 제 최애 카페로 ...',
      tags: [
        "하남카페",
        "디저트",
        "빈티지",
      ],
      images: [
        "assets/img3.png",
        "assets/g_img2.png",
        "assets/g_img3.png",
      ],
      isHeart: false,
      isSaved: false,
    )
  ].obs;
  set reviews(value) => _reviews.value = value;
  List<ReviewModel> get reviews => _reviews;
  //리뷰

  final _sponsorList = <SponsorModel>[
    SponsorModel(
        id: 1,
        title: '[하남 미사점] 1만원 무료쿠폰 10명',
        thumbnail: 'assets/sponsor_1.png',
        contentImage: 'contentImage'),
    SponsorModel(
        id: 2,
        title: '[하남 미사점] 에이드 무료쿠폰 20명',
        thumbnail: 'assets/sponsor_2.png',
        contentImage: 'contentImage'),
  ].obs;
  set sponsorList(value) => _sponsorList.value = value;
  List<SponsorModel> get sponsorList => _sponsorList;
  //스폰서

  var controller = TextEditingController();

  bestReviewCheck(int index) {
    bestReview[index].isHeart = !bestReview[index].isHeart;
    if (bestReview[index].isHeart) {
      bestReview[index].heartCount++;
    } else {
      bestReview[index].heartCount--;
    }
    _bestReview.refresh();
  }
}
