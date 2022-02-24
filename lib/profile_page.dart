import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:f_review/name_page.dart';
import 'package:f_review/review_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool heart = false;
  bool heart2 = false;
  bool heart3 = false;
  bool heart4 = false;
  bool heart5 = false;

  bool _categoryPressed = false;
  bool _category2Pressed = false;
  bool _category3Pressed = false;

  String? selectedValue;
  List<String> items = [
    '조회수',
    '추천순',
    '최신순',
  ];

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
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF362C5E),
                size: 23,
              ),
            )),
        leadingWidth: 35,
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
                padding: EdgeInsets.only(right: 10),
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
                padding: EdgeInsets.only(left: 10, right: 10, top: 40),
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
                                      fontSize: 14,
                                      fontFamily: 'NotoSansKR-Bold'),
                                ),
                                Text(
                                  '맛집탐방하는 라희 :)',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'NotoSansKR-Regular'),
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
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Get.to(ReviewPage());
                      },
                      child: Container(
                        width: Get.width,
                        height: 45,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: Color(0xFFB8B4CC)),
                          color: Color(0xFFF3EEFF),
                          borderRadius:
                              BorderRadius.all(Radius.circular(7.0) // POINT
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
                    SizedBox(height: 30),
                    Container(
                      width: Get.width,
                      height: 7,
                      color: Color(0xFFFBF9FF),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: SizedBox(
                                width: 67,
                                height: 25,
                                child: RaisedButton(
                                  child: Row(
                                    children: [
                                      new Text(
                                        '전체 5',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  elevation: 0,
                                  textColor: _categoryPressed
                                      ? Colors.white
                                      : Color(0xFF362C5E),
                                  // 2
                                  color: _categoryPressed
                                      ? Color(0xFF362C5E)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    side: BorderSide(color: Color(0xFF362C5E)),
                                  ),
                                  // 3
                                  onPressed: () => {
                                    setState(() {
                                      _categoryPressed = !_categoryPressed;
                                    })
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              child: SizedBox(
                                width: 67,
                                height: 25,
                                child: RaisedButton(
                                  child: Row(
                                    children: [
                                      new Text(
                                        '뷰티 1',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  elevation: 0,
                                  textColor: _category2Pressed
                                      ? Colors.white
                                      : Color(0xFF362C5E),
                                  // 2
                                  color: _category2Pressed
                                      ? Color(0xFF362C5E)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    side: BorderSide(color: Color(0xFF362C5E)),
                                  ),
                                  // 3
                                  onPressed: () => {
                                    setState(() {
                                      _category2Pressed = !_category2Pressed;
                                    })
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              child: SizedBox(
                                width: 67,
                                height: 25,
                                child: RaisedButton(
                                  child: Row(
                                    children: [
                                      new Text(
                                        '카페 4',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  elevation: 0,
                                  textColor: _category3Pressed
                                      ? Colors.white
                                      : Color(0xFF362C5E),
                                  // 2
                                  color: _category3Pressed
                                      ? Color(0xFF362C5E)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    side: BorderSide(color: Color(0xFF362C5E)),
                                  ),
                                  // 3
                                  onPressed: () => {
                                    setState(() {
                                      _category3Pressed = !_category3Pressed;
                                    })
                                  },
                                ),
                              ),
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
                            items: items
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
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonHeight: 40,
                            buttonWidth: 75,
                            itemHeight: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(NamePage());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 5, right: 10, left: 10, bottom: 5),
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/p_img1.png'),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            heart = !heart;
                                          });
                                        },
                                        child: heart
                                            ? Container(
                                                child: Image.asset(
                                                    'assets/heart.png',
                                                    width: 15),
                                              )
                                            : Container(
                                                child: Image.asset(
                                                    'assets/n_heart.png',
                                                    width: 15),
                                              ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '서울 하남시',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontFamily: 'NotoSansKR-Regular',
                                        ),
                                      ),
                                      Text(
                                        '마시랑게 카페',
                                        style: TextStyle(
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
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 5, right: 10, left: 10, bottom: 5),
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/p_img2.png'),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          heart2 = !heart2;
                                        });
                                      },
                                      child: heart2
                                          ? Container(
                                              child: Image.asset(
                                                  'assets/heart.png',
                                                  width: 15),
                                            )
                                          : Container(
                                              child: Image.asset(
                                                  'assets/n_heart.png',
                                                  width: 15),
                                            ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '서울 천호동',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'NotoSansKR-Regular',
                                      ),
                                    ),
                                    Text(
                                      '가나다라 카페',
                                      style: TextStyle(
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
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 5, right: 10, left: 10, bottom: 5),
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/p_img3.png'),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          heart3 = !heart3;
                                        });
                                      },
                                      child: heart3
                                          ? Container(
                                              child: Image.asset(
                                                  'assets/heart.png',
                                                  width: 15),
                                            )
                                          : Container(
                                              child: Image.asset(
                                                  'assets/n_heart.png',
                                                  width: 15),
                                            ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '서울 천호동',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'NotoSansKR-Regular',
                                      ),
                                    ),
                                    Text(
                                      '가나다라 카페',
                                      style: TextStyle(
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
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 5, right: 10, left: 10, bottom: 5),
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/p_img4.png'),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          heart4 = !heart4;
                                        });
                                      },
                                      child: heart4
                                          ? Container(
                                              child: Image.asset(
                                                  'assets/heart.png',
                                                  width: 15),
                                            )
                                          : Container(
                                              child: Image.asset(
                                                  'assets/n_heart.png',
                                                  width: 15),
                                            ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '경기 삼송동',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'NotoSansKR-Regular',
                                      ),
                                    ),
                                    Text(
                                      '아벨라움 헤어샵',
                                      style: TextStyle(
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
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 5, right: 10, left: 10, bottom: 5),
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/p_img5.png'),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          heart5 = !heart5;
                                        });
                                      },
                                      child: heart5
                                          ? Container(
                                              child: Image.asset(
                                                  'assets/heart.png',
                                                  width: 15),
                                            )
                                          : Container(
                                              child: Image.asset(
                                                  'assets/n_heart.png',
                                                  width: 15),
                                            ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '서울 천호동',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'NotoSansKR-Regular',
                                      ),
                                    ),
                                    Text(
                                      '가나다라 카페',
                                      style: TextStyle(
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
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
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
