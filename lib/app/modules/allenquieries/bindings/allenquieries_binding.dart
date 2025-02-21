import 'package:get/get.dart';

import '../controllers/allenquieries_controller.dart';

class AllenquieriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllenquieriesController>(
      () => AllenquieriesController(),
    );
  }
}
