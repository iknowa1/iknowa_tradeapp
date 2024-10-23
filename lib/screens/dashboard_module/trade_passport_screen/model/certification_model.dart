import '../../../../utils/imagepath.dart';

class CertificationModel {
  String? certificateName;
  String? membershipNo;
  String? certificateImage;
  List<String>? memberList;
  String? fileName;

  CertificationModel({this.certificateName, this.membershipNo, this.certificateImage, this.memberList, this.fileName});
}

List<CertificationModel> certificationList = [
  CertificationModel(
      certificateName: "Gas Safe Registry", membershipNo: "52212545", certificateImage: ImagePath.certificateIcon, fileName: "Accreditation.pdf", memberList: ["Kathryn Murphy", "John Doe"]),
  CertificationModel(
      certificateName: "FTEC (OFT10-105E or OFT15-108W), MCS (Heat Pump or Solar Thermal Hot Water) or HETAS (H004) registration",
      membershipNo: "52212545",
      certificateImage: ImagePath.certificateIcon,
      fileName: "Certification FTEC.pdf",
      memberList: ["Savannah Nguyen", "John Doe"])
];
