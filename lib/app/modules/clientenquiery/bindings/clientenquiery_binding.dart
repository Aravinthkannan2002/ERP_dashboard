import 'package:get/get.dart';

import '../controllers/clientenquiery_controller.dart';

class ClientenquieryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClientenquieryController>(
      () => ClientenquieryController(),
    );
  }
}
