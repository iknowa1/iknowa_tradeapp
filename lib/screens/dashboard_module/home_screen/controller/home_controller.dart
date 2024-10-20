import 'dart:convert';

import 'package:calendar_view/calendar_view.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/repository/home_repository.dart';

import '../../../../core/common/app_preferences.dart';
import '../../../../utils/app_string.dart';
import '../../../login_screen/model/login_model.dart';

DateTime get _now => DateTime.now();

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  LoginModel loginData = LoginModel();

  List<CalendarEventData> events = [
    CalendarEventData(
      date: _now,
      title: "Project meeting",
      description: "Today is project meeting.",
      startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
      endTime: DateTime(_now.year, _now.month, _now.day, 22),
    ),
    CalendarEventData(
      date: _now.add(Duration(days: 1)),
      startTime: DateTime(_now.year, _now.month, _now.day, 18),
      endTime: DateTime(_now.year, _now.month, _now.day, 19),
      title: "Wedding anniversary",
      description: "Attend uncle's wedding anniversary.",
    ),
    CalendarEventData(
      date: _now,
      startTime: DateTime(_now.year, _now.month, _now.day, 14),
      endTime: DateTime(_now.year, _now.month, _now.day, 17),
      title: "Football Tournament",
      description: "Go to football tournament.",
    ),
    CalendarEventData(
      date: _now.add(Duration(days: 3)),
      startTime: DateTime(_now.add(Duration(days: 3)).year, _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
      endTime: DateTime(_now.add(Duration(days: 3)).year, _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
      title: "Sprint Meeting.",
      description: "Last day of project submission for last year.",
    ),
    CalendarEventData(
      date: _now.subtract(Duration(days: 2)),
      startTime: DateTime(_now.subtract(Duration(days: 2)).year, _now.subtract(Duration(days: 2)).month, _now.subtract(Duration(days: 2)).day, 14),
      endTime: DateTime(_now.subtract(Duration(days: 2)).year, _now.subtract(Duration(days: 2)).month, _now.subtract(Duration(days: 2)).day, 16),
      title: "Team Meeting",
      description: "Team Meeting",
    ),
    CalendarEventData(
      date: _now.subtract(Duration(days: 2)),
      startTime: DateTime(_now.subtract(Duration(days: 2)).year, _now.subtract(Duration(days: 2)).month, _now.subtract(Duration(days: 2)).day, 10),
      endTime: DateTime(_now.subtract(Duration(days: 2)).year, _now.subtract(Duration(days: 2)).month, _now.subtract(Duration(days: 2)).day, 12),
      title: "Chemistry Viva",
      description: "Today is Joe's birthday.",
    ),
  ];

  @override
  void onInit() async {
    super.onInit();

    loginData = LoginModel.fromJson(jsonDecode(AppPreference.instance.getString(AppString.prefKeyUserLoginData)));
    AppPreference.instance.setString(loginData.idToken ?? "", AppString.prefKeyToken);

    _homeRepository.getUserDetail(userID: loginData.user?.id.toString() ?? "");
    _homeRepository.getUserWorkStation(userID: loginData.user?.id.toString() ?? "");
  }
}
