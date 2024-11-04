import 'package:focalx_task6/core/constant_data/routes.dart';
import 'package:focalx_task6/view/onBoarding/screen/onBoarding.dart';
import 'package:focalx_task6/view/register_account/screen/create_account_screen.dart';
import 'package:focalx_task6/view/sign_in/screen/sign_in_screen.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoardig(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const CreateAccountScreen(),
  ),
  // GetPage(
  //   name: "/homeScreen",
  //   page: () => const HomeScreen(),
  // ),
];
