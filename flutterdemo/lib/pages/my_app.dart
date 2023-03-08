import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tab_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      home: const TabbarPage(),
      theme: getThemeData(),
      navigatorKey: Get.key,
      navigatorObservers: [GetObserver()],
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      hintColor: Colors.transparent,
      splashColor: Colors.transparent,
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: Colors.red),
    );
  }
}


