Just a [GetX](https://pub.dev/packages/get) wrappers repo.

## Usage

Change the `main` app init:

```dart
import 'package:get_modular_wrappers/get_modular_wrappers.dart'; 

void main() {
  runApp(
    GetAppWrapper(
      initialRoute: AppRoutes.root,
      unknownPageRoute: AppRoutes.notFound,
      coreModule: CoreModule(),
    ),
  );
}
```


Create a `core_module.dart` file:

```dart
import 'package:get_modular_wrappers/get_modular_wrappers.dart';
import 'modules/home_module';

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
```

Create a `home_module.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_modular_wrappers/get_modular_wrappers.dart';

import '../app_routes.dart';

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
    name: AppRoutes.root,
    page: () => const HomePage(),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
```

Preferable create a file `app_routes.dart` to map your app routes from modules routes:

```dart
import 'modules/home_module.dart';

class AppRoutes {
  static const root = HomeRoutes.root;
  //static const login = LoginPage.routeName;
  static const notFound = '/not-found';
}
```
