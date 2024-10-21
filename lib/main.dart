import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:toastification/toastification.dart';
import 'package:trade_app/route/app_pages.dart';
import 'package:trade_app/utils/app_constants.dart';

import 'core/common/app_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        enableScaleText: () => true,
        child: GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute: Routes.splash,
          theme: ThemeData(useMaterial3: false),
        ),
      ),
    );
  }
}
