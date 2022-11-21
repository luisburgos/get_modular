import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_modular_wrappers/get_modular_wrappers.dart';

void main() {
  runApp(
    GetAppWrapper(
      appTitle: 'PAP3DS',
      initialRoute: HomeRoutes.root,
      unknownPageRoute: '/not-found',
      coreModule: CoreModule(),
    ),
  );
}

class CoreModule extends GetModule {
  @override
  List<GetBind> get binds => [];

  @override
  List<GetRoute> get routes => [
        GetModuleRoute(
          module: HomeModule(),
        ),
        //..more modules
      ];
}

class HomeRoutes {
  static const root = '/';
}

class HomeModule extends GetModule {
  @override
  List<GetRoute> get routes => [
        HomeRoute(),
      ];
}

class HomeRoute extends GetRoute {
  HomeRoute();

  @override
  GetPage get asGetPage => GetPage(
        name: HomeRoutes.root,
        page: () => const HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
