import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/controller/profile_page_controller.dart';
import 'package:f_review/ui/profile_page/widget/profile_review_widget.dart';
import 'package:f_review/ui/review_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final profilePageController = Get.put(ProfilePageController());
  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 10),
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
          Container(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/avatar.png',
                width: 30,
                color: Colors.white,
              )),
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
                  Row(
                    children: [
                      Image.asset('assets/avatar_1.png', width: 50),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '유라희',
                            style: TextStyle(
                                fontSize: 14, fontFamily: 'NotoSansKR-Bold'),
                          ),
                          Text(
                            '맛집탐방하는 라희 :)',
                            style: TextStyle(
                                fontSize: 11, fontFamily: 'NotoSansKR-Regular'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '리뷰',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR-Regular',
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '5',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR-Bold',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFB1B1B1),
                              width: 0.7,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '사진',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR-Regular',
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '13',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR-Bold',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFB1B1B1),
                              width: 0.7,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              '받은 하트 수',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR-Regular',
                                fontSize: 11,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '5.3K',
                              style: TextStyle(
                                fontFamily: 'NotoSansKR-Bold',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Get.to(ReviewPage());
                },
                child: Container(
                  width: Get.width,
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Color(0xFFB8B4CC)),
                    color: Color(0xFFF3EEFF),
                    borderRadius: BorderRadius.all(Radius.circular(7.0) // POINT
                        ),
                  ),
                  child: Center(
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
                color: Color(0xFFFBF9FF),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 67,
                        height: 25,
                        child: RaisedButton(
                          child: const Text(
                            '전체 5',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          elevation: 0,
                          textColor:
                              true ? Colors.white : const Color(0xFF362C5E),
                          // 2
                          color: true ? const Color(0xFF362C5E) : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(color: Color(0xFF362C5E)),
                          ),
                          // 3
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 7),
                      SizedBox(
                        width: 67,
                        height: 25,
                        child: RaisedButton(
                          child: const Text(
                            '뷰티 1',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          elevation: 0,
                          textColor:
                              true ? Colors.white : const Color(0xFF362C5E),
                          // 2
                          color: true ? const Color(0xFF362C5E) : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: const BorderSide(color: Color(0xFF362C5E)),
                          ),
                          // 3
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 7),
                      SizedBox(
                        width: 67,
                        height: 25,
                        child: RaisedButton(
                            child: const Text(
                              '카페 4',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            elevation: 0,
                            textColor:
                                true ? Colors.white : const Color(0xFF362C5E),
                            // 2
                            color:
                                true ? const Color(0xFF362C5E) : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color: Color(0xFF362C5E)),
                            ),
                            // 3
                            onPressed: () {}),
                      ),
                    ],
                  ),
                  DropdownButtonHideUnderline(
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
                        profilePageController.selectedValue = value as String;
                      },
                      buttonHeight: 40,
                      buttonWidth: 75,
                      itemHeight: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                    childAspectRatio: 1 / 1, //item 의 가로 1, 세로 2 의 비율
                    mainAxisSpacing: 15, //수평 Padding
                    crossAxisSpacing: 5, //수직 Padding
                  ),
                  itemCount: profilePageController.reviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProfileReviewWidget(index: index);
                  }),
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
