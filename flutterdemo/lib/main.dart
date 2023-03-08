import 'package:flutter/material.dart';

import 'package:flutterdemo/pages/my_app.dart';

void main() {
  print("object");
  FlutterError.onError = (FlutterErrorDetails details) {
    print(details);
  };
  runApp(const MyApp());
}
