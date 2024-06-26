import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_corner_products/block_observer.dart';
import 'package:test_corner_products/core/services/services_locator.dart';
import 'package:test_corner_products/corner_app.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // ensure that everything in this function already finished then start application `runApp()`

  usePathUrlStrategy(); // remove # from links

  Bloc.observer = MyBlocObserver();

  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CornerApp();
  }
}
