import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_store_app/core/routing/app_router.dart';
import 'package:nova_store_app/core/utils/size_config.dart';

class NovaStoreApp extends StatelessWidget {
  const NovaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(SizeConfig.designWidth, SizeConfig.designheight),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
