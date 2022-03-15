import 'package:card_swiper/card_swiper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/controller/review_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';

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
                      const Text('리뷰를 작성해 보세요.',
                          style: TextStyle(
                            fontSize: 23,
                            fontFamily: 'NotoSansKR-Bold',
                          )),
                      const Text(
                        '실제로 사용하거나, 경험한 후기를 남기시면',
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
                              '플루닛 인증마크',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'NotoSansKR-Bold'),
                            ),
                          ),
                          const Text(
                            '가 부여됩니다.',
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
                                '지역',
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
                                color: const Color(0xFFF8F5FF),
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
                                '카테고리',
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
                                color: const Color(0xFFF8F5FF),
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
                        '매장이름',
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
                              controller: reviewPageController.controller,
                              decoration: const InputDecoration(
                                hintText: '매장이름을 입력해주세요',
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
                      const SizedBox(height: 30),
                      const Text(
                        '내용',
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
                                  '솔직한 리뷰를 작성해주세요! \n 자신만의 TIP도 작성해주시면 많은 분들에게 도움이 됩니다 :)',
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
                        '해시태그#',
                        style: TextStyle(
                          fontFamily: 'NotoSansKR-Bold',
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F5FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Obx(() => TagEditor(
                              length: reviewPageController.values.length,
                              controller:
                                  reviewPageController.textEditingController,
                              focusNode: reviewPageController.focusNode,
                              delimiters: const [',', ' ', ' ', ' '],
                              hasAddButton: false,
                              resetTextOnSubmitted: true,
                              textStyle:
                                  const TextStyle(color: Color(0xFF2a2a2a)),
                              onSubmitted: (outstandingValue) {
                                reviewPageController.onSubmit(outstandingValue);
                              },
                              inputDecoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '태그 입력...',
                                hintStyle: TextStyle(
                                  color: Color(
                                    0xFF888888,
                                  ),
                                  fontFamily: 'family: NotoSansKR-Regular',
                                  fontSize: 13,
                                ),
                              ),
                              onTagChanged: (newValue) {
                                reviewPageController.onTagChanged(newValue);
                              },
                              tagBuilder: (context, index) => _Chip(
                                index: index,
                                label: reviewPageController.values[index],
                                onDeleted: (index) {
                                  reviewPageController.valueDelete(index);
                                },
                              ),
                              // InputFormatters example, this disallow \ and /
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(
                                    RegExp(r'[/\\]'))
                              ],
                            )),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        '사진',
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
                                '사진첨부',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'NotoSansKR-Medium',
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                '최대 10장',
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
                              '리뷰 작성시 유의사항',
                              style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              reviewPageController.writeReview();
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
                                  '등록하기',
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

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFFEAE5F9),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text("#$label"),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
