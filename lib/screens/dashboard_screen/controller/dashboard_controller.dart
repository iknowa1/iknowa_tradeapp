import 'package:get/get.dart';

import '../model/bottomBarModel.dart';

class DashboardController extends GetxController {
  List<BottomBarModel> bottomBarModelList = [];
  var currentIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    bottomBarModelList.add(BottomBarModel(imagePath: "assets/images/home_btmbar_icon.svg", itemName: "Home", index: 0));
    bottomBarModelList.add(BottomBarModel(imagePath: "assets/images/trade_passport.svg", itemName: "Trade Passport", index: 1));
    bottomBarModelList.add(BottomBarModel(imagePath: "assets/images/search_btmbar_icon.svg", itemName: "Jobs", index: 2));
    bottomBarModelList.add(BottomBarModel(imagePath: "assets/images/chat_btmbar_icon.svg", itemName: "Chat", index: 3));
    bottomBarModelList.add(BottomBarModel(imagePath: "assets/images/profile.png", itemName: "Account", isItem: false, index: 4));
  }

  void onItemTapped(int index) {
    currentIndex.value = index;
  }
}
