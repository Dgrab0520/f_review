import 'package:f_review/controller/main_page_controller.dart';
import 'package:f_review/ui/main_page/widget/area_select_widget.dart';
import 'package:f_review/ui/main_page/widget/category_box_widget.dart';
import 'package:f_review/ui/main_page/widget/coupon_page.dart';
import 'package:f_review/ui/main_page/widget/search_page.dart';
import 'package:f_review/ui/main_page/widget/service_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../profile_page/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final mainPageController = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    mainPageController.setAllCategories();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
            child: Image.asset('assets/menu.png'),
          ),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('리뷰 페이지',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'NotoSansKR-Bold',
                                  )),
                              const Text(
                                "실제로 작성한 리뷰를 참고하세요.",
                                style: TextStyle(
                                  color: Color(0xFF8D8D8D),
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                          SizedBox(width: 50),
                          InkWell(
                            onTap: () {
                              Get.to(CouponPage());
                            },
                            child: Container(
                              width: 60,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xFF363057),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '쿠폰',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: InkWell(
                              onTap: () {
                                Get.to(SearchPage());
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 5, bottom: 5),
                                width: Get.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFdbdbdb)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(
                                          2, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: TextField(
                                    controller: mainPageController.controller,
                                    decoration: const InputDecoration(
                                      hintText: '원하는 내용을 검색해보세요',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFBFBFBF),
                                        fontSize: 13,
                                      ),
                                      counterText: '',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                mainPageController.controller.clear();
                                FocusScope.of(context).unfocus();
                              },
                              child: const SizedBox(
                                height: 25,
                                child: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: Get.width,
                        height: 28,
                        child: ListView.builder(
                          //지역 선택
                          scrollDirection: Axis.horizontal,
                          itemCount: mainPageController.areaList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AreaSelectWidget(index: index);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width,
                        height: 28,
                        child: ListView.builder(
                          //서비스 선택
                          scrollDirection: Axis.horizontal,
                          itemCount: mainPageController.serviceList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ServiceSelectWidget(index: index);
                          },
                        ),
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
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('CATEGORY REVIEW',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoSansKR-Bold',
                          )),
                      Container(
                        width: 25,
                        height: 2.5,
                        color: const Color(0xFFFFAD00),
                      ),
                      const SizedBox(height: 15),
                      Obx(
                        () => Column(
                            children: mainPageController.categoryList
                                .map((category) =>
                                    CategoryBoxWidget(category: category))
                                .toList()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
