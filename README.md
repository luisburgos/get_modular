Just a [GetX](https://pub.dev/packages/get) wrappers repo.

## Usage

Change the `main` app init:

```dart
import 'package:get_modular/get_modular_wrappers.dart'; 

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
import 'package:get_modular/get_modular_wrappers.dart';
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
import 'package:get_modular/get_modular_wrappers.dart';
import '../app_routes.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.root,
          child: (context, args) => Scaffold(
            body: Center(
              child: Text('Home'),
            ),
          ),
        ),
      ];
}
```

Preferable create a file `app_routes.dart` to map your app routes from modules routes:

```dart
class AppRoutes {
  //static const root = HomeRoutes.root;
  //static const login = LoginPage.routeName;
  //static const notFound = '/not-found';
}
```
