import 'package:flutter/material.dart';
import 'package:frog_list/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:frog_list/features/splashscreen/presentation/splashscreen_page.dart';

final Map<String, WidgetBuilder> appPageRoutes = {
  // Splashscreen
  //SplashscreenPage.route: (context) => const SplashscreenPage(),
  // DashboardPage
  DashboardPage.route: (context) => const DashboardPage(),
};
