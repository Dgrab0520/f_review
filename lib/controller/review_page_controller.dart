import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPageController extends GetxController {
  final _images = [
    Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/avatar_1.png', width: 50),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Text(
                    '유라희',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFEAE5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '매장도 예쁘고 디저트도 맛있어요 :) 그 매장만의 특색이 너무 좋아서 또 갈거에요~!  ',
                style: TextStyle(
                  fontFamily: 'NotoSansKR-Regular',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/avatar_3.png', width: 50),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Text(
                    '유그린',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F9E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '매장도 예쁘고 디저트도 맛있어요 :) 그 매장만의 특색이 너무 좋아서 또 갈거에요~! ',
                style: TextStyle(
                  fontFamily: 'NotoSansKR-Regular',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/avatar_4.png', width: 50),
              const SizedBox(height: 3),
              Row(
                children: [
                  const Text(
                    '유핑크',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF9E5E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                '매장도 예쁘고 디저트도 맛있어요 :) 그 매장만의 특색이 너무 좋아서 또 갈거에요~! ',
                style: TextStyle(
                  fontFamily: 'NotoSansKR-Regular',
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  get images => _images;

  //상단 스와이프 이미지

  final textEditingController = TextEditingController(); //태그 입력
  final controller = TextEditingController(); //매장 이름
  final controller2 = TextEditingController(); //내용

  //컨트롤러

  final _values = <String>[].obs;
  List<String> get values => _values;
  set values(val) => _values.value = val;

  final FocusNode _focusNode = FocusNode();
  get focusNode => _focusNode;

  valueDelete(index) {
    values.removeAt(index);
    _values.refresh();
  }

  onSubmit(outstandingValue) {
    if (outstandingValue != "") {
      values.add(outstandingValue);
    }
    _values.refresh();
  }

  onTagChanged(newValue) {
    if (newValue != "") {
      values.add(newValue);
    }
    _values.refresh();
  }
  //태그 관리

  final _selectedValue = "지역".obs;
  get selectedValue => _selectedValue.value;
  set selectedValue(val) => _selectedValue.value = val;

  List<String> items = [
    '지역',
    '하남',
    '강동',
    '송파',
  ];
  //지역

  final _selectedValue2 = "카테고리".obs;
  get selectedValue2 => _selectedValue2.value;
  set selectedValue2(val) => _selectedValue2.value = val;

  List<String> items2 = [
    '카테고리',
    '카페',
    '맛집',
    '헤어샵',
    '네일샵',
    '도서',
    '공방',
  ];
  //카테고리

  final _files = <File>[].obs;
  List<File> get files => _files;
  set files(val) => _files.value = val;

  getPictures() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result != null) {
      files.addAll(result.paths
          .asMap()
          .map((i, path) => MapEntry(i, File(path!)))
          .values
          .toList());
      if (files.length > 10) {
        files.removeRange(10, files.length);
        _files.refresh();
      }
    } else {
      // User canceled the picker
    }
  }

  removePicture(int index) {
    files.removeAt(index);
    _files.refresh();
    print(files);
  }
  //사진 첨부&삭제

  writeReview() async {
    // TODO:리뷰 작성하기
  }

  searchPlace() {
    // TODO:행안부 API
    //https://blog.naver.com/PostView.nhn?blogId=lmj_java&logNo=222085429172
  }
}
