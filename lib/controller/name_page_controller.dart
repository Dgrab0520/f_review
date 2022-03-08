import 'package:f_review/model/place_model.dart';
import 'package:f_review/model/review_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NamePageController extends GetxController {
  final _placeModel = PlaceModel(
          area: "하남시 검단산로 228-8",
          service: "카페",
          name: "마시랑게",
          reviewCount: 3000)
      .obs;
  PlaceModel get placeModel => _placeModel.value;
  //장소

  final _anotherReviews = <ReviewModel>[
    ReviewModel(
      id: 0,
      profileImage: 'assets/avatar_2.png',
      userName: '유그린',
      date: '12.12 토',
      placeName: '마시랑게',
      review:
          '분위기가 너무 좋아요. 여러 카페 다녀봤는데 이렇게 깔끔하고 예쁘게 플레이팅 되서 나오는 카페는 처음 봤어요. 사진도 잘 안찍는데 감동 받아서 찍어봅니다.. 다들 마시랑게 하세요 bb',
      heartCount: 0,
      tags: ["하남카페", "다들", "마시랑게", "하세요"],
      images: ['assets/name_img2.png'],
      isHeart: false,
      isSaved: false,
    ),
  ].obs;
  List<ReviewModel> get anotherReviews => _anotherReviews;
  set anotherReviews(val) => _anotherReviews.value = val;

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
  //정렬

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;

  void launchURL(String _url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}
