import 'dart:io';
import 'package:mime/mime.dart';
import 'package:trade_app/screens/Registration_module/add_profile_picture_screen/model/profile_picture_upload_model.dart';
import '../../../../data/provider/api_provider.dart';
import '../model/save_profile_picture_model.dart';

class AddProfilePictureRespository {
  Future<ProfilePictureUploadModel> uploadImage({required File profileFile, required String token}) async {
    String? mimeType = lookupMimeType(profileFile.path);
    var response = await ApiProvider.instance.callPostMultiPartDio("upload", {}, {"file": profileFile}, mimeType ?? "", token);
    print("internal response $response");
    return ProfilePictureUploadModel.fromJson(response);
  }

  Future<SaveProfilePictureModel> saveProfilePicture({
    required String userId,
    required String profileUrl,
  }) async {
    var response = await ApiProvider.instance.callPost("users/$userId/public-profile", params: {"profileImage": profileUrl});
    print("internal response $response");
    return SaveProfilePictureModel.fromJson(response);
  }
}
