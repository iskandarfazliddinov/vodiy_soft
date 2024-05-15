import 'package:flutter/material.dart';
import 'package:vodiy_soft/config/routes/router.dart';
import 'package:vodiy_soft/core/di/injector.dart';
import 'package:vodiy_soft/core/di/locator.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(Injector(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final _router = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
