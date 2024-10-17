class RegistrationModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  bool? tcOptIn;
  bool? marketingOptIn;
  String? userVerificationStatus;
  int? referralCode;
  String? gender;
  Role? role;
  String? dateDeleted;
  String? birthDate;
  String? postcode;
  String? accountSetupCache;
  String? contactNo;
  String? address;
  String? latitude;
  String? longitude;
  String? referredCode;
  String? tpProfileSubscription;
  String? lastLoginAt;
  int? id;
  String? dateCreated;
  String? dateUpdated;
  bool? active;
  bool? hasChosenRole;
  bool? hasAccountSetup;
  bool? hasBusinessType;
  bool? verifiedEmail;
  String? userKYCVerificationStatus;
  int? loginAttempt;

  RegistrationModel(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.tcOptIn,
      this.marketingOptIn,
      this.userVerificationStatus,
      this.referralCode,
      this.gender,
      this.role,
      this.dateDeleted,
      this.birthDate,
      this.postcode,
      this.accountSetupCache,
      this.contactNo,
      this.address,
      this.latitude,
      this.longitude,
      this.referredCode,
      this.tpProfileSubscription,
      this.lastLoginAt,
      this.id,
      this.dateCreated,
      this.dateUpdated,
      this.active,
      this.hasChosenRole,
      this.hasAccountSetup,
      this.hasBusinessType,
      this.verifiedEmail,
      this.userKYCVerificationStatus,
      this.loginAttempt});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    tcOptIn = json['tcOptIn'];
    marketingOptIn = json['marketingOptIn'];
    userVerificationStatus = json['userVerificationStatus'];
    referralCode = json['referralCode'];
    gender = json['gender'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    dateDeleted = json['dateDeleted'];
    birthDate = json['birthDate'];
    postcode = json['postcode'];
    accountSetupCache = json['accountSetupCache'];
    contactNo = json['contactNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    referredCode = json['referredCode'];
    tpProfileSubscription = json['tpProfileSubscription'];
    lastLoginAt = json['lastLoginAt'];
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    active = json['active'];
    hasChosenRole = json['hasChosenRole'];
    hasAccountSetup = json['hasAccountSetup'];
    hasBusinessType = json['hasBusinessType'];
    verifiedEmail = json['verifiedEmail'];
    userKYCVerificationStatus = json['userKYCVerificationStatus'];
    loginAttempt = json['loginAttempt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['tcOptIn'] = this.tcOptIn;
    data['marketingOptIn'] = this.marketingOptIn;
    data['userVerificationStatus'] = this.userVerificationStatus;
    data['referralCode'] = this.referralCode;
    data['gender'] = this.gender;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    data['dateDeleted'] = this.dateDeleted;
    data['birthDate'] = this.birthDate;
    data['postcode'] = this.postcode;
    data['accountSetupCache'] = this.accountSetupCache;
    data['contactNo'] = this.contactNo;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['referredCode'] = this.referredCode;
    data['tpProfileSubscription'] = this.tpProfileSubscription;
    data['lastLoginAt'] = this.lastLoginAt;
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['active'] = this.active;
    data['hasChosenRole'] = this.hasChosenRole;
    data['hasAccountSetup'] = this.hasAccountSetup;
    data['hasBusinessType'] = this.hasBusinessType;
    data['verifiedEmail'] = this.verifiedEmail;
    data['userKYCVerificationStatus'] = this.userKYCVerificationStatus;
    data['loginAttempt'] = this.loginAttempt;
    return data;
  }
}

class Role {
  int? id;

  Role({this.id});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
