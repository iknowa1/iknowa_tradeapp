import '../../../../data/provider/api_provider.dart';
import '../model/registration_model.dart';

class RegistrationRepository {
  Future<RegistrationModel> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required bool tcOption,
    required bool marketingOption,
  }) async {
    var response = await ApiProvider.instance.callPost("auth/register/",
        params: {"firstName": firstName, "lastName": lastName, "password": password, "confirmPassword": password, "email": email, "marketingOptIn": marketingOption, "tcOptIn": tcOption});
    print("internal response $response");
    return RegistrationModel.fromJson(response);
  }
}
