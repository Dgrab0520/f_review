import 'package:f_review/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class filterPage extends StatefulWidget {
  const filterPage({Key? key}) : super(key: key);

  @override
  _filterPageState createState() => _filterPageState();
}

class _filterPageState extends State<filterPage> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

  bool _areaPressed = false;
  bool _areaPressed2 = false;
  bool _areaPressed3 = false;
  bool _areaPressed4 = false;
  bool _areaPressed5 = false;
  bool _areaPressed6 = false;
  bool _areaPressed7 = false;

  bool _areaPressed_1 = false;
  bool _areaPressed2_1 = false;
  bool _areaPressed3_1 = false;
  bool _areaPressed4_1 = false;
  bool _areaPressed5_1 = false;
  bool _areaPressed6_1 = false;
  bool _areaPressed7_1 = false;

  bool _categoryPressed = false;
  bool _categoryPressed2 = false;
  bool _categoryPressed3 = false;
  bool _categoryPressed4 = false;
  bool _categoryPressed5 = false;
  bool _categoryPressed6 = false;
  bool _categoryPressed7 = false;

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
                    Text('필터',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'NotoSansKR-Bold',
                        )),
                    Text(
                      '원하시는 카테고리를 선택해주세요.',
                      style: TextStyle(
                        color: Color(0xFF8D8D8D),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: Get.width,
                      height: 7,
                      color: Color(0xFFFBF9FF),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '지역',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
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
                                    _areaPressed2 = !_areaPressed2;
                                    _areaPressed3 = !_areaPressed3;
                                    _areaPressed4 = !_areaPressed4;
                                    _areaPressed5 = !_areaPressed5;
                                    _areaPressed6 = !_areaPressed6;
                                    _areaPressed7 = !_areaPressed7;
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
                    SizedBox(height: 30),
                    Text(
                      '상세 지역',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
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
                                  '구리',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed_1 = !_areaPressed_1;
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
                                  '하남',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed2_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed2_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed2_1 = !_areaPressed2_1;
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
                                  '고양',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed3_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed3_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () {
                                  setState(() {
                                    _areaPressed3_1 = !_areaPressed3_1;
                                  });
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
                                  '수원',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed4_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed4_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed4_1 = !_areaPressed4_1;
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
                                  '용인',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed5_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed5_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed5_1 = !_areaPressed5_1;
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
                                  '안산',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed6_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed6_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed6_1 = !_areaPressed6_1;
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
                                  '남양주',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                elevation: 0,
                                textColor: _areaPressed7_1
                                    ? Colors.white
                                    : Color(0xFF362C5E),
                                // 2
                                color: _areaPressed7_1
                                    ? Color(0xFF362C5E)
                                    : Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Color(0xFF362C5E)),
                                ),
                                // 3
                                onPressed: () => {
                                  setState(() {
                                    _areaPressed7_1 = !_areaPressed7_1;
                                  })
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '카테고리',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
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
                                    _categoryPressed2 = !_categoryPressed2;
                                    _categoryPressed3 = !_categoryPressed3;
                                    _categoryPressed4 = !_categoryPressed4;
                                    _categoryPressed5 = !_categoryPressed5;
                                    _categoryPressed6 = !_categoryPressed6;
                                    _categoryPressed7 = !_categoryPressed7;
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
                    SizedBox(height: 30),
                    Text(
                      '날짜',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => _selectDate(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Color(0xFF2a2a2a),
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${selectedDate.toLocal()}".split(' ')[0],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Text('~'),
                              SizedBox(
                                width: 20.0,
                              ),
                              InkWell(
                                onTap: () => _selectDate2(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      child: Icon(
                                        Icons.calendar_today,
                                        color: Color(0xFF2a2a2a),
                                        size: 17,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${selectedDate2.toLocal()}"
                                          .split(' ')[0],
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 120),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF363057),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            '등록하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR-Bold',
                              fontSize: 15,
                            ),
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
      ),
    );
  }
}
