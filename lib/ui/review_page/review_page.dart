import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/controller/review_page_controller.dart';
import 'package:f_review/ui/review_page/widget/hash_tag_widget.dart';
import 'package:f_review/ui/review_page/widget/search_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/address_search_controller.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({Key? key, required this.index}) : super(key: key);
  final reviewPageController = Get.put(ReviewPageController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
          leadingWidth: 35,
          centerTitle: true,
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
                      const Text('????????? ????????? ?????????.',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'NotoSansKR-Bold',
                          )),
                      const Text(
                        '????????? ???????????????, ????????? ????????? ????????????',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 2,
                            ),
                            decoration:
                                const BoxDecoration(color: Color(0xFfEAE5F9)),
                            child: const Text(
                              '????????? ????????????',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'NotoSansKR-Bold'),
                            ),
                          ),
                          const Text(
                            '??? ???????????????.',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: Get.width,
                  height: 150,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return reviewPageController.images[index];
                    },
                    itemCount: 3,
                    viewportFraction: 0.8,
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
                const SizedBox(height: 30),
                Container(
                  width: Get.width,
                  height: 7,
                  color: const Color(0xFFFBF9FF),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: const Text(
                                '??????',
                              ),
                              style: const TextStyle(
                                fontFamily: 'NotoSansKR-Bold',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              items: reviewPageController.items
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
                              value: reviewPageController.selectedValue,
                              onChanged: (value) {
                                reviewPageController.selectedValue = value;
                              },
                              iconSize: 30,
                              iconEnabledColor: const Color(0xff362C5E),
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 160,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color(0xFFF8F5FF),
                              ),
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Obx(
                          () => DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              hint: const Text(
                                '????????????',
                              ),
                              style: const TextStyle(
                                fontFamily: 'NotoSansKR-Bold',
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              items: reviewPageController.items2
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
                              value: reviewPageController.selectedValue2,
                              onChanged: (value) {
                                reviewPageController.selectedValue2 = value;
                              },
                              iconSize: 30,
                              iconEnabledColor: const Color(0xff362C5E),
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 50,
                              buttonWidth: 160,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color(0xFFF8F5FF),
                              ),
                              itemHeight: 40,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              dropdownMaxHeight: 200,
                              dropdownWidth: 200,
                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(-20, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '????????????',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR-Bold',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 5,
                            bottom: 3,
                          ),
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8F5FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                              onTap: () {
                                final addressSearchController =
                                    Get.put(AddressSearchController());
                                addressSearchController.addressInit();
                                Get.to(SearchAddressWidget());
                                FocusScope.of(context).unfocus();
                              },
                              controller: reviewPageController.controller,
                              decoration: const InputDecoration(
                                hintText: '??????????????? ??????????????????',
                                hintStyle: TextStyle(
                                  color: Color(0xFFBFBFBF),
                                  fontSize: 13,
                                ),
                                suffixIcon: Icon(Icons.search),
                                counterText: '',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                              )),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            reviewPageController.address == ""
                                ? ""
                                : "?????? : " + reviewPageController.address,
                            style: const TextStyle(
                              color: Color(0xFFBFBFBF),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        '??????',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR-Bold',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        width: Get.width,
                        height: 150,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F5FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                            controller: reviewPageController.controller2,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: null,
                            decoration: const InputDecoration(
                              hintText:
                                  '????????? ????????? ??????????????????! \n ???????????? TIP??? ?????????????????? ?????? ???????????? ????????? ????????? :)',
                              hintStyle: TextStyle(
                                color: Color(0xFFBFBFBF),
                                fontSize: 13,
                              ),
                              counterText: '',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                            )),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        '????????????#',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR-Bold',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 7),
                      HashTagWidget(),
                      const SizedBox(height: 30),
                      const Text(
                        '??????',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR-Bold',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 7),
                      InkWell(
                        onTap: () {
                          reviewPageController.getPictures();
                        },
                        child: Container(
                          width: 160,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/camera.png', width: 20),
                              const SizedBox(width: 5),
                              const Text(
                                '????????????',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NotoSansKR-Medium',
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '?????? 10???',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR-Regular',
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: Get.width,
                        height: 120,
                        child: Obx(() => ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: reviewPageController.files.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Image.file(
                                            reviewPageController.files[index])),
                                    Positioned(
                                        right: 0,
                                        top: 0,
                                        child: InkWell(
                                          onTap: () {
                                            reviewPageController
                                                .removePicture(index);
                                          },
                                          child: Image.asset(
                                              'assets/cancel.png',
                                              width: 15),
                                        ))
                                  ],
                                );
                              },
                            )),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              '?????? ????????? ????????????',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              reviewPageController.reviewAction();
                            },
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color(0xFF363057),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  '????????????',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'NotoSansKR-Medium',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
