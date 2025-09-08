import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
import 'utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('uz'), Locale('en'), Locale('ru')],
      path: AppConstants.assetsTranslationsPath,
      fallbackLocale: const Locale('uz'),
      startLocale: const Locale('uz'),
      child: const CS16ProGuideApp(),
    ),
  );
}

class CS16ProGuideApp extends StatelessWidget {
  const CS16ProGuideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
