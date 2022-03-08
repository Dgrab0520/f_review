import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main_page_controller.dart';

class AreaSelectWidget extends StatelessWidget {
  AreaSelectWidget({Key? key, required this.index}) : super(key: key);
  final mainPageController = Get.put(MainPageController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 20,
          margin: const EdgeInsets.only(right: 7),
          child: ElevatedButton(
            child: Text(
              mainPageController.areaList[index],
              style: TextStyle(
                fontSize: 12,
                color: mainPageController.areaPressed[index]
                    ? Colors.white
                    : const Color(0xFF362C5E),
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: mainPageController.areaPressed[index]
                  ? const Color(0xFF362C5E)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(color: Color(0xFF362C5E)),
              ),
              // 3
            ),
            onPressed: () {
              index == 0
                  ? mainPageController.allSelectArea()
                  : mainPageController.selectArea(index);
            },
          ),
        ));
  }
}
