import 'dart:convert';

import 'package:calendar_view/calendar_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:trade_app/screens/dashboard_module/home_screen/repository/home_repository.dart';

import '../../../../core/common/app_preferences.dart';
import '../../../../utils/app_string.dart';
import '../../../login_screen/model/login_model.dart';
import '../model/ProjectEstimateActiveListModel.dart';
import '../model/ProjectEstimateDraftListModel.dart';
import '../model/UserDetailModel.dart';
import '../model/UserWorkStationModel.dart';
import '../model/UsersStatusModel.dart';
import '../model/WorkStationTeamMemberModel.dart';
import '../model/workstation_tradenetwork_model.dart';

DateTime get _now => DateTime.now();

class HomeController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  LoginModel loginData = LoginModel();
  Rx<bool> addBusinessAddress = RxBool(false);
  RxList<UserWorkStationModel> userWorkStationList = RxList();
  Rxn<UserWorkStationModel> workStationData = Rxn<UserWorkStationModel>();
  RxList<UserWorkStationModel> userProjectRating = RxList();
  RxList<WorkStationTradeNetworkModel> workStationTradeNetworkList = RxList();
  RxList<WorkStationTeamMemberModel> workStationTeamMemberList = RxList();
  RxList<ProjectEstimateActiveListModel> projectEstimateActiveList = RxList();
  RxList<ProjectEstimateDraftListModel> projectEstimateDraftList = RxList();
  RxList<ProjectEstimateActiveListModel> projectEstimateRejectedList = RxList();

  RxInt jobInProgress = RxInt(0);
  RxInt jobNotStarted = RxInt(0);
  RxInt jobEstimateSent = RxInt(0);
  RxInt jobRejected = RxInt(0);
  RxInt jobDraftJob = RxInt(0);
  RxInt jobCompleted = RxInt(0);

  RxBool workStationFlowStep1 = RxBool(false);
  RxBool workStationFlowStep2 = RxBool(false);
  RxBool workStationFlowStep3 = RxBool(false);
  RxBool workStationFlowStep4 = RxBool(false);
  RxBool workStationFlowStep5 = RxBool(false);
  Rxn<UsersStatusModel> usersStatus = Rxn<UsersStatusModel>();

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

  Rxn<UserDetailModel> userDetailModel = Rxn<UserDetailModel>();

  @override
  void onInit() async {
    super.onInit();

    loginData = LoginModel.fromJson(jsonDecode(AppPreference.instance.getString(AppString.prefKeyUserLoginData)));
    AppPreference.instance.setString(loginData.idToken ?? "", AppString.prefKeyToken);

    userDetailModel.value = await _homeRepository.getUserDetail(userID: loginData.user?.id.toString() ?? "");
    await checkAddBussinessAddress();
    print("user detail ${userDetailModel.toJson()}");
    userWorkStationList.value = await _homeRepository.getUserWorkStation(userID: loginData.user?.id.toString() ?? "");
    workStationData.value = userWorkStationList.where((e) => e.status == 'active').first;
    userProjectRating.value = await _homeRepository.getWorkStationProjectRating(type: "property-owner");
    print("----------------------------");
    print("work station id is ${workStationData.value!.id}");
    workStationTradeNetworkList.value = await _homeRepository.getWorkStationTradeNetwork(workstationID: workStationData.value!.id.toString());
    workStationTeamMemberList.value = await _homeRepository.getAllWorkStationMember(userId: loginData.user?.id.toString() ?? "");

    projectEstimateActiveList.value = await _homeRepository.getProjectEstimateActiveList();
    projectEstimateDraftList.value = await _homeRepository.getProjectEstimateDraftList();
    projectEstimateRejectedList.value = await _homeRepository.getProjectEstimateRejectedList();

    usersStatus.value = await _homeRepository.getTradePassportItemStatus(userID: loginData.user?.id.toString() ?? "");

    jobInProgress.value = projectEstimateActiveList.where((e) => e.projectJobStatus?.id == '5').length;
    jobNotStarted.value = projectEstimateActiveList.where((e) => e.projectJobStatus?.id == '2').length;
    jobEstimateSent.value = projectEstimateActiveList.where((e) => e.projectJobStatus?.id == '0').length;
    jobRejected.value = projectEstimateRejectedList.length;
    jobDraftJob.value = projectEstimateDraftList.length;
    jobCompleted.value = projectEstimateActiveList.where((e) => e.projectJobStatus?.id == '6').length;

    if (workStationData.value?.name == "Default") {
      workStationFlowStep1.value = false;
    } else {
      workStationFlowStep1.value = true;
    }

    if (addBusinessAddress.value) {
      workStationFlowStep2.value = false;
    } else {
      workStationFlowStep2.value = true;
    }

    if (userDetailModel.value?.userKYCVerificationStatus == "1" || userDetailModel.value?.userKYCVerificationStatus == "2") {
      workStationFlowStep3.value = true;
    } else {
      workStationFlowStep3.value = false;
    }

    if (usersStatus.value?.forms?.certification == "1" || usersStatus.value?.forms?.certification == "2") {
      workStationFlowStep4.value = true;
    } else {
      workStationFlowStep4.value = false;
    }

    if (workStationFlowStep4.value || workStationFlowStep2.value) {
      workStationFlowStep5.value = true;
    } else {
      workStationFlowStep5.value = false;
    }
  }

  Future<void> checkAddBussinessAddress() async {
    if ((userDetailModel.value?.userBusinessDetails?.type == "soletrader") && (userDetailModel.value?.userBusinessDetails?.residencyPostcode == null)) {
      addBusinessAddress.value = true;
    } else if ((userDetailModel.value?.userBusinessDetails?.type == "limited") && (userDetailModel.value?.userBusinessDetails?.businessPostcode == null)) {
      addBusinessAddress.value = true;
    }
  }
}
