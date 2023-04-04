import 'package:ecommerce/route/route_generator.dart';
import 'package:ecommerce/ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'const/app_bindings.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "SourceSansPro",
      ),
      initialBinding: AppBindings(),
      initialRoute: HomeScreen.routeName,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
