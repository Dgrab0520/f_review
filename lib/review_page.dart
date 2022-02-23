import 'package:card_swiper/card_swiper.dart';
import 'package:f_review/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  _onPressedModifyTextField() {
    final text = 'Test';
    _textEditingController.text = text;
    _textEditingController.value = _textEditingController.value.copyWith(
      text: text,
      selection: TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }

  var _controller = TextEditingController();
  var _controller2 = TextEditingController();
  List<Widget> images = [
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

  List<Widget> render(BuildContext context, List<List<String>> children) {
    return ListTile.divideTiles(
      context: context,
      tiles: children.map((data) {
        return buildListTile(context, data[0], data[1], data[2]);
      }),
    ).toList();
  }

  Widget buildListTile(
      BuildContext context, String title, String subtitle, String url) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pushNamed(url);
      },
      isThreeLine: true,
      dense: false,
      leading: null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_right,
        color: Colors.blueAccent,
      ),
    );
  }

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
                    Text('리뷰를 작성해 보세요.',
                        style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'NotoSansKR-Bold',
                        )),
                    Text(
                      '실제로 사용하거나, 경험한 후기를 남기시면',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: 2,
                          ),
                          decoration: BoxDecoration(color: Color(0xFfEAE5F9)),
                          child: Text(
                            '플루닛 인증마크',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'NotoSansKR-Bold'),
                          ),
                        ),
                        Text(
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
              SizedBox(height: 40),
              Container(
                width: Get.width,
                height: 150,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return images[index];
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
                  children: [
                    Text(
                      '매장이름',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 5, bottom: 10),
                      width: Get.width,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F5FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: '',
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
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          )),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '내용',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      width: Get.width,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F5FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                          controller: _controller2,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText:
                                '솔직한 리뷰를 작성해주세요! \n 자신만의 TIP도 작성해주시면 많은 분들에게 도움이 됩니다 :)',
                            hintStyle: TextStyle(
                              color: Color(0xFFBFBFBF),
                              fontSize: 13,
                            ),
                            counterText: '',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          )),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '해시태그#',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      width: Get.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F5FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        children: [
                          TagEditor(
                            length: _values.length,
                            controller: _textEditingController,
                            focusNode: _focusNode,
                            delimiters: [',', ' ', ' ', ' '],
                            hasAddButton: false,
                            resetTextOnSubmitted: true,
                            textStyle:
                                const TextStyle(color: Color(0xFF2a2a2a)),
                            onSubmitted: (outstandingValue) {
                              setState(() {
                                _values.add(outstandingValue);
                              });
                            },
                            inputDecoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: '  _Text',
                              hintStyle: TextStyle(
                                color: Color(
                                  0xFF888888,
                                ),
                                fontFamily: 'family: NotoSansKR-Regular',
                                fontSize: 13,
                              ),
                            ),
                            onTagChanged: (newValue) {
                              setState(() {
                                _values.add(newValue);
                              });
                            },
                            tagBuilder: (context, index) => _Chip(
                              index: index,
                              label: _values[index],
                              onDeleted: _onDelete,
                            ),
                            // InputFormatters example, this disallow \ and /
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      '사진',
                      style: TextStyle(
                        fontFamily: 'NotoSansKR-Bold',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
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
                          SizedBox(width: 5),
                          Text(
                            '사진첨부',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NotoSansKR-Medium',
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '최대 10장',
                            style: TextStyle(
                              fontFamily: 'NotoSansKR-Regular',
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset('assets/r_img1.png')),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Image.asset('assets/cancel.png',
                                      width: 15))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset('assets/r_img1.png')),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Image.asset('assets/cancel.png',
                                      width: 15))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset('assets/r_img1.png')),
                              Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Image.asset('assets/cancel.png',
                                      width: 15))
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            '리뷰 작성시 유의사항',
                            style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Color(0xFF363057),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
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
                    SizedBox(height: 30),
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
      backgroundColor: Color(0xFFEAE5F9),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
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
