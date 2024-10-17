import '../../../../data/provider/api_provider.dart';

class ForgotPasswordRepository {
  Future<bool> sendEmailOTP({
    required String email,
  }) async {
    var response = await ApiProvider.instance.callStringPost("forgot-password/reset", params: {"email": email});
    print("internal response $response");
    return response;
  }
}
