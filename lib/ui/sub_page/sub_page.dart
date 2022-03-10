import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/controller/sub_page_controller.dart';
import 'package:f_review/ui/sub_page/widget/bestreview_sub.dart';
import 'package:f_review/ui/sub_page/widget/review_widget.dart';
import 'package:f_review/ui/sub_page/widget/sponsor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../profile_page/profile_page.dart';

class SubPage extends StatelessWidget {
  SubPage({Key? key, required this.area, required this.service})
      : super(key: key);
  final String area;
  final String service;

  final subPageController = Get.put(SubPageController());

  @override
  Widget build(BuildContext context) {
    // List<Widget> render(BuildContext context, List<List<String>> children) {
    //   return ListTile.divideTiles(
    //     context: context,
    //     tiles: children.map((data) {
    //       return buildListTile(context, data[0], data[1], data[2]);
    //     }),
    //   ).toList();
    // }
    //
    // Widget buildListTile(
    //     BuildContext context, String title, String subtitle, String url) {
    //   return ListTile(
    //     onTap: () {
    //       Navigator.of(context).pushNamed(url);
    //     },
    //     isThreeLine: true,
    //     dense: false,
    //     leading: null,
    //     title: Text(title),
    //     subtitle: Text(subtitle),
    //     trailing: const Icon(
    //       Icons.arrow_right,
    //       color: Colors.blueAccent,
    //     ),
    //   );
    // }
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('$area $service 리뷰',
                        style: const TextStyle(
                          fontSize: 23,
                          fontFamily: 'NotoSansKR-Bold',
                        )),
                    const Text(
                      '실제로 작성한 리뷰를 참고하세요.',
                      style: TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 7,
                color: const Color(0xFFFBF9FF),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Sponsor',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSansKR-Bold',
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 2.5,
                      color: const Color(0xFFFFAD00),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 100,
                      width: Get.width,
                      child: Obx(
                        () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: subPageController.sponsorList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SponsorWidget(
                                sponsorModel:
                                    subPageController.sponsorList[index],
                              );
                            }),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          '*해당제품들은 플루닛 인증마크 이용자들 중 추첨을 통해 상품을 제공 해드립니다.',
                          style: TextStyle(
                            fontSize: 8,
                            color: Color(0xFF9D9D9D),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 7,
                color: const Color(0xFFFBF9FF),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('BEST REVIEW',
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
                    SizedBox(
                        width: Get.width,
                        height: 380,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return BestReviewSub(
                              index: index,
                              area: area,
                              service: service,
                            );
                          },
                          itemCount: subPageController.bestReview.length,
                          viewportFraction: 0.9,
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
                          autoplay: false,
                          duration: 1000,
                        )),
                    const SizedBox(height: 40),
                    Container(
                      width: Get.width,
                      height: 10,
                      color: const Color(0xFFFBF9FF),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('REVIEW',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'NotoSansKR-Bold',
                                )),
                            Container(
                              width: 25,
                              height: 2.5,
                              color: const Color(0xFFFFAD00),
                            ),
                          ],
                        ),
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
                              items: subPageController.items
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
                              value: subPageController.selectedValue,
                              onChanged: (value) {
                                subPageController.setItem(value.toString());
                              },
                              buttonHeight: 40,
                              buttonWidth: 75,
                              itemHeight: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      children: subPageController.reviews
                          .asMap()
                          .map((index, reviewModel) => MapEntry(
                              index,
                              ReviewWidget(
                                  index: index, area: area, service: service)))
                          .values
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
