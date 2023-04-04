import 'package:get/get.dart';
import '../ui/screen/home/details3_screen.dart';
import '../ui/screen/home/details4_screen.dart';
import '../ui/screen/home/details5_screen.dart';
import '../ui/screen/home/details_screen.dart';
import '../ui/screen/home/home_screen.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
  GetPage(name: DetailsScreen.routeName, page: () => const DetailsScreen()),
  GetPage(name: Details3Screen.routeName, page: () => const Details3Screen()),
  GetPage(name: Details4Screen.routeName, page: () => const Details4Screen()),
  GetPage(name: Details5Screen.routeName, page: () => const Details5Screen()),
];
