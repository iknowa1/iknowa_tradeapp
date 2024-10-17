class LoginModel {
  String? idToken;
  User? user;
  bool? isLoginAsAlias;

  LoginModel({
    this.idToken,
    this.user,
    this.isLoginAsAlias,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        idToken: json["IdToken"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        isLoginAsAlias: json["isLoginAsAlias"],
      );

  Map<String, dynamic> toJson() => {
        "IdToken": idToken,
        "user": user?.toJson(),
        "isLoginAsAlias": isLoginAsAlias,
      };
}

class User {
  int? id;
  DateTime? dateCreated;
  DateTime? dateUpdated;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  dynamic birthDate;
  dynamic postcode;
  bool? active;
  bool? hasChosenRole;
  bool? hasAccountSetup;
  bool? hasBusinessType;
  dynamic accountSetupCache;
  bool? verifiedEmail;
  String? userVerificationStatus;
  String? gender;
  String? userKycVerificationStatus;
  String? contactNo;
  dynamic address;
  bool? tcOptIn;
  bool? marketingOptIn;
  dynamic latitude;
  dynamic longitude;
  int? referralCode;
  dynamic referredCode;
  dynamic tpProfileSubscription;
  DateTime? lastLoginAt;
  int? loginAttempt;
  Role? role;
  List<UserWorkstation>? userWorkstations;

  User({
    this.id,
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
    this.userKycVerificationStatus,
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
    this.userWorkstations,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
        dateUpdated: json["dateUpdated"] == null ? null : DateTime.parse(json["dateUpdated"]),
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        birthDate: json["birthDate"],
        postcode: json["postcode"],
        active: json["active"],
        hasChosenRole: json["hasChosenRole"],
        hasAccountSetup: json["hasAccountSetup"],
        hasBusinessType: json["hasBusinessType"],
        accountSetupCache: json["accountSetupCache"],
        verifiedEmail: json["verifiedEmail"],
        userVerificationStatus: json["userVerificationStatus"],
        gender: json["gender"],
        userKycVerificationStatus: json["userKYCVerificationStatus"],
        contactNo: json["contactNo"],
        address: json["address"],
        tcOptIn: json["tcOptIn"],
        marketingOptIn: json["marketingOptIn"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        referralCode: json["referralCode"],
        referredCode: json["referredCode"],
        tpProfileSubscription: json["tpProfileSubscription"],
        lastLoginAt: json["lastLoginAt"] == null ? null : DateTime.parse(json["lastLoginAt"]),
        loginAttempt: json["loginAttempt"],
        role: json["role"] == null ? null : Role.fromJson(json["role"]),
        userWorkstations: json["userWorkstations"] == null ? [] : List<UserWorkstation>.from(json["userWorkstations"]!.map((x) => UserWorkstation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateUpdated": dateUpdated?.toIso8601String(),
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "birthDate": birthDate,
        "postcode": postcode,
        "active": active,
        "hasChosenRole": hasChosenRole,
        "hasAccountSetup": hasAccountSetup,
        "hasBusinessType": hasBusinessType,
        "accountSetupCache": accountSetupCache,
        "verifiedEmail": verifiedEmail,
        "userVerificationStatus": userVerificationStatus,
        "gender": gender,
        "userKYCVerificationStatus": userKycVerificationStatus,
        "contactNo": contactNo,
        "address": address,
        "tcOptIn": tcOptIn,
        "marketingOptIn": marketingOptIn,
        "latitude": latitude,
        "longitude": longitude,
        "referralCode": referralCode,
        "referredCode": referredCode,
        "tpProfileSubscription": tpProfileSubscription,
        "lastLoginAt": lastLoginAt?.toIso8601String(),
        "loginAttempt": loginAttempt,
        "role": role?.toJson(),
        "userWorkstations": userWorkstations == null ? [] : List<dynamic>.from(userWorkstations!.map((x) => x.toJson())),
      };
}

class Role {
  int? id;
  DateTime? dateCreated;
  DateTime? dateUpdated;
  String? name;

  Role({
    this.id,
    this.dateCreated,
    this.dateUpdated,
    this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
        dateUpdated: json["dateUpdated"] == null ? null : DateTime.parse(json["dateUpdated"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateUpdated": dateUpdated?.toIso8601String(),
        "name": name,
      };
}

class UserWorkstation {
  int? id;
  DateTime? dateCreated;
  DateTime? dateUpdated;
  String? name;
  String? status;
  String? subStatus;
  dynamic subscription;
  dynamic threeMonthSubscription;
  dynamic documentSubscription;
  dynamic membersSubscription;
  int? maxMemberLimit;
  int? seatsUsed;
  String? verificationStatus;
  dynamic submittedInformationAt;
  dynamic description;
  String? profileImage;
  dynamic experience;
  bool? isAvailable;
  bool? isShowTradeNetwork;
  dynamic emergencyCallOutFee;
  dynamic videoConsulationFee;
  dynamic emergencyCallOutFeeType;
  dynamic emergencyCallOutRate;
  dynamic workstationVerificationType;
  bool? isWsFreezed;

  UserWorkstation({
    this.id,
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
  });

  factory UserWorkstation.fromJson(Map<String, dynamic> json) => UserWorkstation(
        id: json["id"],
        dateCreated: json["dateCreated"] == null ? null : DateTime.parse(json["dateCreated"]),
        dateUpdated: json["dateUpdated"] == null ? null : DateTime.parse(json["dateUpdated"]),
        name: json["name"],
        status: json["status"],
        subStatus: json["subStatus"],
        subscription: json["subscription"],
        threeMonthSubscription: json["threeMonthSubscription"],
        documentSubscription: json["documentSubscription"],
        membersSubscription: json["membersSubscription"],
        maxMemberLimit: json["maxMemberLimit"],
        seatsUsed: json["seatsUsed"],
        verificationStatus: json["verificationStatus"],
        submittedInformationAt: json["submittedInformationAt"],
        description: json["description"],
        profileImage: json["profileImage"],
        experience: json["experience"],
        isAvailable: json["isAvailable"],
        isShowTradeNetwork: json["isShowTradeNetwork"],
        emergencyCallOutFee: json["emergencyCallOutFee"],
        videoConsulationFee: json["videoConsulationFee"],
        emergencyCallOutFeeType: json["emergencyCallOutFeeType"],
        emergencyCallOutRate: json["emergencyCallOutRate"],
        workstationVerificationType: json["workstationVerificationType"],
        isWsFreezed: json["isWsFreezed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dateCreated": dateCreated?.toIso8601String(),
        "dateUpdated": dateUpdated?.toIso8601String(),
        "name": name,
        "status": status,
        "subStatus": subStatus,
        "subscription": subscription,
        "threeMonthSubscription": threeMonthSubscription,
        "documentSubscription": documentSubscription,
        "membersSubscription": membersSubscription,
        "maxMemberLimit": maxMemberLimit,
        "seatsUsed": seatsUsed,
        "verificationStatus": verificationStatus,
        "submittedInformationAt": submittedInformationAt,
        "description": description,
        "profileImage": profileImage,
        "experience": experience,
        "isAvailable": isAvailable,
        "isShowTradeNetwork": isShowTradeNetwork,
        "emergencyCallOutFee": emergencyCallOutFee,
        "videoConsulationFee": videoConsulationFee,
        "emergencyCallOutFeeType": emergencyCallOutFeeType,
        "emergencyCallOutRate": emergencyCallOutRate,
        "workstationVerificationType": workstationVerificationType,
        "isWsFreezed": isWsFreezed,
      };
}
