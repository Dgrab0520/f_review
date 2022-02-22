import 'package:f_review/filter.dart';
import 'package:f_review/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SubPage extends StatefulWidget {
  const SubPage({Key? key}) : super(key: key);

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
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
                              child: InkWell(
                                onTap: () {},
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
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    side: BorderSide(color: Color(0xFF362C5E)),
                                  ),
                                  // 3
                                  onPressed: () => {
                                    setState(() {
                                      _areaPressed3 = !_areaPressed3;
                                    })
                                  },
                                ),
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
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Sponsor',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSansKR-Bold',
                      ),
                    ),
                    Container(
                      width: 25,
                      height: 2.5,
                      color: Color(0xFFFFAD00),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset('assets/sponsor_1.png'),
                              Container(
                                child: Text(
                                  '[하남 미사점] 1만원 무료쿠폰 10명',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset('assets/sponsor_2.png'),
                              Container(
                                child: Text(
                                  '[하남 미사점] 카페라떼 무료쿠폰 20명',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
              SizedBox(height: 20),
              Container(
                width: Get.width,
                height: 7,
                color: Color(0xFFFBF9FF),
              ),
              SizedBox(height: 20),
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
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                      width: Get.width,
                      height: 330,
                      decoration: BoxDecoration(
                        color: Color(0xFFFBF9FF),
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
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/avatar_1.png',
                                    width: 40, height: 40),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '유라희',
                                          style: TextStyle(
                                            color: Color(0xFf2a2a2a),
                                            fontSize: 15,
                                            fontFamily: 'NotoSansKR-Bold',
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Image.asset('assets/mark.png',
                                            width: 15, height: 15),
                                      ],
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '사진리뷰 5   6.12.일',
                                            style: TextStyle(
                                              color: Color(0xFF8D8D8D),
                                              fontSize: 11,
                                            ),
                                          ),
                                          Text(
                                            '카페·서울 하남',
                                            style: TextStyle(
                                              color: Color(0xFF2a2a2a),
                                              fontSize: 11,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                            Container(
                              width: Get.width,
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/sub_img.png'),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 20, right: 10),
                                    child: Column(
                                      children: [
                                        Image.asset('assets/heart.png',
                                            width: 20),
                                        SizedBox(height: 1),
                                        Text(
                                          '1.4K',
                                          style: TextStyle(
                                            color: Color(0xFF362C5E),
                                            fontSize: 10,
                                            fontFamily: 'NotoSansKR-Medium',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '마시랑게',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'NotoSansKR-Bold',
                                      color: Color(0xFF2a2a2a),
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Icon(Icons.arrow_forward_ios,
                                      size: 15, color: Color(0xFF2a2a2a)),
                                ],
                              ),
                            ),
                            SizedBox(height: 2),
                            Container(
                              child: Text(
                                '매장도 예쁘고 디저트도 맛있어요 ㅎㅎ 포토존도 따로 있는데 사람이 많아서 줄 서서 기다려야되용.. 그래도 그만큼 사진도 너무 잘나오고 ...',
                                style: TextStyle(
                                    color: Color(0xFF2a2a2a), fontSize: 11),
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEAE5F9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#하남카페',
                                      style: TextStyle(
                                          color: Color(0xFF2a2a2a),
                                          fontSize: 12,
                                          fontFamily: 'NotoSansKR-Regular'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 70,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEAE5F9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#포토존',
                                      style: TextStyle(
                                          color: Color(0xFF2a2a2a),
                                          fontSize: 12,
                                          fontFamily: 'NotoSansKR-Regular'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 90,
                                  height: 23,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEAE5F9),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '#비쥬얼맛집',
                                      style: TextStyle(
                                          color: Color(0xFF2a2a2a),
                                          fontSize: 12,
                                          fontFamily: 'NotoSansKR-Regular'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: Get.width,
                      height: 10,
                      color: Color(0xFFFBF9FF),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('REVIEW',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'NotoSansKR-Bold',
                                )),
                            Container(
                              width: 25,
                              height: 2.5,
                              color: Color(0xFFFFAD00),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('최신순',
                                style: TextStyle(
                                  fontFamily: 'NotoSansKR-Regular',
                                )),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/avatar_2.png',
                                width: 40, height: 40),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '유그린',
                                      style: TextStyle(
                                        color: Color(0xFf2a2a2a),
                                        fontSize: 15,
                                        fontFamily: 'NotoSansKR-Bold',
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Image.asset('assets/mark.png',
                                        width: 15, height: 15),
                                  ],
                                ),
                                Container(
                                  width:320,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '사진리뷰 5   6.12.일',
                                        style: TextStyle(
                                          color: Color(0xFF8D8D8D),
                                          fontSize: 11,
                                        ),
                                      ),
                                      Text(
                                        '카페·서울 하남',
                                        style: TextStyle(
                                          color: Color(0xFF2a2a2a),
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'assets/img3.png',
                                  )),
                              SizedBox(width: 5),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset('assets/g_img2.png'),
                                    SizedBox(height: 5),
                                    Container(
                                      width: Get.width,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/g_img3.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+2',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'NotoSansKR-Medium',
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '카페웨더',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'NotoSansKR-Bold',
                                  color: Color(0xFF2a2a2a),
                                ),
                              ),
                              SizedBox(width: 2),
                              Icon(Icons.arrow_forward_ios,
                                  size: 15, color: Color(0xFF2a2a2a)),
                            ],
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                          child: Text(
                            '빈티지한 느낌의 카페에요. 분위기 너무 좋고, 조용해요. 분위기 뿐만 아니라 매장에 디저트류도 많고, 음료도 다양해서 앞으로 제 최애 카페로 ...',
                            style: TextStyle(
                                color: Color(0xFF2a2a2a), fontSize: 11),
                          ),
                        ),
                        SizedBox(height: 25),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Color(0xFFEAE5F9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '#하남카페',
                                  style: TextStyle(
                                      color: Color(0xFF2a2a2a),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansKR-Regular'),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 70,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Color(0xFFEAE5F9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '#디저트',
                                  style: TextStyle(
                                      color: Color(0xFF2a2a2a),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansKR-Regular'),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 70,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Color(0xFFEAE5F9),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  '#빈티지',
                                  style: TextStyle(
                                      color: Color(0xFF2a2a2a),
                                      fontSize: 12,
                                      fontFamily: 'NotoSansKR-Regular'),
                                ),
                              ),
                            ),
                          ],
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
