import 'package:f_review/controller/main_page_controller.dart';
import 'package:f_review/ui/main_page/widget/area_select_widget.dart';
import 'package:f_review/ui/main_page/widget/category_box_widget.dart';
import 'package:f_review/ui/main_page/widget/coupon_page.dart';
import 'package:f_review/ui/main_page/widget/search_widget.dart';
import 'package:f_review/ui/main_page/widget/service_select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../profile_page/profile_page.dart';
import '../search_page/search_page.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final mainPageController = Get.put(MainPageController());
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      mainPageController.setAllCategories();
      mainPageController.getSearchAutoCompleteResult();
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ));
    });
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: InkWell(
            onTap: () {
              mainPageController.scrollController.animateTo(
                  mainPageController.scrollController.position.minScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            child: Image.asset(
              'assets/logo.png',
              width: 40,
            ),
          ),
          centerTitle: true,
          leading: Container(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset('assets/menu.png'),
          ),
          leadingWidth: 35,
          actions: [
            InkWell(
              onTap: () {
                Get.to(ProfilePage(
                  userId: 331,
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
          controller: mainPageController.scrollController,
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
                            children: const [
                              Text('리뷰 페이지',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'NotoSansKR-Bold',
                                  )),
                              Text(
                                "실제로 작성한 리뷰를 참고하세요.",
                                style: TextStyle(
                                  color: Color(0xFF8D8D8D),
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                          const SizedBox(width: 50),
                          InkWell(
                            onTap: () {
                              Get.to(CouponPage());
                            },
                            child: Container(
                              width: 60,
                              height: 25,
                              decoration: BoxDecoration(
                                color: const Color(0xFF363057),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
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
                            child: SearchWidget(),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                if (mainPageController.controller.text == "") {
                                  if (!Get.isSnackbarOpen) {
                                    Get.snackbar("오류", "검색어를 입력해주세요");
                                  }
                                } else {
                                  Get.to(SearchPage(
                                    keyword: mainPageController.controller.text,
                                    type: 'tag',
                                  ));
                                }
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
                      const Text('CATEGORY',
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
