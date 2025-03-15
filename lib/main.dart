import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoapp/controller/Ui/theme_controller.dart';
import 'package:todoapp/theme/theme_data.dart';
import 'package:todoapp/view/auth/login_screen.dart';
import 'package:todoapp/view/auth/signup_screen.dart';
import 'package:todoapp/view/auth/splash_screen.dart';
import 'package:todoapp/view/user/home_screen.dart';
import 'package:todoapp/view/user/profile_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  final box = GetStorage();
  if (box.read('onbording') == null) {
    box.write('onbording', false);
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeController themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(429, 860),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Recipies app',
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode:
                themeController.isdark.value ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        });
  }
}
