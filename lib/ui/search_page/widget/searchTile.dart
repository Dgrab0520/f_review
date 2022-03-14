import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/search_page_controller.dart';

class SearchTile extends StatelessWidget {
  SearchTile({Key? key, required this.index}) : super(key: key);

  final int index;
  final searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            searchPageController.onTapAction(index);
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  AssetImage(searchPageController.searchType == "tag"
                      ? 'assets/sharp.png'
                      : searchPageController.searchType == "place"
                          ? 'assets/map.png'
                          : 'assets/avatar.png'),
            ),
            title: Text(searchPageController.searchType == "tag"
                ? '#${searchPageController.searchResult[index].name}'
                : searchPageController.searchResult[index].name),
            subtitle: Text(searchPageController.getSubTitle(index)),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
        const Divider(
          height: 1.0,
          indent: 1.0,
        ),
      ],
    );
  }
}
