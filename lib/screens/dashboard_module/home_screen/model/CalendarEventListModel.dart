class CalendarEventListModel {
  int? id;
  String? dateCreated;
  String? dateUpdated;
  String? name;
  String? location;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  String? description;
  String? invitePeople;

  CalendarEventListModel({this.id, this.dateCreated, this.dateUpdated, this.name, this.location, this.startDate, this.endDate, this.startTime, this.endTime, this.description, this.invitePeople});

  CalendarEventListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateCreated = json['dateCreated'];
    dateUpdated = json['dateUpdated'];
    name = json['name'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    description = json['description'];
    invitePeople = json['invitePeople'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateCreated'] = this.dateCreated;
    data['dateUpdated'] = this.dateUpdated;
    data['name'] = this.name;
    data['location'] = this.location;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['description'] = this.description;
    data['invitePeople'] = this.invitePeople;
    return data;
  }
}
