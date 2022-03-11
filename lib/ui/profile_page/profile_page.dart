import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/controller/profile_page_controller.dart';
import 'package:f_review/ui/profile_page/widget/bookmark_page.dart';
import 'package:f_review/ui/profile_page/widget/profile_edit_dialog.dart';
import 'package:f_review/ui/profile_page/widget/profile_review_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numeral/numeral.dart';

import '../review_page/review_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key, required this.userId}) : super(key: key);

  final int userId;
  final profilePageController = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
    profilePageController.setCategory();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/logo.png',
          width: 40,
        ),
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
        centerTitle: true,
        leadingWidth: 35,
        actions: [
          InkWell(
            onTap: () {
              Get.to(BookmarkPage());
            },
            child: Container(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Image.asset(
                  'assets/bookmark.png',
                  width: 23,
                  color: Color(0xFF362C5E),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Image.asset('assets/avatar_1.png', width: 50),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "유라희",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'NotoSansKR-Bold'),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Obx(
                                      () => Text(
                                        profilePageController.profileContent,
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'NotoSansKR-Regular'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.dialog(ProfileEditDialog());
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 14,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          const Text(
                            '리뷰',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR-Regular',
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            profilePageController.reviews.length.toString(),
                            style: const TextStyle(
                              fontFamily: 'NotoSansKR-Bold',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFB1B1B1),
                              width: 0.7,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          const Text(
                            '사진',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR-Regular',
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            profilePageController.profilePhotoCount.toString(),
                            style: const TextStyle(
                              fontFamily: 'NotoSansKR-Bold',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Container(
                        height: 35,
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFB1B1B1),
                              width: 0.7,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          const Text(
                            '받은 하트 수',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR-Regular',
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            Numeral(profilePageController.profileHeartCount)
                                .value(),
                            style: const TextStyle(
                              fontFamily: 'NotoSansKR-Bold',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.to(ReviewPage(
                    index: 0,
                  ));
                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 0.5, color: const Color(0xFFB8B4CC)),
                    color: const Color(0xFFF3EEFF),
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: const Center(
                    child: Text(
                      '리뷰 작성하기',
                      style: TextStyle(
                        color: Color(0xFF2a2a2a),
                        fontFamily: 'NotoSansKR-Regular',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                height: 7,
                color: const Color(0xFFFBF9FF),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 25,
                child: Row(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: profilePageController.groupList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 25,
                                margin: const EdgeInsets.only(right: 7),
                                child: Obx(() => ElevatedButton(
                                      child: Text(
                                        '${profilePageController.groupList.keys.elementAt(index)} ${profilePageController.groupList[profilePageController.groupList.keys.elementAt(index)].length}',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: profilePageController
                                                      .categoryPressed[
                                                  profilePageController
                                                      .categoryPressed.keys
                                                      .elementAt(index)]!
                                              ? Colors.white
                                              : const Color(0xFF362C5E),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        primary: profilePageController
                                                    .categoryPressed[
                                                profilePageController
                                                    .categoryPressed.keys
                                                    .elementAt(index)]!
                                            ? const Color(0xFF362C5E)
                                            : Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          side: const BorderSide(
                                              color: Color(0xFF362C5E)),
                                        ),
                                        // 3
                                      ),
                                      onPressed: () {
                                        index == 0
                                            ? profilePageController
                                                .allSelectCategory()
                                            : profilePageController
                                                .selectCategory(
                                                    profilePageController
                                                        .categoryPressed.keys
                                                        .elementAt(index));
                                      },
                                    )),
                              );
                            })),
                    Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          hint: Text(
                            '최신순',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: profilePageController.items
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
                          value: profilePageController.selectedValue,
                          onChanged: (value) {
                            profilePageController.setItem(value.toString());
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
              Obx(
                () => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 15, //수평 Padding
                      crossAxisSpacing: 5, //수직 Padding
                    ),
                    itemCount: profilePageController.categoryPressed['전체']!
                        ? profilePageController.reviews.length
                        : profilePageController.selectedReviews.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProfileReviewWidget(index: index);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
