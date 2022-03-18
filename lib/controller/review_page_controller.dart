import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../constants.dart';
import '../model/search_model.dart';

class ReviewPageController extends GetxController {
  final _images = [
    Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4), // changes position of shadow
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
              const SizedBox(height: 3),
              Row(
                children: [
                  const Text(
                    '유라희',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFEAE5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
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
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4),
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
              const SizedBox(height: 3),
              Row(
                children: [
                  const Text(
                    '유그린',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F9E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
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
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 25),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFdbdbdb).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 4), // changes position of shadow
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
              const SizedBox(height: 3),
              Row(
                children: [
                  const Text(
                    '유핑크',
                    style: TextStyle(
                      fontFamily: 'NotoSansKR-Bold',
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset('assets/mark.png', width: 15),
                ],
              ),
            ],
          ),
          const SizedBox(width: 5),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF9E5E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
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
  get images => _images;

  //상단 스와이프 이미지

  final textEditingController = TextEditingController(); //태그 입력
  final controller = TextEditingController(); //매장 이름
  final controller2 = TextEditingController(); //내용

  //컨트롤러

  varInit() {
    values = <String>[];
    selectedValue = "지역";
    selectedValue2 = "카테고리";
    files = <File>[];
    fileNames = <String>[];
    compressedFiles = <File>[];
    compressedSmallFiles = <File>[];
    controller.clear();
    controller2.clear();
    address = "";
  }

  final _values = <String>[].obs;
  List<String> get values => _values;
  set values(val) => _values.value = val;

  final FocusNode _focusNode = FocusNode();
  get focusNode => _focusNode;

  valueDelete(index) {
    values.removeAt(index);
    _values.refresh();
  }

  onSubmit(outstandingValue) {
    if (outstandingValue != "") {
      values.add(outstandingValue);
    }
    _values.refresh();
  }

  onTagChanged(newValue) {
    if (newValue != "") {
      values.add(newValue);
    }
    _values.refresh();
  }
  //태그 관리

  final _selectedValue = "지역".obs;
  get selectedValue => _selectedValue.value;
  set selectedValue(val) => _selectedValue.value = val;

  List<String> items = [
    '지역',
    '하남',
    '강동',
    '송파',
  ];
  //지역

  final _selectedValue2 = "카테고리".obs;
  get selectedValue2 => _selectedValue2.value;
  set selectedValue2(val) => _selectedValue2.value = val;

  List<String> items2 = [
    '카테고리',
    '카페',
    '맛집',
    '헤어샵',
    '네일샵',
    '도서',
    '공방',
  ];
  //카테고리

  final _files = <File>[].obs;
  List<File> get files => _files;
  set files(val) => _files.value = val;

  final _fileNames = <String>[].obs;
  List<String> get fileNames => _fileNames;
  set fileNames(val) => _fileNames.value = val;

  final _compressedFiles = <File>[].obs;
  List<File> get compressedFiles => _compressedFiles;
  set compressedFiles(val) => _compressedFiles.value = val;

  final _compressedSmallFiles = <File>[].obs;
  List<File> get compressedSmallFiles => _compressedSmallFiles;
  set compressedSmallFiles(val) => _compressedSmallFiles.value = val;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  getPictures() async {
    getTempDir();
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    if (result != null) {
      files.addAll(result.paths
          .asMap()
          .map((i, path) => MapEntry(i, File(path!)))
          .values
          .toList());
      fileNames.addAll(result.paths
          .asMap()
          .map((key, value) => MapEntry(key, getRandomString() + ".gif"))
          .values
          .toList());

      for (var path in result.paths) {
        compressFile(File(path!), getRandomString()).then((value) {
          compressedFiles.add(value!);
        });
        compressFileSmall(File(path), getRandomString()).then((value) {
          compressedSmallFiles.add(value!);
        });
      }

      if (files.length > 10) {
        files.removeRange(10, files.length);
        fileNames.removeRange(10, fileNames.length);
        compressedFiles.removeRange(10, compressedFiles.length);
        _files.refresh();
        _fileNames.refresh();
        _compressedFiles.refresh();
      }
    } else {
      // User canceled the picker
    }
  }

  removePicture(int index) {
    files.removeAt(index);
    fileNames.removeAt(index);
    compressedFiles.removeAt(index);
    _files.refresh();
    _fileNames.refresh();
    _compressedFiles.refresh();
    print(files);
  }
  //사진 첨부&삭제

  final _address = "".obs;
  get address => _address.value;
  set address(val) => _address.value = val;

  reviewAction() {
    existPlace().then((value) {
      if (value != "") {
        print(value);
        writeReview(value);
      } else {
        writePlace().then((value) {
          if (value != "") {
            writeReview(value);
          }
        });
      }
    });
  }

  //region
  writeReview(String placeId) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse("$kBaseUrl/flu_review_write.php"),
      );
      request.fields['action'] = "WRITE_REVIEW";
      request.fields['userId'] = "331";
      request.fields['review'] = controller2.text;
      request.fields['tagCount'] = values.length.toString();
      request.fields['imageCount'] = files.length.toString();
      request.fields['placeId'] = placeId;

      for (int i = 0; i < values.length; i++) {
        request.fields['tag$i'] = values[i];
      }
      for (int i = 0; i < files.length; i++) {
        request.fields['imageNames$i'] = fileNames[i];
        request.files
            .add(await http.MultipartFile.fromPath("images$i", files[i].path));
        request.files.add(await http.MultipartFile.fromPath(
            "compressedImages$i", compressedFiles[i].path));
        request.files.add(await http.MultipartFile.fromPath(
            "smallCompressedImages$i", compressedSmallFiles[i].path));
      }
      print(request.fields);
      print(request.files);
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Review Write Response : ${response.body}");
      if (response.statusCode == 200) {
        if (response.body == "success") {
          Get.back(result: true);
          Get.snackbar("성공", "리뷰를 저장했습니다");
        }
      }
    } catch (e) {
      print(e);
    }
  }
  //리뷰 저장

  Future<String> writePlace() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "WRITE_PLACE";
      map['placeName'] = controller.text;
      map['serviceType'] = selectedValue2;
      map['address'] = address;
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_write.php"), body: map);
      print('Place Write Response : ${response.body}');
      if (200 == response.statusCode) {
        return jsonDecode(response.body);
      } else {
        return "";
      }
    } catch (e) {
      print("exception : $e");
      return "";
    }
  }
  //db에 같은 장소가 저장되있지 않는 경우 장소 저장

  Future<String> existPlace() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "SELECT_PLACE";
      map['placeName'] = controller.text;
      map['address'] = address;
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_write.php"), body: map);
      print('Exists Place Response : ${response.body}');
      if (200 == response.statusCode) {
        if (response.body != "null") {
          return jsonDecode(response.body)['id'];
        } else {
          return "";
        }
      } else {
        return "";
      }
    } catch (e) {
      print("exception : $e");
      return "";
    }
  }
  //db에 같은 장소가 저장되어 있는지 확인

  //endregion
  //리뷰 올리기

  final _searchResult = <SearchModel>[].obs;
  List<SearchModel> get searchResult => _searchResult;
  set searchResult(val) => _searchResult.value = val;

  getSearchAutoCompleteResult() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_HASH";
      final response = await http
          .post(Uri.parse("$kBaseUrl/flu_review_autocomplete.php"), body: map);
      print('Auto Complete Words Response : ${response.body}');
      if (200 == response.statusCode) {
        searchResult = parseResponse(response.body);
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  static List<SearchModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SearchModel>((json) => SearchModel.fromJson(json))
        .toList();
  }
//자동 완성

  final _filePath = "".obs;
  get filePath => _filePath.value;
  set filePath(val) => _filePath.value = val;

  getTempDir() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    filePath = tempPath;
  }

  Future<File?> compressFileSmall(File file, String name) async {
    print("Small CompressFile");
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 70,
      minHeight: 70,
      quality: 60,
    );
    String path = filePath + name;
    print("original : ${file.lengthSync()}");
    print("compress : ${result?.length}");
    final buffer = result!.buffer;

    return File(path).writeAsBytes(
        buffer.asUint8List(result.offsetInBytes, result.lengthInBytes));
  }

  Future<File?> compressFile(File file, String name) async {
    print("CompressFile");
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 160,
      minHeight: 90,
      quality: 60,
    );
    String path = filePath + name;
    print("original : ${file.lengthSync()}");
    print("compress : ${result?.length}");
    final buffer = result!.buffer;

    return File(path).writeAsBytes(
        buffer.asUint8List(result.offsetInBytes, result.lengthInBytes));
  }
}
