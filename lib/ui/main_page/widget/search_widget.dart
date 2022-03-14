import 'package:f_review/controller/main_page_controller.dart';
import 'package:f_review/model/search_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../search_page/search_page.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);

  static String _displayStringForOption(SearchModel option) => option.name;
  final mainPageController = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    return Autocomplete<SearchModel>(
        displayStringForOption: _displayStringForOption,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<SearchModel>.empty();
          }
          return mainPageController.searchResult.where((SearchModel option) {
            return option
                .toString()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (SearchModel selection) {
          debugPrint('You just selected ${_displayStringForOption(selection)}');
        },
        optionsViewBuilder: (context, onSelected, options) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 600.0),
            child: Material(
              elevation: 15,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        print("click");
                        Get.to(SearchPage(
                          keyword: options.elementAt(index).name,
                          type: options.elementAt(index).type,
                        ));
                      },
                      child: ListTile(
                        leading: Image.asset(
                          options.elementAt(index).type == "tag"
                              ? 'assets/sharp.png'
                              : options.elementAt(index).type == "place"
                                  ? 'assets/map.png'
                                  : 'assets/avatar.png',
                          width: 25,
                        ),
                        horizontalTitleGap: 0,
                        title: Text(options.elementAt(index).name),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: options.length),
            ),
          );
        },
        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
          return Container(
            padding: const EdgeInsets.only(left: 20, right: 5, bottom: 5),
            width: Get.width,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFdbdbdb).withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(2, 4), // changes position of shadow
                ),
              ],
            ),
            child: TextField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                onChanged: (text) {
                  mainPageController.controller.text = text;
                },
                decoration: const InputDecoration(
                  hintText: '원하는 내용을 검색해보세요',
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
          );
        });
  }
}
