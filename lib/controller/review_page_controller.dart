import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewPageController extends GetxController {
  final _images = [
    Container(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 4), // changes position of shadow
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
              SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    '유라희',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          SizedBox(width: 5),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFEAE5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
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
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 4), // changes position of shadow
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
              SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    '유그린',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          SizedBox(width: 5),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFF6F9E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
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
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(2, 4), // changes position of shadow
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
              SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    '유핑크',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          SizedBox(width: 5),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFF9E5E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
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

  final _values = <String>[].obs;
  List<String> get values => _values;
  set values(val) => _values.value = val;

  final FocusNode _focusNode = FocusNode();
  get focusNode => _focusNode;

  valueDelete(index) {
    values.removeAt(index);
    _values.refresh();
  }

  final textEditingController = TextEditingController();
  final controller = TextEditingController();
  final controller2 = TextEditingController();

  onSubmit(outstandingValue) {
    values.add(outstandingValue);
    _values.refresh();
  }

  onTagChanged(newValue) {
    values.add(newValue);
    _values.refresh();
  }

  final _obj = ''.obs;
  set obj(value) => _obj.value = value;
  get obj => _obj.value;
}
