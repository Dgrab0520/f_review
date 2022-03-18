import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:f_review/constants.dart';
import 'package:f_review/data/coupon_data.dart';
import 'package:f_review/model/coupon_model.dart';
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

  List<Map> restaurant =
  [
    {'name': '스타벅스', 'coupon': '아메리카노 Tall 사이즈 무료 교환 쿠폰', 'content': '아메라카노 Tall 사이즈 무료 쿠폰', 'status': '사용가능', 'date': '21.03.31 - 21.05.31', 'image': 'assets/coupon1.png'},
    {'name': '이디아', 'coupon': '아메리카노', 'content': '아메라카노 무료 교환 쿠폰', 'status': '사용가능', 'date': '21.03.31 - 21.05.31', 'image': 'assets/coupon2.png'},
    {'name': 'Rolling Pasta', 'coupon': '아메리카노 Tall 사이즈', 'content': '아메라카노 Tall 사이즈 무료 쿠폰아메라카노 Tall 사이즈 무료 쿠폰아메라카노 Tall 사이즈 무료 쿠폰', 'date': '21.03.31 - 21.05.31', 'status': '사용 완료', 'image': 'assets/coupon3.jpg', },
  ];

  List<Coupon> _coupon = [];
  List<Coupon> _coupon_scan = [];

  String? _result;
  bool _isLoading = false;

  @override
  void initState(){
    super.initState();
    getCoupon();
  }

  getCoupon(){
    Coupon_Data.getCoupon('admin').then((value){
      setState(() {
        _coupon = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading = false;
        });
      }else{
        setState(() {
          _isLoading = true;
          print(_coupon.length);
        });
      }
    });
  }

  selectCoupon(coupon_id){
    Coupon_Data.selectCoupon(coupon_id).then((value){
      setState(() {
        _coupon_scan = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading = false;
        });
      }else{
        setState(() {
          _isLoading = true;
          print(_coupon_scan.length);
        });
      }
    });
  }

  updateCoupon(coupon_id){
    Coupon_Data.updateCoupon(coupon_id, "admin").then((value){
      if(value == 'success'){
        Get.back();
        getCoupon();
        Get.snackbar("쿠폰 사용 완료", '쿠폰이 사용되었습니다');
      }else{
        Get.snackbar("쿠폰 사용 실패", '쿠폰이 사용에 실패하였습니다\n네트워크 상태를 확인 후 다시 시도해주세요');
      }
    });
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
      _result = privateKey.decryptOaepToUtf8(qr_scan);
      selectCoupon(_result);
      print(_result);
    });
    _isLoading ?
    Get.defaultDialog(
      radius: 0.0,
      title: '쿠폰 사용',
      titleStyle: TextStyle(fontSize: 15.0),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.0),
        width: Get.width,
        height: Get.height*0.7,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width,
                height: 260.0,
                child: Image.network('${kBaseUrl}/coupon/${_coupon_scan[0].coupon_image}', fit: BoxFit.fitWidth,),
              ),
              SizedBox(height: 15.0,),
              Text(_coupon_scan[0].coupon_brand, style: TextStyle(fontFamily: 'NotoSansKR-Medium', fontSize: 12.0, color: Colors.deepOrange),),
              Text(_coupon_scan[0].coupon_title, style: TextStyle(fontFamily: 'NotoSansKR-Medium', fontSize: 15.0),),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 10.0),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Color(0xFFf1f1f1)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('이용 방법', style: TextStyle(fontSize: 11.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text(_coupon_scan[0].coupon_detail, style: TextStyle(fontSize: 11.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                    SizedBox(height: 20,),
                    Text('주의사항', style: TextStyle(fontSize: 11.0, color: Colors.black87, fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Text(_coupon_scan[0].coupon_notice, style: TextStyle(fontSize: 11.0, color: Colors.black54, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 35.0,
                          color: Color(0xFFe5e5e5),
                          child: Center(
                            child: Text('취소'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          updateCoupon(_coupon_scan[0].coupon_id);
                        },
                        child: Container(
                          height: 35.0,
                          color: Colors.indigo,
                          child: Center(
                            child: Text('사용 확인', style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    ) : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Center(
            child: Image.asset(
          'assets/logo.png',
          width: 40,
        )),
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
                  onPressed: (){
                    _scan();

                  },
                  icon: Icon(CupertinoIcons.qrcode_viewfinder, color: Colors.indigo, size: 30,)
              ),
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
        height: Get.height*0.89,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.height*0.8,
              child: ListView.builder(
                  itemCount: _coupon.length,
                  itemBuilder: (_, int index){
                    return InkWell(
                      onTap: (){
                        Get.to(CouponSub(), arguments: _coupon[index].coupon_id);  //coupon_id 전
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.0),
                        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 7.0, bottom: 7.0),
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
                              offset: Offset(0, 3), // changes position of shadow
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
                                        child: Text(_coupon[index].coupon_brand, style:
                                        _coupon[index].coupon_status == '사용 가능'
                                            ? TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.deepOrange)
                                            : TextStyle(fontSize: 12.0, fontWeight: FontWeight.w800, color: Colors.black54)
                                        ),
                                      ),
                                      SizedBox(width: 10.0,)
                                    ],
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 17.0, top: 1),
                                    child: Text(
                                      _coupon[index].coupon_title,
                                      style: TextStyle(fontSize: 16.0, color: _coupon[index].coupon_status == '사용 가능' ? Colors.black : Colors.grey, fontWeight: FontWeight.bold),
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 17.0, top: 10.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('${(_coupon[index].coupon_date).substring(0,11)}까지 이용 가능', style: TextStyle(fontSize: 11.0,),),
                                          Spacer(),
                                          Text(_coupon[index].coupon_status, style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w600, color: _coupon[index].coupon_status == '사용 가능' ? Colors.indigo : Colors.grey),)
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Colors.grey,
                            ),
                            SizedBox(width: 5.0,),
                            Expanded(
                              flex: 4,
                              child: Center(
                                child: Image.network('${kBaseUrl}/coupon/${_coupon[index].brand_image}', fit: BoxFit.fitWidth, width: 100.0, height: 100.0,),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );

                  }
              ),
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
