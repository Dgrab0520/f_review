import 'package:f_review/constants.dart';
import 'package:f_review/controller/profile_page_controller.dart';
import 'package:f_review/ui/name_page/name_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileReviewWidget extends StatelessWidget {
  ProfileReviewWidget({Key? key, required this.index}) : super(key: key);

  final int index;
  final profilePageController = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        profilePageController
            .getReviewFromProfile(
                profilePageController.reviews[index].reviewId, 331)
            .then((value) {
          if (value != null) {
            Get.to(NamePage(reviewModel: value));
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.only(top: 5, right: 10, left: 10, bottom: 5),
        width: 110,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(profilePageController.categoryPressed['전체']!
                ? "$kBaseUrl/review_img/${profilePageController.reviews[index].image}"
                : "$kBaseUrl/review_img/${profilePageController.selectedReviews[index].image}"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(
                  () => InkWell(
                    onTap: () {
                      profilePageController.categoryPressed['전체']!
                          ? profilePageController.reviewsHeartChange(index)
                          : profilePageController
                              .selectedReviewsHeartChange(index);
                    },
                    child: (profilePageController.categoryPressed['전체']!
                            ? profilePageController.reviews[index].isHeart
                            : profilePageController
                                .selectedReviews[index].isHeart)
                        ? Image.asset('assets/heart.png', width: 15)
                        : Image.asset('assets/n_heart.png', width: 15),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profilePageController.getShortArea(
                      profilePageController.categoryPressed['전체']!
                          ? profilePageController.reviews[index].area
                          : profilePageController.selectedReviews[index].area),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'NotoSansKR-Regular',
                  ),
                ),
                Text(
                  profilePageController.categoryPressed['전체']!
                      ? profilePageController.reviews[index].name
                      : profilePageController.selectedReviews[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'NotoSansKR-Regular',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
