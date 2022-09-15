import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moviez_streaming/app/constants.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: Constants.fontFamily,
        primaryColor: Colors.black
      ),
    ),
  );
}
