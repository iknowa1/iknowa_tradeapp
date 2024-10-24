import '../../../../utils/imagepath.dart';

class ServiceModel {
  String? serviceName;
  String? serviceDate;
  String? serviceImage;
  String? serviceType;
  List<String>? subCategory;
  List<String>? expertList;
  List<String>? memberList;

  ServiceModel({this.serviceName, this.serviceDate, this.serviceImage, this.expertList, this.memberList, this.serviceType, this.subCategory});
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
  // ServiceModel(serviceName: "Building Services", serviceImage: ImagePath.serviceBuilding, serviceType: "Extensions, Internal, External etc"),
  ServiceModel(serviceName: "Electrical Services", serviceImage: ImagePath.serviceElectrician, serviceType: "Extensions, Internal, External etc"),
  // ServiceModel(serviceName: "Decorating", serviceImage: ImagePath.serviceDecorating, serviceType: "Extensions, Internal, External etc"),
  // ServiceModel(serviceName: "Plumbing", serviceImage: ImagePath.servicePlumbing, serviceType: "Extensions, Internal, External etc"),
  // ServiceModel(serviceName: "Roofing", serviceImage: ImagePath.serviceRoofing, serviceType: "Extensions, Internal, External etc"),
  ServiceModel(serviceName: "Handyman", serviceImage: ImagePath.certificateIcon, serviceType: "Extensions, Internal, External etc"),
];
