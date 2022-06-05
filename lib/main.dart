import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/product_catalog_view.dart';

Future main() async {
  runApp(const SMDemoApp());
}

class SMDemoApp extends StatelessWidget {
  const SMDemoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: ProductsCatalog());
  }
}
