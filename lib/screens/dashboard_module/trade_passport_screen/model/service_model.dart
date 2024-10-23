import '../../../../utils/imagepath.dart';

class ServiceModel {
  String? serviceName;
  String? serviceDate;
  String? serviceImage;
  List<String>? expertList;
  List<String>? memberList;

  ServiceModel({this.serviceName, this.serviceDate, this.serviceImage, this.expertList, this.memberList});
}

List<ServiceModel> serviceList = [
  ServiceModel(
      serviceName: "Painting & Decorating",
      serviceDate: "27/06/2024",
      serviceImage: ImagePath.serviceElectrician,
      expertList: ["Wall Painting", "Wallpaper", "Wall Painting", "Wallpaper"],
      memberList: ["Kathryn Murphy", "John Doe"]),
  ServiceModel(
      serviceName: "Electrician",
      serviceDate: "27/06/2024",
      serviceImage: ImagePath.serviceElectrician,
      expertList: ["Wiring & Circuit", "Wiring & Circuit", "Wiring & Circuit", "Wiring & Circuit"],
      memberList: ["Savannah Nguyen", "John Doe"]),
  ServiceModel(
      serviceName: "Carpenter & Joiner",
      serviceDate: "27/06/2024",
      serviceImage: ImagePath.serviceCarpenter,
      expertList: ["Flooring Installation", "Flooring Installation", "Flooring Installation", "Flooring Installation"],
      memberList: ["Bessie Cooper", "John Doe"]),
];
