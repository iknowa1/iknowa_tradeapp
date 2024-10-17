import '../../../../data/provider/api_provider.dart';
import '../model/email_verificartion_model.dart';

class EmailVerifyRepository {
  Future<EmailVerifyModel> emailVerify({
    required String email,
    required String otp,
  }) async {
    var response = await ApiProvider.instance.callPost("auth/verify", params: {"email": email, "code": otp});
    print("internal response $response");
    return EmailVerifyModel.fromJson(response);
  }

  Future<bool> sendEmailOTP({
    required String email,
  }) async {
    var response = await ApiProvider.instance.callStringPost("auth/verify/resend", params: {"email": email});
    print("internal response $response");
    return response;
  }
}
