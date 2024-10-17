class SaveProfilePictureModel {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  String? description;
  String? profileImage;
  String? profileBanner;
  String? userVerificationStatus;

  SaveProfilePictureModel({this.id, this.dateCreated, this.dateUpdated, this.name, this.description, this.profileImage, this.profileBanner, this.userVerificationStatus});

  SaveProfilePictureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    name = json['name'];
    description = json['description'];
    profileImage = json['profileImage'];
    profileBanner = json['profileBanner'];
    userVerificationStatus = json['userVerificationStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['name'] = this.name;
    data['description'] = this.description;
    data['profileImage'] = this.profileImage;
    data['profileBanner'] = this.profileBanner;
    data['userVerificationStatus'] = this.userVerificationStatus;
    return data;
  }
}
