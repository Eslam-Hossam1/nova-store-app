import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nova_store_app/core/cubit/theme_cubit.dart';
import 'package:nova_store_app/core/routing/app_router.dart';
import 'package:nova_store_app/core/theme/app_themes.dart';
import 'package:nova_store_app/core/utils/size_config.dart';

class NovaStoreApp extends StatelessWidget {
  const NovaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilInit(
            designSize:
                const Size(SizeConfig.designWidth, SizeConfig.designheight),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
              themeMode: ThemeMode.light,
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
            ),
          );
        },
      ),
    );
  }
}
