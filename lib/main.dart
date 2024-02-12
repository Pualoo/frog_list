import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frog_list/core/config/app_theme.dart';
import 'package:frog_list/core/config/localizations_config.dart';
import 'package:frog_list/core/config/routes.dart';
import 'package:frog_list/core/shared/constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  //await setupGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      theme: appTheme,
      localizationsDelegates: LocalizationsDelegates.all,
      supportedLocales: SupportedLocales.all,
      routes: appPageRoutes,
    );
  }
}
