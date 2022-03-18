import 'model/category_model.dart';

class CategoryData {
  Map<String, Map<String, String>> categories = {
    "하남": {
      "카페": "하남_카페.jpg",
      "맛집": "하남_맛집.jpg",
      "헤어샵": "하남_헤어샵.jpg",
      "네일샵": "하남_네일샵.jpg",
      "전자제품": "하남_전자제품.jpg",
      "도서": "하남_도서.jpg",
      "공방": "하남_공방.jpg",
    },
    "강동": {
      "카페": "강동_카페.jpg",
      "맛집": "강동_맛집.jpg",
      "헤어샵": "강동_헤어샵.jpg",
      "네일샵": "강동_네일샵.jpg",
      "전자제품": "강동_전자제품.jpg",
      "도서": "강동_도서.jpg",
      "공방": "강동_공방.jpg",
    },
    "송파": {
      "카페": "송파_카페.jpg",
      "맛집": "송파_맛집.jpg",
      "헤어샵": "송파_헤어샵.jpg",
      "네일샵": "송파_네일샵.jpg",
      "전자제품": "송파_전자제품.jpg",
      "도서": "송파_도서.jpg",
      "공방": "송파_공방.jpg",
    },
  };

  List<CategoryModel> allCategory() {
    return CategoryData()
        .categories
        .entries
        .map((e) => e.value.entries
            .map((e2) =>
                CategoryModel(area: e.key, service: e2.key, image: e2.value))
            .toList())
        .toList()
        .expand((element) => element)
        .toList();
  }

  List<CategoryModel> selectCategory(
      List<String> areas, List<String> services) {
    List<CategoryModel> result = [];
    for (var area in areas) {
      for (var service in services) {
        result.add(CategoryModel(
            area: area, service: service, image: categories[area]![service]!));
      }
    }
    return result;
  }
}
