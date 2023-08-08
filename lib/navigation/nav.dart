import 'package:get/get.dart';

import '../bindings/details_binding.dart';
import '../bindings/home_binding.dart';
import '../presentation/views/details_screen.dart';
import '../presentation/views/home_screen.dart';

part 'routes.dart';

class Nav {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => const DetailsScreen(),
      binding: DetailsBinding(),
    ),
  ];
}
