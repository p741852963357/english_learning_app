import 'package:auto_route/auto_route.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

@RoutePage()
class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to",
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24, color: AppColors.black),
                        ),
                        Text(
                          "Wordify",
                          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 72, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(const SignUpRoute());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                      splashFactory: NoSplash.splashFactory,
                      shadowColor: Colors.transparent,
                      backgroundColor: AppColors.blue,
                    ),
                    child: const Text(
                      "Sign up now",
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                TextButton(
                    style: const ButtonStyle(
                      overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                    ),
                    onPressed: () {
                      AutoRouter.of(context).push(const LogInRoute());
                    },
                    child: const Text(
                      "Or log in",
                      style: TextStyle(color: AppColors.blue),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
