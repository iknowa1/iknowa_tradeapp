import '../../../core/common/app_preferences.dart';
import '../../../data/provider/api_provider.dart';
import '../model/login_model.dart';

class LoginRepository {
  Future<LoginModel> login({required String email, required String password}) async {
    var response = await ApiProvider.instance.callPost("auth/login", params: {"username": email, "password": password});
    print("Login API  internal response ${response}");
    return LoginModel.fromJson(response);
  }

  Future<void> getCurrentUser() async {
    var response = await ApiProvider.instance.callGet("users/me");
  }

  Future<bool> forgotPassword({required String email}) async {
    var response = await ApiProvider.instance.callPost("auth/forgot-password", params: {"email": email});
    return response["data"]["success"];
  }

  Future<bool> logOutUser() async {
    var response = await ApiProvider.instance.callPost("auth/logout");
    if (response["data"]["success"]) {
      AppPreference.instance.clearPreference();
    }
    return response["data"]["success"];
  }
}
