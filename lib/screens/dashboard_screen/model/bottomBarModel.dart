import 'dart:ffi';

class BottomBarModel {
  String imagePath;
  String itemName;
  bool isItem;
  int index;

  BottomBarModel({required this.imagePath, required this.itemName, this.isItem = true, required this.index});
}
