class EmailVerifyModel {
  int? id;
  String? email;
  String? code;
  String? expireIn;
  String? type;
  String? dateCreated;
  String? dateUpdated;

  EmailVerifyModel({this.id, this.email, this.code, this.expireIn, this.type, this.dateCreated, this.dateUpdated});

  EmailVerifyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    code = json['code'];
    expireIn = json['expireIn'];
    type = json['type'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['code'] = this.code;
    data['expireIn'] = this.expireIn;
    data['type'] = this.type;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    return data;
  }
}
