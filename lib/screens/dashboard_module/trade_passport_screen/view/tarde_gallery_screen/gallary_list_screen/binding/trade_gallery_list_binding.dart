import 'package:get/get.dart';
import '../controller/trade_gallery_list_controller.dart';

class TradeGalleryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TradeGalleryListController());
  }
}
