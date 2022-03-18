import 'package:f_review/controller/address_search_controller.dart';
import 'package:f_review/controller/review_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/address_model.dart';

class SearchAddressWidget extends StatelessWidget {
  SearchAddressWidget({Key? key}) : super(key: key);

  final addressSearchController = Get.put(AddressSearchController());
  final reviewPageController = Get.put(ReviewPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: const Text(
            "주소 검색",
            style: TextStyle(color: Colors.black),
          ),
          leading: Container(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF362C5E),
                  size: 23,
                ),
              )),
          leadingWidth: 35,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(child: searchTextField()),
                cancelWidget(),
                const SizedBox(width: 10)
              ],
            ),
            Expanded(child: Obx(() => listView())),
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20),
      height: 50,
      alignment: Alignment.center,
      child: TextField(
        controller: addressSearchController.searchTec,
        onSubmitted: (text) {
          if (addressSearchController.keyword == text) return;
          addressSearchController.keyword = text;
          addressSearchController.page = 1;
          addressSearchController.fetchAddress(text, 1);
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "주소 입력",
          hintStyle: TextStyle(color: Color(0xFFA0A0A0)),
        ),
      ),
    );
  }

  Widget cancelWidget() {
    if (addressSearchController.keyword.isEmpty) {
      return Container();
    } else {
      return GestureDetector(
        child: const Icon(
          Icons.cancel,
          color: Color(0xFFBFBFBF),
          size: 20,
        ),
        onTap: () => addressSearchController.searchTec.clear(),
      );
    }
  }

  Widget listView() {
    if (addressSearchController.addressList.isEmpty) {
      return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 15,
              color: const Color(0xFFEdEdEd),
            ),
            Expanded(
                child: Center(
              child: Text(addressSearchController.errorMessage),
            ))
          ],
        ),
      );
    } else {
      return Obx(() => addressSearchController.isAddressLoading
          ? ListView.builder(
              controller: addressSearchController.scrollController,
              itemCount: addressSearchController.addressList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(height: 15, color: const Color(0xFFEdEdEd));
                } else {
                  return Obx(() => Column(
                        children: [
                          listItem(
                              addressSearchController.addressList[index - 1]),
                          Container(height: 1, color: const Color(0xFFEdEdEd)),
                        ],
                      ));
                }
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ));
    }
  }

  Widget listItem(Juso address) {
    return InkWell(
      onTap: () {
        reviewPageController.controller.text = address.title.contains("<b>")
            ? address.title.replaceAll(RegExp(r'<b>|</b>'), "")
            : address.title;
        reviewPageController.address = address.roadAddress;
        Get.back();
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
        alignment: Alignment.centerLeft,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              address.title.contains("<b>")
                  ? address.title.replaceAll(RegExp(r'<b>|</b>'), "")
                  : address.title,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              address.address,
              style: TextStyle(color: Color(0xFFA8A8A8)),
            ),
            Text(
              '[도로명] ' + address.roadAddress,
              style: TextStyle(color: Color(0xFFA8A8A8)),
            ),
          ],
        ),
      ),
    );
  }
}
