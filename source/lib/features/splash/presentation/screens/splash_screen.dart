import 'package:auto_route/auto_route.dart';
import 'package:client/core/local_storage.dart';
import 'package:client/routes/app_router.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

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
    LocalStorage localStorage = LocalStorage();
    localStorage.getUserInfo().then((data) => {
          if (data == null)
            {
              AutoRouter.of(context).pushAndPopUntil(
                const AuthenticationRoute(),
                predicate: (_) => false,
              )
            }
          else
            {
              AutoRouter.of(context).pushAndPopUntil(
                const AppRoute(),
                predicate: (_) => false,
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.black,
        ),
      ),
    );
  }
}
