import 'package:card_swiper/card_swiper.dart';
import 'package:f_review/constants.dart';
import 'package:f_review/controller/name_page_controller.dart';
import 'package:f_review/ui/name_page/widget/name_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../date_data.dart';
import '../../image_detail_screen.dart';
import '../../profile_page/profile_page.dart';
import '../../search_page/widget/search_sub.dart';

class NameReviewWidget extends StatelessWidget {
  NameReviewWidget(
      {Key? key,
      required this.area,
      required this.service,
      required this.index})
      : super(key: key);
  final String service;
  final String area;
  final int index;

  final namePageController = Get.put(NamePageController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network(
                      "$kBaseUrl/user_profile/${namePageController.anotherReviews[index].profileImage}",
                      width: 40,
                      height: 40),
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
                          namePageController.anotherReviews[index].userName,
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
                            '$service·$area',
                            style: const TextStyle(
                              color: Color(0xFF2a2a2a),
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            DateFormat("M.dd").format(namePageController
                                    .anotherReviews[index].date) +
                                " " +
                                DateData().getWeekDay(namePageController
                                    .anotherReviews[index].date),
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
                        namePageController.anotherHeartChange(index);
                      },
                      child: namePageController.anotherReviews[index].isHeart
                          ? Image.asset('assets/heart.png', width: 17)
                          : Image.asset('assets/bora_heart.png', width: 17),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Obx(
                    () => Text(
                      namePageController.anotherReviews[index].heartCount
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
              itemBuilder: (BuildContext context, int swipeIndex) {
                return InkWell(
                  onTap: () {
                    Get.to(ImageDetailScreen(
                      galleryItems:
                          namePageController.anotherReviews[index].images,
                      pageController: PageController(initialPage: swipeIndex),
                    ));
                  },
                  child: NameImage(
                      image: namePageController
                          .anotherReviews[index].images[swipeIndex]),
                );
              },
              itemCount: namePageController.anotherReviews[index].images.length,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              namePageController.anotherReviews[index].review,
              style: const TextStyle(color: Color(0xFF2a2a2a), fontSize: 11),
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 23,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: namePageController.anotherReviews[index].tags.length,
                itemBuilder: (BuildContext context, int reviewIndex) {
                  return InkWell(
                    onTap: () {
                      Get.to(SearchSub(
                        tag: namePageController
                            .anotherReviews[index].tags[reviewIndex],
                      ));
                    },
                    child: Container(
                      height: 23,
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAE5F9),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '#${namePageController.anotherReviews[index].tags[reviewIndex]}',
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
