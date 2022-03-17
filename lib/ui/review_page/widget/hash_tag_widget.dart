import 'package:f_review/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:material_tag_editor/tag_editor.dart';
import 'package:numeral/numeral.dart';

import '../../../controller/review_page_controller.dart';

class HashTagWidget extends StatelessWidget {
  HashTagWidget({Key? key}) : super(key: key);

  static String _displayStringForOption(SearchModel option) => option.name;
  final reviewPageController = Get.put(ReviewPageController());

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<SearchModel>(
        displayStringForOption: _displayStringForOption,
        textEditingController: reviewPageController.textEditingController,
        focusNode: reviewPageController.focusNode,
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<SearchModel>.empty();
          }
          return reviewPageController.searchResult.where((SearchModel option) {
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
            padding: const EdgeInsets.only(bottom: 500.0),
            child: Material(
              elevation: 15,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        reviewPageController
                            .onSubmit(options.elementAt(index).name);
                        reviewPageController.textEditingController.clear();
                      },
                      child: ListTile(
                        leading: Image.asset(
                          'assets/sharp.png',
                          width: 20,
                        ),
                        horizontalTitleGap: 0,
                        title: Text(options.elementAt(index).name),
                        subtitle: Text(
                            "게시물 ${Numeral(int.parse(options.elementAt(index).subTitle)).value()}"),
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
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(() => TagEditor(
                  length: reviewPageController.values.length,
                  controller: controller,
                  focusNode: focusNode,
                  delimiters: const [',', ' ', ' ', ' '],
                  hasAddButton: false,
                  resetTextOnSubmitted: true,
                  textStyle: const TextStyle(color: Color(0xFF2a2a2a)),
                  onSubmitted: (outstandingValue) {
                    reviewPageController.onSubmit(outstandingValue);
                  },
                  inputDecoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '태그 입력...',
                    hintStyle: TextStyle(
                      color: Color(
                        0xFF888888,
                      ),
                      fontFamily: 'family: NotoSansKR-Regular',
                      fontSize: 13,
                    ),
                  ),
                  onTagChanged: (newValue) {
                    reviewPageController.onTagChanged(newValue);
                  },

                  tagBuilder: (context, index) => _Chip(
                    index: index,
                    label: reviewPageController.values[index],
                    onDeleted: (index) {
                      reviewPageController.valueDelete(index);
                    },
                  ),
                  // InputFormatters example, this disallow \ and /
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[/\\]'))
                  ],
                )),
          );
        });
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFFEAE5F9),
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text("#$label"),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}
