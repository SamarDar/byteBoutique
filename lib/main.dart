import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:focalx_task6/bindings/initial_binding.dart';
import 'package:focalx_task6/view/customePageView/screen/custom_page_view.dart';
import 'package:focalx_task6/view/onBoarding/screen/onBoarding.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/services/myServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      home:  Get.find<MyServices>().getIsLogin() == null ? const OnBoardig() :const CustomPageView() ,
      // getPages: routes,
    );
  }
}
