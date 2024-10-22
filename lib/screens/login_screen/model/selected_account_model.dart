class SelectedAccountModel {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? birthDate;
  String? postcode;
  bool? active;
  bool? hasChosenRole;
  bool? hasAccountSetup;
  bool? hasBusinessType;
  String? accountSetupCache;
  bool? verifiedEmail;
  String? userVerificationStatus;
  String? gender;
  String? userKYCVerificationStatus;
  String? contactNo;
  String? address;
  bool? tcOptIn;
  bool? marketingOptIn;
  String? latitude;
  String? longitude;
  int? referralCode;
  String? referredCode;
  String? tpProfileSubscription;
  String? lastLoginAt;
  int? loginAttempt;
  Role? role;
  UserIdentification? userIdentification;
  UserPublicProfile? userPublicProfile;

  SelectedAccountModel(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.birthDate,
      this.postcode,
      this.active,
      this.hasChosenRole,
      this.hasAccountSetup,
      this.hasBusinessType,
      this.accountSetupCache,
      this.verifiedEmail,
      this.userVerificationStatus,
      this.gender,
      this.userKYCVerificationStatus,
      this.contactNo,
      this.address,
      this.tcOptIn,
      this.marketingOptIn,
      this.latitude,
      this.longitude,
      this.referralCode,
      this.referredCode,
      this.tpProfileSubscription,
      this.lastLoginAt,
      this.loginAttempt,
      this.role,
      this.userIdentification,
      this.userPublicProfile});

  SelectedAccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    birthDate = json['birthDate'];
    postcode = json['postcode'];
    active = json['active'];
    hasChosenRole = json['hasChosenRole'];
    hasAccountSetup = json['hasAccountSetup'];
    hasBusinessType = json['hasBusinessType'];
    accountSetupCache = json['accountSetupCache'];
    verifiedEmail = json['verifiedEmail'];
    userVerificationStatus = json['userVerificationStatus'];
    gender = json['gender'];
    userKYCVerificationStatus = json['userKYCVerificationStatus'];
    contactNo = json['contactNo'];
    address = json['address'];
    tcOptIn = json['tcOptIn'];
    marketingOptIn = json['marketingOptIn'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    referralCode = json['referralCode'];
    referredCode = json['referredCode'];
    tpProfileSubscription = json['tpProfileSubscription'];
    lastLoginAt = json['lastLoginAt'];
    loginAttempt = json['loginAttempt'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    userIdentification = json['userIdentification'] != null ? new UserIdentification.fromJson(json['userIdentification']) : null;
    userPublicProfile = json['userPublicProfile'] != null ? new UserPublicProfile.fromJson(json['userPublicProfile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birthDate'] = this.birthDate;
    data['postcode'] = this.postcode;
    data['active'] = this.active;
    data['hasChosenRole'] = this.hasChosenRole;
    data['hasAccountSetup'] = this.hasAccountSetup;
    data['hasBusinessType'] = this.hasBusinessType;
    data['accountSetupCache'] = this.accountSetupCache;
    data['verifiedEmail'] = this.verifiedEmail;
    data['userVerificationStatus'] = this.userVerificationStatus;
    data['gender'] = this.gender;
    data['userKYCVerificationStatus'] = this.userKYCVerificationStatus;
    data['contactNo'] = this.contactNo;
    data['address'] = this.address;
    data['tcOptIn'] = this.tcOptIn;
    data['marketingOptIn'] = this.marketingOptIn;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['referralCode'] = this.referralCode;
    data['referredCode'] = this.referredCode;
    data['tpProfileSubscription'] = this.tpProfileSubscription;
    data['lastLoginAt'] = this.lastLoginAt;
    data['loginAttempt'] = this.loginAttempt;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.userIdentification != null) {
      data['userIdentification'] = this.userIdentification!.toJson();
    }
    if (this.userPublicProfile != null) {
      data['userPublicProfile'] = this.userPublicProfile!.toJson();
    }
    return data;
  }
}

class Role {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;

  Role({this.id, this.dateCreated, this.dateUpdated, this.name});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['name'] = this.name;
    return data;
  }
}

class UserIdentification {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? transactionReference;
  String? scanReference;
  String? timestamp;
  String? document;
  String? verification;
  String? type;
  String? userVerificationStatus;

  UserIdentification(
      {this.id, this.dateCreated, this.dateUpdated, this.transactionReference, this.scanReference, this.timestamp, this.document, this.verification, this.type, this.userVerificationStatus});

  UserIdentification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    transactionReference = json['transactionReference'];
    scanReference = json['scanReference'];
    timestamp = json['timestamp'];
    document = json['document'];
    verification = json['verification'];
    type = json['type'];
    userVerificationStatus = json['userVerificationStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['transactionReference'] = this.transactionReference;
    data['scanReference'] = this.scanReference;
    data['timestamp'] = this.timestamp;
    data['document'] = this.document;
    data['verification'] = this.verification;
    data['type'] = this.type;
    data['userVerificationStatus'] = this.userVerificationStatus;
    return data;
  }
}

class UserPublicProfile {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  String? description;
  String? profileImage;
  String? profileBanner;
  String? userVerificationStatus;

  UserPublicProfile({this.id, this.dateCreated, this.dateUpdated, this.name, this.description, this.profileImage, this.profileBanner, this.userVerificationStatus});

  UserPublicProfile.fromJson(Map<String, dynamic> json) {
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
