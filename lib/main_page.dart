import 'package:f_review/filter.dart';
import 'package:f_review/profile_page.dart';
import 'package:f_review/sub_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _areaPressed = false;
  bool _areaPressed2 = false;
  bool _areaPressed3 = false;
  bool _areaPressed4 = false;
  bool _areaPressed5 = false;
  bool _areaPressed6 = false;
  bool _areaPressed7 = false;

  bool _categoryPressed = false;
  bool _categoryPressed2 = false;
  bool _categoryPressed3 = false;
  bool _categoryPressed4 = false;
  bool _categoryPressed5 = false;
  bool _categoryPressed6 = false;
  bool _categoryPressed7 = false;

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
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
            padding: EdgeInsets.only(left: 10),
            child: Image.asset(
              'assets/menu.png',
            )),
        leadingWidth: 35,
        actions: [
          InkWell(
            onTap: () {
              Get.to(ProfilePage());
            },
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
                    Text('리뷰 페이지',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'NotoSansKR-Bold',
                        )),
                    Text(
                      '실제로 작성한 리뷰를 참고하세요.',
                      style: TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 5, bottom: 5),
                            width: Get.width,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFFdbdbdb).withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(
                                      2, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  hintText: '원하는 내용을 검색해보세요',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFBFBFBF),
                                    fontSize: 13,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: _controller.clear,
                                    icon: Icon(Icons.clear),
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
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Get.to(filterPage());
                            },
                            child: Container(
                              height: 25,
                              child: Image.asset('assets/filter.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: Get.width,
                      height: 28,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '전체',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed = !_areaPressed;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '서울',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed2
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed2
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed2 = !_areaPressed2;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '경기',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed3
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed3
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () {
                                  setState(() {
                                    _areaPressed3 = !_areaPressed3;
                                  });
                                  Get.to(SubPage());
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '대전',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed4
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed4
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed4 = !_areaPressed4;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '대구',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed5
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed5
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed5 = !_areaPressed5;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '부산',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed6
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed6
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed6 = !_areaPressed6;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '인천',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed7
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed7
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed7 = !_areaPressed7;
                                  })
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: Get.width,
                      height: 28,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '전체',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
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
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '카페',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed2
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed2
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _categoryPressed2 = !_categoryPressed2;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '식당',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed3
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed3
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _categoryPressed3 = !_categoryPressed3;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 70,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '헤어샵',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed4
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed4
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _categoryPressed4 = !_categoryPressed4;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 70,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '네일샵',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed5
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed5
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _categoryPressed5 = !_categoryPressed5;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 80,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '전자제품',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed6
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed6
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _categoryPressed6 = !_categoryPressed6;
                                  })
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            child: SizedBox(
                              width: 60,
                              height: 20,
                              child: RaisedButton(
                                child: new Text(
                                  '도서',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _categoryPressed7
                                    ? Colors.white
                                    : Color(0xFFFFAD00),
                                // 2
                                color: _categoryPressed7
                                    ? Color(0xFFFFAD00)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFFFFAD00)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _categoryPressed7 = !_categoryPressed7;
                                  })
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: Get.width,
                height: 7,
                color: Color(0xFFFBF9FF),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('BEST REVIEW',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'NotoSansKR-Bold',
                        )),
                    Container(
                      width: 25,
                      height: 2.5,
                      color: Color(0xFFFFAD00),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        Get.to(SubPage());
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        width: Get.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/category_1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '하남 카페 리뷰',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'NotoSansKR-Medium',
                              ),
                            ),
                            Text(
                              '다양한 카페 리뷰를 참고해보세요!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'NotoSansKR-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        width: Get.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/category_2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '잠실 맛집 리뷰',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'NotoSansKR-Medium',
                              ),
                            ),
                            Text(
                              '잠실 맛집 리뷰를 참고해보세요!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'NotoSansKR-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        width: Get.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/category_3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '대학로 공방 리뷰',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'NotoSansKR-Medium',
                              ),
                            ),
                            Text(
                              '대학로 공방 리뷰를 참고해보세요!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'NotoSansKR-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        width: Get.width,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage('assets/category_4.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '일산 네일샵 리뷰',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'NotoSansKR-Medium',
                              ),
                            ),
                            Text(
                              '일산 네일샵 리뷰를 참고해보세요!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontFamily: 'NotoSansKR-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
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
