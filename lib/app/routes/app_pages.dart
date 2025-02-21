import 'package:get/get.dart';

import '../modules/allenquieries/bindings/allenquieries_binding.dart';
import '../modules/allenquieries/views/allenquieries_view.dart';
import '../modules/clientenquiery/bindings/clientenquiery_binding.dart';
import '../modules/clientenquiery/views/clientenquiery_view.dart';
import '../modules/employee/bindings/employee_binding.dart';
import '../modules/employee/views/employee_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/projects/bindings/projects_binding.dart';
import '../modules/projects/views/projects_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTENQUIERY,
      page: () => const ClientenquieryView(),
      binding: ClientenquieryBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE,
      page: () =>  EmployeeView(),
      binding: EmployeeBinding(),
    ),
    GetPage(
      name: _Paths.ALLENQUIERIES,
      page: () =>  AllenquieriesView(),
      binding: AllenquieriesBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTS,
      page: () => const ProjectsView(),
      binding: ProjectsBinding(),
    ),
  ];
}
