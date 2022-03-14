import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/controller/name_page_controller.dart';
import 'package:f_review/model/review_model.dart';
import 'package:f_review/ui/image_detail_screen.dart';
import 'package:f_review/ui/name_page/widget/name_image.dart';
import 'package:f_review/ui/name_page/widget/name_review_widget.dart';
import 'package:f_review/ui/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../model/profile_review_model.dart';
import '../search_page/widget/search_sub.dart';

class NamePage extends StatelessWidget {
  NamePage({
    Key? key,
    required this.reviewModel,
  }) : super(key: key);

  final ReviewModel reviewModel;
  final namePageController = Get.put(NamePageController());
  @override
  Widget build(BuildContext context) {
    if (reviewModel.id == 0) {
      ProfileReviewModel profileReviewModel = Get.arguments;
      print(profileReviewModel);
      //TODO: 서버에서 reviewId로 reviewModel 불러오기
      ///임시
      reviewModel.userName = "유라희";
      reviewModel.placeName = profileReviewModel.name;
      reviewModel.images = [profileReviewModel.image];
      reviewModel.isHeart = profileReviewModel.isHeart;
      reviewModel.profileImage = 'assets/avatar_1.png';
      reviewModel.date = "6.12.일";
      reviewModel.review =
          "매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...";
      reviewModel.tags = ["하남카페", "포토존", "비쥬얼맛집"];

      ///
    }
    namePageController.mainReview = reviewModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Image.asset(
          'assets/logo.png',
          width: 40,
        )),
        leading: Container(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF362C5E),
                size: 23,
              ),
            )),
        leadingWidth: 35,
        actions: [
          InkWell(
            onTap: () {
              Get.to(ProfilePage(
                userId: 0,
              ));
            },
            child: Container(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  'assets/avatar.png',
                  width: 30,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                namePageController
                                    .launchURL(reviewModel.placeName);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    reviewModel.placeName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'NotoSansKR-Bold',
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${namePageController.placeModel.service}·${namePageController.placeModel.address}',
                                  style: const TextStyle(
                                      color: Color(0xFF2a2a2a),
                                      fontSize: 11,
                                      fontFamily: 'NotoSansKR-Regular'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                        text: namePageController
                                            .placeModel.address));
                                    if (!Get.isSnackbarOpen) {
                                      Get.snackbar("성공", "클립보드에 주소가 복사되었습니다");
                                    }
                                  },
                                  child: const Icon(
                                    Icons.copy,
                                    size: 11,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              namePageController.placeCheck();
                            },
                            child: Column(
                              children: [
                                namePageController.placeModel.isSave
                                    ? Image.asset('assets/bookmark.png',
                                        width: 21)
                                    : Image.asset('assets/bookmark_empty.png',
                                        width: 21),
                                const SizedBox(height: 5),
                                const Text(
                                  '저장',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: Get.width,
                      height: 7,
                      color: const Color(0xFFFBF9FF),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(reviewModel.profileImage,
                                    width: 40, height: 40),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(ProfilePage(
                                          userId: 0,
                                        ));
                                      },
                                      child: Text(
                                        reviewModel.userName,
                                        style: const TextStyle(
                                          color: Color(0xFf2a2a2a),
                                          fontSize: 15,
                                          fontFamily: 'NotoSansKR-Bold',
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${namePageController.placeModel.service}·${namePageController.placeModel.address.substring(0, 2)}',
                                          style: const TextStyle(
                                            color: Color(0xFF2a2a2a),
                                            fontSize: 11,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          reviewModel.date,
                                          style: const TextStyle(
                                            color: Color(0xFF8D8D8D),
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      namePageController.mainHeartChange();
                                    },
                                    child: namePageController.mainReview.isHeart
                                        ? Image.asset('assets/heart.png',
                                            width: 17)
                                        : Image.asset('assets/bora_heart.png',
                                            width: 17),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Obx(
                                  () => Text(
                                    namePageController.mainReview.heartCount
                                        .toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF362C5E),
                                      fontSize: 10,
                                      fontFamily: 'NotoSansKR-Medium',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: Get.width,
                          height: 200,
                          child: Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ImageDetailScreen(
                                    galleryItems: reviewModel.images,
                                    pageController:
                                        PageController(initialPage: index),
                                  ));
                                },
                                child: NameImage(
                                  image: reviewModel.images[index],
                                ),
                              );
                            },
                            itemCount: reviewModel.images.length,
                            viewportFraction: 1.0,
                            scale: 0.9,
                            pagination: const SwiperPagination(
                              margin: EdgeInsets.only(top: 40),
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Color(0xff362C5E),
                                size: 7,
                              ),
                            ),
                            autoplay: true,
                            duration: 1000,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          reviewModel.review,
                          style: const TextStyle(
                              color: Color(0xFF2a2a2a), fontSize: 11),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 23,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: reviewModel.tags.length,
                              itemBuilder:
                                  (BuildContext context, int tagIndex) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(SearchSub(
                                      tag: reviewModel.tags[tagIndex],
                                    ));
                                  },
                                  child: Container(
                                    height: 23,
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEAE5F9),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '#${reviewModel.tags[tagIndex]}',
                                        style: const TextStyle(
                                            color: Color(0xFF2a2a2a),
                                            fontSize: 12,
                                            fontFamily: 'NotoSansKR-Regular'),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                height: 7,
                color: const Color(0xFFFBF9FF),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '같은 곳 다른 리뷰',
                          style: TextStyle(
                            fontFamily: 'NotoSansKR-Bold',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          namePageController.placeModel.reviewCount.toString(),
                          style: const TextStyle(
                            fontFamily: 'NotoSansKR-Bold',
                            fontSize: 16,
                            color: Color(0xFFFFAD00),
                          ),
                        ),
                      ],
                    ),
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            '추천순',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: namePageController.items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: namePageController.selectedValue,
                          onChanged: (value) {
                            namePageController.setItem(value.toString());
                          },
                          buttonHeight: 40,
                          buttonWidth: 75,
                          itemHeight: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: namePageController.anotherReviews
                    .asMap()
                    .map((index, reviewModel) => MapEntry(
                        index,
                        NameReviewWidget(
                          area: namePageController.placeModel.address
                              .substring(0, 2),
                          service: namePageController.placeModel.service,
                          index: index,
                        )))
                    .values
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
