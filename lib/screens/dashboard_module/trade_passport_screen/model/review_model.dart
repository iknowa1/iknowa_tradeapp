
import '../../../../utils/imagepath.dart';

class ReviewModel {
  String? name;
  String? image;
  String? location;
  double? rate;

  ReviewModel({this.name, this.image, this.location, this.rate});
}

List<ReviewModel> reviewList = [
  ReviewModel(image: ImagePath.reviewImage1, name: "Kitchen Refurbishment: with second line title", location: "KT19 9JG", rate: 4.3),
  ReviewModel(image: ImagePath.reviewImage2, name: "Window Frame Repairing and cleaning frame", location: "W12 9RE", rate: 3.8),
  ReviewModel(image: ImagePath.reviewImage3, name: "Air Source Heat Pump Installation", location: "W12 9RE", rate: 3.8),
];
