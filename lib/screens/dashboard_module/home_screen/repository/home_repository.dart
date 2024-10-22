import 'dart:convert';

import 'package:trade_app/screens/dashboard_module/home_screen/model/UserDetailModel.dart';

import '../../../../data/provider/api_provider.dart';
import '../model/ProjectEstimateActiveListModel.dart';
import '../model/ProjectEstimateDraftListModel.dart';
import '../model/UserWorkStationModel.dart';
import '../model/UsersStatusModel.dart';
import '../model/WorkStationTeamMemberModel.dart';
import '../model/workstation_tradenetwork_model.dart';

class HomeRepository {
  Future<UserDetailModel> getUserDetail({required String userID}) async {
    var response = await ApiProvider.instance.callGet("users/$userID", queryParameters: {'id': userID});
    print("user detail API response ${response}");
    return UserDetailModel.fromJson(response);
  }

  Future<List<UserWorkStationModel>> getUserWorkStation({required String userID}) async {
    var response = await ApiProvider.instance.callGet("users/$userID/workstations", queryParameters: {'userId': userID});
    print("workstation API response ${response}");

    return List.from(response["data"] ?? []).map((e) => UserWorkStationModel.fromJson(e)).toList();
  }

  Future<List<UserWorkStationModel>> getWorkStationProjectRating({required String type}) async {
    var response = await ApiProvider.instance.callGet("project-rating/$type", queryParameters: {'type': type});
    print("getWorkStationProjectRating API response ${response}");

    return List.from(response["data"] ?? []).map((e) => UserWorkStationModel.fromJson(e)).toList();
  }

  // 'userWorkstationId': workstationID
  Future<List<WorkStationTradeNetworkModel>> getWorkStationTradeNetwork({required String workstationID}) async {
    var response = await ApiProvider.instance.callGet("user/network/connected/$workstationID", queryParameters: {});
    print("workstation member API response ${response}");
    return List.from(response["data"] ?? []).map((e) => WorkStationTradeNetworkModel.fromJson(e)).toList();
  }

  Future<UserDetailModel> getSlitVerificationWorkStationData({required String workstationID}) async {
    var response = await ApiProvider.instance.callGet("silt/verification/$workstationID", queryParameters: {'id': workstationID});
    print("Slit verification workstation member API response ${response}");
    return UserDetailModel.fromJson(response);
  }

  Future<UserDetailModel> getSlitVerificationStatus() async {
    var response = await ApiProvider.instance.callGet("/silt/verification/status", queryParameters: {});
    print("Slit verification status API response ${response}");
    return UserDetailModel.fromJson(response);
  }

  Future<UsersStatusModel> getTradePassportItemStatus({required String userID}) async {
    var response = await ApiProvider.instance.callGet("users/$userID/statuses", queryParameters: {'id': userID});
    print("Slit verification status API response ${response}");
    return UsersStatusModel.fromJson(response);
  }

  Future<List<ProjectEstimateActiveListModel>> getProjectEstimateActiveList() async {
    var response = await ApiProvider.instance.callGet("/project-estimate/active/list", queryParameters: {'order': "ASC"});
    print("getProjectEstimateActiveList API response ${response}");
    return List.from(response["data"] ?? []).map((e) => ProjectEstimateActiveListModel.fromJson(e)).toList();
  }

  Future<List<ProjectEstimateDraftListModel>> getProjectEstimateDraftList() async {
    var response = await ApiProvider.instance.callGet("/project-estimate/draft/list", queryParameters: {'order': "ASC"});
    print("getProjectEstimateDraftList API response ${response}");
    return List.from(response["data"] ?? []).map((e) => ProjectEstimateDraftListModel.fromJson(e)).toList();
  }

  Future<List<ProjectEstimateActiveListModel>> getProjectEstimateRejectedList() async {
    var response = await ApiProvider.instance.callGet("/project-estimate/rejected/list", queryParameters: {'order': "ASC"});
    print("getProjectEstimateActiveList API response ${response}");
    return List.from(response["data"] ?? []).map((e) => ProjectEstimateActiveListModel.fromJson(e)).toList();
  }

  Future<List<WorkStationTeamMemberModel>> getAllWorkStationMember({required String userId}) async {
    var response = await ApiProvider.instance.callGet("user-workstations/$userId/members", queryParameters: {'userId': userId});
    print("getAllWorkStationMember API response ${response}");

    return List.from(response["data"] ?? []).map((e) => WorkStationTeamMemberModel.fromJson(e)).toList();
  }

  Future<UserDetailModel> getUserNetworkConnected({required String workStation}) async {
    var response = await ApiProvider.instance.callGet("user/network/connected/$workStation", queryParameters: {'userWorkstationId': workStation});
    print("getUserNetworkConnected API response ${response}");
    return UserDetailModel.fromJson(response);
  }

  Future<UserDetailModel> getCalendarDataByDate({
    required String userId,
    required String date,
  }) async {
    var response = await ApiProvider.instance.callGet("trader/calendars", queryParameters: {'userId': userId, 'startDate': date, 'endDate': date});
    print("getCalendarDataByDate API response ${response}");
    return UserDetailModel.fromJson(response);
  }
}
