class WorkStationTeamMemberModel {
  String? email;
  String? tags;
  bool? isWorkStationAdmin;
  String? invitationStatus;
  String? role;
  String? status;
  UserWorkstation? userWorkstation;
  User? toUser;
  String? userName;
  int? toUserId;

  WorkStationTeamMemberModel({this.email, this.tags, this.isWorkStationAdmin, this.invitationStatus, this.role, this.status, this.userWorkstation, this.toUser, this.userName, this.toUserId});

  WorkStationTeamMemberModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    tags = json['tags'];
    isWorkStationAdmin = json['isWorkStationAdmin'];
    invitationStatus = json['invitationStatus'];
    role = json['role'];
    status = json['status'];
    userWorkstation = json['userWorkstation'] != null ? new UserWorkstation.fromJson(json['userWorkstation']) : null;
    toUser = json['toUser'] != null ? new User.fromJson(json['toUser']) : null;
    userName = json['userName'];
    toUserId = json['toUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['tags'] = this.tags;
    data['isWorkStationAdmin'] = this.isWorkStationAdmin;
    data['invitationStatus'] = this.invitationStatus;
    data['role'] = this.role;
    data['status'] = this.status;
    if (this.userWorkstation != null) {
      data['userWorkstation'] = this.userWorkstation!.toJson();
    }
    if (this.toUser != null) {
      data['toUser'] = this.toUser!.toJson();
    }
    data['userName'] = this.userName;
    data['toUserId'] = this.toUserId;
    return data;
  }
}

class UserWorkstation {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  String? status;
  String? subStatus;
  String? subscription;
  String? threeMonthSubscription;
  String? documentSubscription;
  String? membersSubscription;
  int? maxMemberLimit;
  int? seatsUsed;
  String? verificationStatus;
  String? submittedInformationAt;
  String? description;
  String? profileImage;
  String? experience;
  bool? isAvailable;
  bool? isShowTradeNetwork;
  String? emergencyCallOutFee;
  String? videoConsulationFee;
  String? emergencyCallOutFeeType;
  String? emergencyCallOutRate;
  String? workstationVerificationType;
  bool? isWsFreezed;
  User? user;

  UserWorkstation(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.name,
      this.status,
      this.subStatus,
      this.subscription,
      this.threeMonthSubscription,
      this.documentSubscription,
      this.membersSubscription,
      this.maxMemberLimit,
      this.seatsUsed,
      this.verificationStatus,
      this.submittedInformationAt,
      this.description,
      this.profileImage,
      this.experience,
      this.isAvailable,
      this.isShowTradeNetwork,
      this.emergencyCallOutFee,
      this.videoConsulationFee,
      this.emergencyCallOutFeeType,
      this.emergencyCallOutRate,
      this.workstationVerificationType,
      this.isWsFreezed,
      this.user});

  UserWorkstation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    name = json['name'];
    status = json['status'];
    subStatus = json['subStatus'];
    subscription = json['subscription'];
    threeMonthSubscription = json['threeMonthSubscription'];
    documentSubscription = json['documentSubscription'];
    membersSubscription = json['membersSubscription'];
    maxMemberLimit = json['maxMemberLimit'];
    seatsUsed = json['seatsUsed'];
    verificationStatus = json['verificationStatus'];
    submittedInformationAt = json['submittedInformationAt'];
    description = json['description'];
    profileImage = json['profileImage'];
    experience = json['experience'];
    isAvailable = json['isAvailable'];
    isShowTradeNetwork = json['isShowTradeNetwork'];
    emergencyCallOutFee = json['emergencyCallOutFee'];
    videoConsulationFee = json['videoConsulationFee'];
    emergencyCallOutFeeType = json['emergencyCallOutFeeType'];
    emergencyCallOutRate = json['emergencyCallOutRate'];
    workstationVerificationType = json['workstationVerificationType'];
    isWsFreezed = json['isWsFreezed'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['name'] = this.name;
    data['status'] = this.status;
    data['subStatus'] = this.subStatus;
    data['subscription'] = this.subscription;
    data['threeMonthSubscription'] = this.threeMonthSubscription;
    data['documentSubscription'] = this.documentSubscription;
    data['membersSubscription'] = this.membersSubscription;
    data['maxMemberLimit'] = this.maxMemberLimit;
    data['seatsUsed'] = this.seatsUsed;
    data['verificationStatus'] = this.verificationStatus;
    data['submittedInformationAt'] = this.submittedInformationAt;
    data['description'] = this.description;
    data['profileImage'] = this.profileImage;
    data['experience'] = this.experience;
    data['isAvailable'] = this.isAvailable;
    data['isShowTradeNetwork'] = this.isShowTradeNetwork;
    data['emergencyCallOutFee'] = this.emergencyCallOutFee;
    data['videoConsulationFee'] = this.videoConsulationFee;
    data['emergencyCallOutFeeType'] = this.emergencyCallOutFeeType;
    data['emergencyCallOutRate'] = this.emergencyCallOutRate;
    data['workstationVerificationType'] = this.workstationVerificationType;
    data['isWsFreezed'] = this.isWsFreezed;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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
  UserPublicProfile? userPublicProfile;
  Role? role;

  User(
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
      this.userPublicProfile,
      this.role});

  User.fromJson(Map<String, dynamic> json) {
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
    userPublicProfile = json['userPublicProfile'] != null ? new UserPublicProfile.fromJson(json['userPublicProfile']) : null;
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
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
    if (this.userPublicProfile != null) {
      data['userPublicProfile'] = this.userPublicProfile!.toJson();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
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
