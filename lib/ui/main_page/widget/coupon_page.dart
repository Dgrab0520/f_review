import 'package:dotted_line/dotted_line.dart';
import 'package:f_review/ui/main_page/widget/coupon_sub.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja/ninja.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan2/qrscan2.dart' as scanner;

import '../../profile_page/profile_page.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  final privateKeyPem = '''
-----BEGIN RSA PRIVATE KEY-----
MIIBOwIBAAJBAMv7Reawnxr0DfYN3IZbb5ih/XJGeLWDv7WuhTlie//c2TDXw/mW
914VFyoBfxQxAezSj8YpuADiTwqDZl13wKMCAwEAAQJAYaTrFT8/KpvhgwOnqPlk
NmB0/psVdW6X+tSMGag3S4cFid3nLkN384N6tZ+na1VWNkLy32Ndpxo6pQq4NSAb
YQIhAPNlJsV+Snpg+JftgviV5+jOKY03bx29GsZF+umN6hD/AiEA1ouXAO2mVGRk
BuoGXe3o/d5AOXj41vTB8D6IUGu8bF0CIQC6zah7LRmGYYSKPk0l8w+hmxFDBAex
IGE7SZxwwm2iCwIhAInnDbe2CbyjDrx2/oKvopxTmDqY7HHWvzX6K8pthZ6tAiAw
w+DJoSx81QQpD8gY/BXjovadVtVROALaFFvdmN64sw==
-----END RSA PRIVATE KEY-----''';

  List<Map> restaurant = [
    {
      'name': '스타벅스',
      'coupon': '아메리카노 Tall 사이즈 무료 교환 쿠폰',
      'content': '아메라카노 Tall 사이즈 무료 쿠폰',
      'status': '사용가능',
      'date': '21.03.31 - 21.05.31',
      'image': 'assets/coupon1.png'
    },
    {
      'name': '이디아',
      'coupon': '아메리카노',
      'content': '아메라카노 무료 교환 쿠폰',
      'status': '사용가능',
      'date': '21.03.31 - 21.05.31',
      'image': 'assets/coupon2.png'
    },
    {
      'name': 'Rolling Pasta',
      'coupon': '아메리카노 Tall 사이즈',
      'content': '아메라카노 Tall 사이즈 무료 쿠폰아메라카노 Tall 사이즈 무료 쿠폰아메라카노 Tall 사이즈 무료 쿠폰',
      'date': '21.03.31 - 21.05.31',
      'status': '사용 완료',
      'image': 'assets/coupon3.jpg',
    },
  ];

  String? _result;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  Future _scan() async {
    await _handleCameraAndMic(Permission.camera);
    //await Permission.camera.request();
    //스캔 시작

    String? qr_scan = await scanner.scan();
    setState(() {
      final privateKey = RSAPrivateKey.fromPEM(privateKeyPem);
      final publicKey = privateKey.toPublicKey;
      _result = privateKey.decryptOaepToUtf8(qr_scan);
      print(_result);
      if (_result == '') {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('알림'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('쿠폰 사용에 실패했습니다'),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      '확인',
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      '취소',
                    ),
                  ),
                ],
              );
            });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('알림'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('쿠폰을 사용하시겠습니까?'),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      '확인',
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      '취소',
                    ),
                  ),
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.3,
          title: Image.asset(
            'assets/logo.png',
            width: 40,
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF363057),
                size: 23,
              ),
            ),
          ),
          leadingWidth: 35,
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      _scan();
                    },
                    icon: Icon(
                      CupertinoIcons.qrcode_viewfinder,
                      color: Colors.indigo,
                      size: 30,
                    )),
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
            )
          ],
        ),
        body: Container(
          width: Get.width,
          height: Get.height * 0.89,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: Get.height * 0.8,
                child: ListView.builder(
                    itemCount: restaurant.length,
                    itemBuilder: (_, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(CouponSub(),
                              arguments: restaurant[index]
                                  ['coupon']); //coupon_id 전
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15.0),
                          padding: EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 7.0, bottom: 7.0),
                          width: Get.width,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 2,
                                blurRadius: 6,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 17.0),
                                          child: Text(restaurant[index]['name'],
                                              style: restaurant[index]
                                                          ['status'] ==
                                                      '사용가능'
                                                  ? TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.deepOrange)
                                                  : TextStyle(
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black54)),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 17.0, top: 1),
                                      child: Text(
                                        restaurant[index]['coupon'],
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: restaurant[index]
                                                        ['status'] ==
                                                    '사용가능'
                                                ? Colors.black
                                                : Colors.grey,
                                            fontWeight: FontWeight.bold),
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 17.0, top: 10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              restaurant[index]['date'],
                                              style: TextStyle(
                                                fontSize: 11.0,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              restaurant[index]['status'],
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: restaurant[index]
                                                              ['status'] ==
                                                          '사용가능'
                                                      ? Colors.indigo
                                                      : Colors.grey),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              DottedLine(
                                direction: Axis.vertical,
                                lineLength: double.infinity,
                                lineThickness: 1.0,
                                dashLength: 4.0,
                                dashColor: Colors.grey,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Image.asset(
                                    restaurant[index]['image'],
                                    fit: BoxFit.fitWidth,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        )
        // Container(
        //   margin: EdgeInsets.all(30),
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Column(
        //     children: [
        //       Image.asset('assets/mega_1.png'),
        //       Container(
        //         padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Text(
        //               '메가커피',
        //               style: TextStyle(
        //                 fontSize: 13,
        //               ),
        //             ),
        //             SizedBox(height: 2),
        //             Text(
        //               '크림바바 1종 (커스타드, 초코, 생크림 증 택1) + 퐁크러쉬 + 쿠키프라페',
        //               style: TextStyle(
        //                 fontSize: 15,
        //                 fontFamily: 'NotoSansKR-Medium',
        //               ),
        //             ),
        //             SizedBox(height: 30),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text(
        //                   '교환처',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                   ),
        //                 ),
        //                 Text(
        //                   '메가커피',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                     fontFamily: 'NotoSansKR-Medium',
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 20),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text(
        //                   '교환처',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                   ),
        //                 ),
        //                 Text(
        //                   '메가커피',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                     fontFamily: 'NotoSansKR-Medium',
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 20),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Text(
        //                   '교환처',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                   ),
        //                 ),
        //                 Text(
        //                   '메가커피',
        //                   style: TextStyle(
        //                     fontSize: 12,
        //                     fontFamily: 'NotoSansKR-Medium',
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 25),
        //             InkWell(
        //               onTap: () {
        //                 Get.to(CouponSub());
        //               },
        //               child: Center(
        //                 child: Container(
        //                   width: 200,
        //                   height: 40,
        //                   decoration: BoxDecoration(
        //                     color: Color(0xFF363057),
        //                     borderRadius: BorderRadius.circular(5),
        //                   ),
        //                   child: Center(
        //                     child: Text(
        //                       'QR코드',
        //                       style: TextStyle(
        //                         color: Colors.white,
        //                         fontFamily: 'NotoSansKR-Medium',
        //                         fontSize: 15,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
