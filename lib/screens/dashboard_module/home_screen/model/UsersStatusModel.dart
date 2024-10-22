class UsersStatusModel {
  int? userId;
  Forms? forms;
  bool? canBeRejected;
  bool? canBeVerified;

  UsersStatusModel({this.userId, this.forms, this.canBeRejected, this.canBeVerified});

  UsersStatusModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    forms = json['forms'] != null ? new Forms.fromJson(json['forms']) : null;
    canBeRejected = json['canBeRejected'];
    canBeVerified = json['canBeVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.forms != null) {
      data['forms'] = this.forms!.toJson();
    }
    data['canBeRejected'] = this.canBeRejected;
    data['canBeVerified'] = this.canBeVerified;
    return data;
  }
}

class Forms {
  String? publicProfile;
  String? businessDetails;
  String? identificationCheck;
  String? certification;
  String? insurance;
  String? skills;

  Forms({this.publicProfile, this.businessDetails, this.identificationCheck, this.certification, this.insurance, this.skills});

  Forms.fromJson(Map<String, dynamic> json) {
    publicProfile = json['public_profile'];
    businessDetails = json['business_details'];
    identificationCheck = json['identification_check'];
    certification = json['certification'];
    insurance = json['insurance'];
    skills = json['skills'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['public_profile'] = this.publicProfile;
    data['business_details'] = this.businessDetails;
    data['identification_check'] = this.identificationCheck;
    data['certification'] = this.certification;
    data['insurance'] = this.insurance;
    data['skills'] = this.skills;
    return data;
  }
}
