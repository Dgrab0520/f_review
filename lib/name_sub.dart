import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'heart_controller.dart';

class NameSub extends StatefulWidget {
  const NameSub({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _NameSubState createState() => _NameSubState();
}

class _NameSubState extends State<NameSub> {
  final heartController = Get.put(HeartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5, top: 10, right: 10),
      margin: EdgeInsets.only(
        bottom: 25,
      ),
      width: Get.width,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(
            'assets/name_img1.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: InkWell(
              onTap: () {
                heartController.heartChange(widget.index);
              },
              child: Obx(
                () => heartController.heart[widget.index]
                    ? Container(
                        child: Image.asset('assets/heart.png', width: 15),
                      )
                    : Container(
                        child: Image.asset('assets/n_heart.png', width: 15),
                      ),
              ),
            ),
          ),
          Container(
            child: Text(
              '1.4K',
              style: TextStyle(
                  color: Color(0xFF362C5E),
                  fontSize: 10,
                  fontFamily: 'NotoSansKR-Medium'),
            ),
          ),
        ],
      ),
    );
  }
}
