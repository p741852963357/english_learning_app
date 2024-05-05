import 'package:client/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  /*WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routerConfig: appRouter.config(),
    );
  }
}
