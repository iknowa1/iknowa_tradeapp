class ProfilePictureUploadModel {
  String? publicUrl;
  String? attachment;
  String? originalName;
  int? size;
  String? mime;
  String? src;

  ProfilePictureUploadModel({this.publicUrl, this.attachment, this.originalName, this.size, this.mime, this.src});

  ProfilePictureUploadModel.fromJson(Map<String, dynamic> json) {
    publicUrl = json['publicUrl'];
    attachment = json['attachment'];
    originalName = json['originalName'];
    size = json['size'];
    mime = json['mime'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publicUrl'] = this.publicUrl;
    data['attachment'] = this.attachment;
    data['originalName'] = this.originalName;
    data['size'] = this.size;
    data['mime'] = this.mime;
    data['src'] = this.src;
    return data;
  }
}
