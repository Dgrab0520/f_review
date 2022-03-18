import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/address_model.dart';

class AddressSearchController extends GetxController {
  static const apiKey = 'devU01TX0FVVEgyMDIyMDMxNzE3NDQxNDExMjM2MDU=';

  final _addressList = <Juso>[].obs;
  List<Juso> get addressList => _addressList;
  set addressList(val) => _addressList.value = val;

  final _isAddressLoading = false.obs;
  get isAddressLoading => _isAddressLoading.value;
  set isAddressLoading(val) => _isAddressLoading.value = val;

  final searchTec = TextEditingController();
  final scrollController = ScrollController();
  final _keyword = "".obs;
  get keyword => _keyword.value;
  set keyword(val) => _keyword.value = val;
  final _errorMessage = "검색어를 입력하세요.".obs;
  get errorMessage => _errorMessage.value;
  set errorMessage(val) => _errorMessage.value = val;
  final _page = 0.obs;
  get page => _page.value;
  set page(val) => _page.value = val;

  Future<Address> searchAddress(String query) async {
    String url = "https://openapi.naver.com/v1/search/local.json?query=$query";
    print(url);

    http.Response response = await http.get(Uri.parse(url), headers: {
      "X-Naver-Client-Id": "dW111ivka6eo7S0fYL_e",
      "X-Naver-Client-Secret": "ZJnZjZ7czq"
    });

    print(response.body);

    String bodyString = utf8.decode(response.bodyBytes);
    Map<String, dynamic> body = jsonDecode(bodyString);
    print(body);

    return Address.formJson(body);
  }

  addressInit() {
    keyword = "";
    addressList.clear();
    searchTec.clear();
  }

  void fetchAddress(String keyword, int pageNumber) async {
    isAddressLoading = false;
    try {
      Address address = await searchAddress(keyword);

      if (address.jusoList.isEmpty && address.common.total == 0) {
        '검색 결과가 없습니다.';
      }

      if (pageNumber == 1) {
        addressList.clear();
      }
      addressList.addAll(address.jusoList.cast<Juso>());
      print(addressList);
      _addressList.refresh();
      isAddressLoading = true;
    } catch (e) {
      print("exception : $e");
    }
  }
//////
}
