import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:client/core/local_storage.dart';
import 'package:client/routes/app_router.gr.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logout(BuildContext context) async {
    final router = AutoRouter.of(context);
    LocalStorage localStorage = LocalStorage();

    await localStorage.clearUserInfo();

    router.pushAndPopUntil(
      const AuthenticationRoute(),
      predicate: (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _logout(context),
              child: const Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () => AutoRouter.of(context).push(const ChangePasswordRoute()),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
