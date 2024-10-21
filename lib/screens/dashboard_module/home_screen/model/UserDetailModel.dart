class UserDetailModel {
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
  List<UserStripeCustomer>? userStripeCustomer;
  UserPublicProfile? userPublicProfile;
  UserBusinessDetails? userBusinessDetails;
  UserIdentification? userIdentification;
  List<String>? userCertificates;
  List<String>? userInsurances;
  List<String>? userSkills;

  UserDetailModel(
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
      this.userStripeCustomer,
      this.userPublicProfile,
      this.userBusinessDetails,
      this.userIdentification,
      this.userCertificates,
      this.userInsurances,
      this.userSkills});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
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
    if (json['userStripeCustomer'] != null) {
      userStripeCustomer = <UserStripeCustomer>[];
      json['userStripeCustomer'].forEach((v) {
        userStripeCustomer!.add(new UserStripeCustomer.fromJson(v));
      });
    }
    userPublicProfile = json['userPublicProfile'] != null ? new UserPublicProfile.fromJson(json['userPublicProfile']) : null;
    userBusinessDetails = json['userBusinessDetails'] != null ? new UserBusinessDetails.fromJson(json['userBusinessDetails']) : null;
    userIdentification = json['userIdentification'] != null ? new UserIdentification.fromJson(json['userIdentification']) : null;
    // if (json['userCertificates'] != null) {
    //   userCertificates = <Null>[];
    //   json['userCertificates'].forEach((v) {
    //     userCertificates!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['userInsurances'] != null) {
    //   userInsurances = <Null>[];
    //   json['userInsurances'].forEach((v) {
    //     userInsurances!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['userSkills'] != null) {
    //   userSkills = <Null>[];
    //   json['userSkills'].forEach((v) {
    //     userSkills!.add(new Null.fromJson(v));
    //   });
    // }
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
    if (this.userStripeCustomer != null) {
      data['userStripeCustomer'] = this.userStripeCustomer!.map((v) => v.toJson()).toList();
    }
    if (this.userPublicProfile != null) {
      data['userPublicProfile'] = this.userPublicProfile!.toJson();
    }
    if (this.userBusinessDetails != null) {
      data['userBusinessDetails'] = this.userBusinessDetails!.toJson();
    }
    if (this.userIdentification != null) {
      data['userIdentification'] = this.userIdentification!.toJson();
    }
    // if (this.userCertificates != null) {
    //   data['userCertificates'] =
    //       this.userCertificates!.map((v) => v.toJson()).toList();
    // }
    // if (this.userInsurances != null) {
    //   data['userInsurances'] =
    //       this.userInsurances!.map((v) => v.toJson()).toList();
    // }
    // if (this.userSkills != null) {
    //   data['userSkills'] = this.userSkills!.map((v) => v.toJson()).toList();
    // }
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

class UserStripeCustomer {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? customerId;
  String? entity;

  UserStripeCustomer({this.id, this.dateCreated, this.dateUpdated, this.customerId, this.entity});

  UserStripeCustomer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    customerId = json['customerId'];
    entity = json['entity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['customerId'] = this.customerId;
    data['entity'] = this.entity;
    return data;
  }
}

class UserPublicProfile {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  Null? description;
  Null? profileImage;
  Null? profileBanner;
  String? userVerificationStatus;
  List<Null>? galleries;

  UserPublicProfile({this.id, this.dateCreated, this.dateUpdated, this.name, this.description, this.profileImage, this.profileBanner, this.userVerificationStatus, this.galleries});

  UserPublicProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    name = json['name'];
    description = json['description'];
    profileImage = json['profileImage'];
    profileBanner = json['profileBanner'];
    userVerificationStatus = json['userVerificationStatus'];
    // if (json['galleries'] != null) {
    //   galleries = <Null>[];
    //   json['galleries'].forEach((v) {
    //     galleries!.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.galleries != null) {
    //   data['galleries'] = this.galleries!.map((v) => v.toJson()).toList();
    // }
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
