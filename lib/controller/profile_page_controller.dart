import 'package:f_review/model/profile_review_model.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  final _reviews = <ProfileReviewModel>[
    ProfileReviewModel(
        area: "경기 하남",
        name: "마시랑게",
        image: 'assets/p_img1.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img2.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img3.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "경기 일산",
        name: "아벨리움",
        image: 'assets/p_img4.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
    ProfileReviewModel(
        area: "서울 강동",
        name: "가나다라",
        image: 'assets/p_img5.png',
        isHeart: false,
        reviewId: 0),
  ].obs;
  set reviews(value) => _reviews.value = value;
  List<ProfileReviewModel> get reviews => _reviews;

  reviewsHeartChange(int index) {
    reviews[index].isHeart = !reviews[index].isHeart;
    _reviews.refresh();
  }

  final _categoryPressed =

  allSelectCategory() {
    areaPressed[0] = !areaPressed[0];
    areaPressed.fillRange(1, areaPressed.length, areaPressed[0]);
    _areaPressed.refresh();

    if (areaPressed[0]) {
      setAllCategories();
    } else {
      categoryList.clear();
    }
  }

  selectCategory(int i) {
    areaPressed[i] = !areaPressed[i];
    if (!areaPressed[i]) {
      areaPressed[0] = false;
    }
    if (areaPressed.where((element) => element == true).length + 1 ==
        areaPressed.length) {
      areaPressed[0] = true;
      setAllCategories();
    }
    _areaPressed.refresh();
  }

  //

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
}
