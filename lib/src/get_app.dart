import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_module.dart';
import 'get_not_found_page.dart';

class GetAppWrapper extends StatelessWidget {
  const GetAppWrapper({
    Key? key,
    required this.coreModule,
    required this.unknownPageRoute,
    required this.initialRoute,
    this.appTitle = 'Get Module App Wrappers',
  }) : super(key: key);

  final GetModule coreModule;
  final String unknownPageRoute;
  final String initialRoute;
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      unknownRoute: GetPage(
        name: unknownPageRoute,
        page: () => const GetNotFoundPage(),
      ),
      initialBinding: BindingsBuilder(() {
        coreModule.runBinds();
      }),
      initialRoute: initialRoute,
      getPages: coreModule.buildPages(),
    );
  }
}
