import 'package:f_review/controller/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceSelectWidget extends StatelessWidget {
  ServiceSelectWidget({Key? key, required this.index}) : super(key: key);
  final mainPageController = Get.put(MainPageController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: 20,
          margin: const EdgeInsets.only(right: 7),
          child: ElevatedButton(
            child: Text(
              mainPageController.serviceList[index],
              style: TextStyle(
                fontSize: 12,
                color: mainPageController.servicePressed[index]
                    ? Colors.white
                    : const Color(0xFFFFAD00),
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: mainPageController.servicePressed[index]
                  ? const Color(0xFFFFAD00)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: const BorderSide(color: Color(0xFFFFAD00)),
              ),
              // 3
            ),
            onPressed: () {
              index == 0
                  ? mainPageController.allSelectService()
                  : mainPageController.selectService(index);
            },
          ),
        ));
  }
}
