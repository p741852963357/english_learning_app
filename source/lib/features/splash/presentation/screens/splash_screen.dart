import 'package:auto_route/auto_route.dart';
import 'package:client/routes/app_router.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppRouter appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      // TODO: implement authentication
      const route = AppRoute();
      AutoRouter.of(context).pushAndPopUntil(route, predicate: (_) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
