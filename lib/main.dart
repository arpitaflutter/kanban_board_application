import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/Splash/view/splash_screen.dart';
import 'package:kanban_board_app/Screens/setting_page/controller/setting_controller.dart';
import 'package:kanban_board_app/l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingController controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        locale: controller.locale.value,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
