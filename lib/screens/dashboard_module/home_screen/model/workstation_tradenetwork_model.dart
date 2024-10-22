class WorkStationTradeNetworkModel {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? status;
  String? addedFrom;
  ReceiverWorkstation? receiverWorkstation;
  String? userNetworkCategory;

  WorkStationTradeNetworkModel({this.id, this.dateCreated, this.dateUpdated, this.status, this.addedFrom, this.receiverWorkstation, this.userNetworkCategory});

  WorkStationTradeNetworkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    status = json['status'];
    addedFrom = json['addedFrom'];
    receiverWorkstation = json['receiverWorkstation'] != null ? new ReceiverWorkstation.fromJson(json['receiverWorkstation']) : null;
    userNetworkCategory = json['userNetworkCategory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['status'] = this.status;
    data['addedFrom'] = this.addedFrom;
    if (this.receiverWorkstation != null) {
      data['receiverWorkstation'] = this.receiverWorkstation!.toJson();
    }
    data['userNetworkCategory'] = this.userNetworkCategory;
    return data;
  }
}

class ReceiverWorkstation {
  int? id;
  String? name;
  String? description;
  String? profileImage;
  String? experience;
  bool? isAvailable;
  User? user;
  List<UserSkill>? userSkill;
  String? hourlyRate;
  String? dayRate;
  String? distance;

  ReceiverWorkstation({this.id, this.name, this.description, this.profileImage, this.experience, this.isAvailable, this.user, this.userSkill, this.hourlyRate, this.dayRate, this.distance});

  ReceiverWorkstation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    profileImage = json['profileImage'];
    experience = json['experience'];
    isAvailable = json['isAvailable'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['userSkill'] != null) {
      userSkill = <UserSkill>[];
      json['userSkill'].forEach((v) {
        userSkill!.add(new UserSkill.fromJson(v));
      });
    }
    hourlyRate = json['hourlyRate'];
    dayRate = json['dayRate'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['profileImage'] = this.profileImage;
    data['experience'] = this.experience;
    data['isAvailable'] = this.isAvailable;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.userSkill != null) {
      data['userSkill'] = this.userSkill!.map((v) => v.toJson()).toList();
    }
    data['hourlyRate'] = this.hourlyRate;
    data['dayRate'] = this.dayRate;
    data['distance'] = this.distance;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? userPublicProfile;
  UserBusinessDetails? userBusinessDetails;

  User({this.id, this.firstName, this.lastName, this.userPublicProfile, this.userBusinessDetails});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userPublicProfile = json['userPublicProfile'];
    userBusinessDetails = json['userBusinessDetails'] != null ? new UserBusinessDetails.fromJson(json['userBusinessDetails']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userPublicProfile'] = this.userPublicProfile;
    if (this.userBusinessDetails != null) {
      data['userBusinessDetails'] = this.userBusinessDetails!.toJson();
    }
    return data;
  }
}

class UserBusinessDetails {
  String? type;
  String? companyName;
  String? businessPostcode;
  String? residencyPostcode;

  UserBusinessDetails({this.type, this.companyName, this.businessPostcode, this.residencyPostcode});

  UserBusinessDetails.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    companyName = json['companyName'];
    businessPostcode = json['businessPostcode'];
    residencyPostcode = json['residencyPostcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['companyName'] = this.companyName;
    data['businessPostcode'] = this.businessPostcode;
    data['residencyPostcode'] = this.residencyPostcode;
    return data;
  }
}

class UserSkill {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? assignedUserIds;
  String? subCategoryIds;
  Category? category;

  UserSkill({this.id, this.dateCreated, this.dateUpdated, this.assignedUserIds, this.subCategoryIds, this.category});

  UserSkill.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    assignedUserIds = json['assignedUserIds'];
    subCategoryIds = json['subCategoryIds'];
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['assignedUserIds'] = this.assignedUserIds;
    data['subCategoryIds'] = this.subCategoryIds;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? poLabel;
  String? tpLabel;
  String? iconName;

  Category({this.id, this.poLabel, this.tpLabel, this.iconName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    poLabel = json['poLabel'];
    tpLabel = json['tpLabel'];
    iconName = json['iconName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['poLabel'] = this.poLabel;
    data['tpLabel'] = this.tpLabel;
    data['iconName'] = this.iconName;
    return data;
  }
}
