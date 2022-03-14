import 'package:f_review/model/place_model.dart';
import 'package:f_review/model/review_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NamePageController extends GetxController {
  final _placeModel = PlaceModel(
    address: "하남시 검단산로 228-8",
    service: "카페",
    name: "마시랑게",
    reviewCount: 3000,
    isSave: false,
  ).obs;
  PlaceModel get placeModel => _placeModel.value;
  set placeModel(val) => _placeModel.value = val;

  getPlace(String name) async {
    //TODO:장소 정보 불러오기
  }

  placeCheck() {
    placeModel.isSave = !placeModel.isSave;
    _placeModel.refresh();
    if (placeModel.isSave) {
      //TODO:장소 저장
      if (!Get.isSnackbarOpen) {
        Get.snackbar("성공", "장소를 저장했습니다");
      }
    }
  }

  //장소

  final _mainReview = ReviewModel(
    id: 0,
    profileImage: "profileImage",
    userName: "userName",
    date: "date",
    placeName: "placeName",
    review: "review",
    heartCount: 0,
    tags: [],
    images: [],
    isHeart: false,
  ).obs;
  ReviewModel get mainReview => _mainReview.value;
  set mainReview(val) => _mainReview.value = val;
  getMainReview(int reviewId) async {
    //TODO:프로필에서 사진 클릭시 reviewId로 메인 리뷰 불러오기
  }

  mainHeartChange() {
    mainReview.isHeart = !mainReview.isHeart;
    if (mainReview.isHeart) {
      mainReview.heartCount++;
      // TODO:메인 리뷰 좋아요 증가
    } else {
      mainReview.heartCount--;
      // TODO:메인 리뷰 좋아요 감소
    }
    _mainReview.refresh();
  }
  // 메인 리뷰

  final _anotherReviews = <ReviewModel>[
    ReviewModel(
      id: 1,
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
    ),
  ].obs;
  List<ReviewModel> get anotherReviews => _anotherReviews;
  set anotherReviews(val) => _anotherReviews.value = val;

  getReviews(String placeName) async {
    //TODO:장소에 다른 리뷰 불러오기
  }

  anotherHeartChange(int index) {
    anotherReviews[index].isHeart = !anotherReviews[index].isHeart;
    if (anotherReviews[index].isHeart) {
      anotherReviews[index].heartCount++;
      // TODO:리뷰 좋아요 증가
    } else {
      anotherReviews[index].heartCount--;
      // TODO:리뷰 좋아요 감소
    }
    _anotherReviews.refresh();
  }

  //다른 리뷰

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
    switch (value) {
      case "최신순":
        break;
      case "추천순":
        break;
    }
    // TODO:리뷰 정렬
  }

  getReviewsSort(int id, String sort) async {
    //TODO:프로필 페이지에서 리뷰 불러오기(정렬)
  }
  //정렬

  void launchURL(String placeName) async {
    //구글 맵 검색
    if (!await launch("https://www.google.com/maps/search/$placeName}")) {
      throw 'Could not launch $placeName';
    }
  }
}
