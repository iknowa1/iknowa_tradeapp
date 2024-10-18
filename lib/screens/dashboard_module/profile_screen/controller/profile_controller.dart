import 'package:get/get.dart';
import 'package:trade_app/screens/dashboard_module/profile_screen/model/profile_option_model.dart';
import 'package:trade_app/utils/imagepath.dart';

class ProfileController extends GetxController {
  RxString profilUrl = RxString("");
  var items = <ProfileOptionModel>[].obs;

  @override
  void onInit() async {
    super.onInit();

    profilUrl.value = "https://images.unsplash.com/photo-1532264523420-881a47db012d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9";

    items.addAll([
      ProfileOptionModel(title: "Trade network", svgIconPath: ImagePath.profileTradenetwork),
      ProfileOptionModel(title: "Calendar", svgIconPath: ImagePath.profileCalendar),
      ProfileOptionModel(title: "Documents", svgIconPath: ImagePath.profileDocument),
      ProfileOptionModel(title: "Courses", svgIconPath: ImagePath.profileCourses),
      ProfileOptionModel(title: "Clients", svgIconPath: ImagePath.profileClients),
      ProfileOptionModel(title: "Analytics", svgIconPath: ImagePath.profileAnalytics),
      ProfileOptionModel(title: "Settings", svgIconPath: ImagePath.profileSettings),
    ]);
  }
}
