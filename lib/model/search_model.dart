import 'package:flutter/material.dart';

class SearchModel {
  const SearchModel({
    required this.type,
    required this.name,
    required this.subTitle,
  });

  final String type;
  final String name;
  final String subTitle;

  @override
  String toString() {
    return '$name, $subTitle';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is SearchModel &&
        other.name == name &&
        other.subTitle == subTitle;
  }

  @override
  int get hashCode => hashValues(subTitle, name);
}
