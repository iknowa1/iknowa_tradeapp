class UserWorkStationModel {
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
  WorkstationAccountType? workstationAccountType;
  List<dynamic>? userWorkstationMembers;
  String? hourlyRate;
  String? dayRate;
  String? aliasEmail;
  String? tags;
  String? role;
  bool? isSameRole;
  bool? isInvited;

  UserWorkStationModel(
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
      this.user,
      this.workstationAccountType,
      this.userWorkstationMembers,
      this.hourlyRate,
      this.dayRate,
      this.aliasEmail,
      this.tags,
      this.role,
      this.isSameRole,
      this.isInvited});

  UserWorkStationModel.fromJson(Map<String, dynamic> json) {
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
    workstationAccountType = json['workstationAccountType'] != null ? new WorkstationAccountType.fromJson(json['workstationAccountType']) : null;
    // if (json['userWorkstationMembers'] != null) {
    //   userWorkstationMembers = <dynamic>[];
    //   json['userWorkstationMembers'].forEach((v) {
    //     userWorkstationMembers!.add(new Null.fromJson(v as Map<String, dynamic>));
    //   });
    // }
    hourlyRate = json['hourlyRate'];
    dayRate = json['dayRate'];
    aliasEmail = json['aliasEmail'];
    tags = json['tags'];
    role = json['role'];
    isSameRole = json['isSameRole'];
    isInvited = json['isInvited'];
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
    if (this.workstationAccountType != null) {
      data['workstationAccountType'] = this.workstationAccountType!.toJson();
    }
    if (this.userWorkstationMembers != null) {
      data['userWorkstationMembers'] = this.userWorkstationMembers!.map((v) => v?.toJson()).toList();
    }
    data['hourlyRate'] = this.hourlyRate;
    data['dayRate'] = this.dayRate;
    data['aliasEmail'] = this.aliasEmail;
    data['tags'] = this.tags;
    data['role'] = this.role;
    data['isSameRole'] = this.isSameRole;
    data['isInvited'] = this.isInvited;
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
  UserBusinessDetails? userBusinessDetails;
  UserPublicProfile? userPublicProfile;

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
      this.userBusinessDetails,
      this.userPublicProfile});

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
    userBusinessDetails = json['userBusinessDetails'] != null ? new UserBusinessDetails.fromJson(json['userBusinessDetails']) : null;
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
    if (this.userBusinessDetails != null) {
      data['userBusinessDetails'] = this.userBusinessDetails!.toJson();
    }
    if (this.userPublicProfile != null) {
      data['userPublicProfile'] = this.userPublicProfile!.toJson();
    }
    return data;
  }
}

class UserBusinessDetails {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? type;
  String? companyName;
  String? teamName;
  String? businessName;
  String? companyNumber;
  String? nationalInsuranceNumber;
  String? taxReferenceNumber;
  String? ukVatNumber;
  String? incorporationDate;
  String? userVerificationStatus;
  String? vat;
  String? businessAddress;
  String? businessStreet;
  String? businessPostcode;
  String? businessTown;
  String? businessCountry;
  String? preferredDistance;
  String? residencyStreet;
  String? residencyPostcode;
  String? residencyTown;
  String? residencyCountry;
  String? residencyAddressLine;
  String? residencyAddressLookup;
  String? latitude;
  String? longitude;

  UserBusinessDetails(
      {this.id,
      this.dateCreated,
      this.dateUpdated,
      this.type,
      this.companyName,
      this.teamName,
      this.businessName,
      this.companyNumber,
      this.nationalInsuranceNumber,
      this.taxReferenceNumber,
      this.ukVatNumber,
      this.incorporationDate,
      this.userVerificationStatus,
      this.vat,
      this.businessAddress,
      this.businessStreet,
      this.businessPostcode,
      this.businessTown,
      this.businessCountry,
      this.preferredDistance,
      this.residencyStreet,
      this.residencyPostcode,
      this.residencyTown,
      this.residencyCountry,
      this.residencyAddressLine,
      this.residencyAddressLookup,
      this.latitude,
      this.longitude});

  UserBusinessDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    type = json['type'];
    companyName = json['companyName'];
    teamName = json['teamName'];
    businessName = json['businessName'];
    companyNumber = json['companyNumber'];
    nationalInsuranceNumber = json['nationalInsuranceNumber'];
    taxReferenceNumber = json['taxReferenceNumber'];
    ukVatNumber = json['ukVatNumber'];
    incorporationDate = json['incorporationDate'];
    userVerificationStatus = json['userVerificationStatus'];
    vat = json['vat'];
    businessAddress = json['businessAddress'];
    businessStreet = json['businessStreet'];
    businessPostcode = json['businessPostcode'];
    businessTown = json['businessTown'];
    businessCountry = json['businessCountry'];
    preferredDistance = json['preferredDistance'];
    residencyStreet = json['residencyStreet'];
    residencyPostcode = json['residencyPostcode'];
    residencyTown = json['residencyTown'];
    residencyCountry = json['residencyCountry'];
    residencyAddressLine = json['residencyAddressLine'];
    residencyAddressLookup = json['residencyAddressLookup'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['type'] = this.type;
    data['companyName'] = this.companyName;
    data['teamName'] = this.teamName;
    data['businessName'] = this.businessName;
    data['companyNumber'] = this.companyNumber;
    data['nationalInsuranceNumber'] = this.nationalInsuranceNumber;
    data['taxReferenceNumber'] = this.taxReferenceNumber;
    data['ukVatNumber'] = this.ukVatNumber;
    data['incorporationDate'] = this.incorporationDate;
    data['userVerificationStatus'] = this.userVerificationStatus;
    data['vat'] = this.vat;
    data['businessAddress'] = this.businessAddress;
    data['businessStreet'] = this.businessStreet;
    data['businessPostcode'] = this.businessPostcode;
    data['businessTown'] = this.businessTown;
    data['businessCountry'] = this.businessCountry;
    data['preferredDistance'] = this.preferredDistance;
    data['residencyStreet'] = this.residencyStreet;
    data['residencyPostcode'] = this.residencyPostcode;
    data['residencyTown'] = this.residencyTown;
    data['residencyCountry'] = this.residencyCountry;
    data['residencyAddressLine'] = this.residencyAddressLine;
    data['residencyAddressLookup'] = this.residencyAddressLookup;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
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

class WorkstationAccountType {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? code;
  String? name;

  WorkstationAccountType({this.id, this.dateCreated, this.dateUpdated, this.code, this.name});

  WorkstationAccountType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
