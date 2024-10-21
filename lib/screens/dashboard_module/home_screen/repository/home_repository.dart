import 'package:trade_app/screens/dashboard_module/home_screen/model/UserDetailModel.dart';

import '../../../../data/provider/api_provider.dart';

class HomeRepository {
  Future<UserDetailModel> getUserDetail({required String userID}) async {
    var response = await ApiProvider.instance.callGet("users/$userID", queryParameters: {'id': userID});
    print("user detail API response ${response}");
    return UserDetailModel.fromJson(response);
  }

  Future<UserDetailModel> getUserWorkStation({required String userID}) async {
    var response = await ApiProvider.instance.callGet("users/$userID/workstations", queryParameters: {'id': userID});
    print("workstation API response ${response}");
    return UserDetailModel.fromJson(response);
  }
}
