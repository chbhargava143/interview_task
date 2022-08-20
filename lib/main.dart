import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/bindings/controller_bindings.dart';
import 'package:task/ui/login/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorCodes = {
      50: const Color(0XFFe0f3f0),
      100: const Color(0XFFb3e2d8),
      200: const Color(0XFF82d0bf),
      300: const Color(0XFF50bca5),
      400: const Color(0XFF29ad93),
      500: const Color(0XFF009e81),
      600: const Color(0XFF009174),
      700: const Color(0XFF008065),
      800: const Color(0XFF007057),
      900: const Color(0XFF00543b),
    };

    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          initialBinding: ControllerBindings(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: MaterialColor(0xff009E80, colorCodes))),
          darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: MaterialColor(0xff009E80, colorCodes))),
          home:  LogIn(),
        );
      },
    );
  }
}
