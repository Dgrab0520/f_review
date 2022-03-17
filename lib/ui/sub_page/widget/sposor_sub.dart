import 'package:f_review/constants.dart';
import 'package:f_review/model/sponsor_model.dart';
import 'package:f_review/ui/sub_page/sub_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SponsorSub extends StatelessWidget {
  const SponsorSub(
      {Key? key,
      required this.sponsorModel,
      required this.area,
      required this.service})
      : super(key: key);
  final SponsorModel sponsorModel;
  final String area;
  final String service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      '$kBaseUrl/sponsor_img/${sponsorModel.contentImage}'),
                  const SizedBox(height: 20),
                  Center(
                    child: Container(
                      decoration: const BoxDecoration(color: Color(0xFfEAE5F9)),
                      child: Text(
                        sponsorModel.title,
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'NotoSansKR-Bold',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      sponsorModel.content,
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'NotoSansKR-Medium',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '* 유의사항',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'NotoSansKR-Bold',
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'NotoSansKR-Regular',
                          ),
                        ),
                        Text(
                          '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'NotoSansKR-Regular',
                          ),
                        ),
                        Text(
                          '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'NotoSansKR-Regular',
                          ),
                        ),
                        Text(
                          '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'NotoSansKR-Regular',
                          ),
                        ),
                        Text(
                          '- 본 쿠폰의 유효기간은 발급일로부터 2주 입니다.',
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'NotoSansKR-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Positioned(
                top: 10,
                right: 7,
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.to(SubPage(area: area, service: service));
                  },
                  child: Image.asset(
                    'assets/cross.png',
                    color: Colors.white,
                    width: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
