import 'package:flutter/material.dart';

import 'themes/app_themes.dart';
import 'pages/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRouter.homePage,
            onGenerateRoute: AppRouter.generateRoute,
            title: 'English Card',
            theme: context.theme.material,
          );
        },
      ),
    );
  }
}