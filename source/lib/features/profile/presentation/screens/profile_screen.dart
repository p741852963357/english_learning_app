import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../constants/app_colors.dart';
import 'package:client/core/local_storage.dart';
import 'package:client/routes/app_router.gr.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String email = '';
  File? avatarImage;
  final LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    _loadEmail();
  }

  Future<void> _loadEmail() async {
    final storedEmail = await localStorage.getUserInfo();
    setState(() {
      email = storedEmail ?? '';
    });
  }

  Future<void> _logout(BuildContext context) async {
    final router = AutoRouter.of(context);
    await localStorage.clearUserInfo();
    router.pushAndPopUntil(
      const AuthenticationRoute(),
      predicate: (_) => false,
    );
  }

  Future<void> _pickAvatarImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        avatarImage = File(pickedFile.path);
      });
    }
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickAvatarImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: avatarImage != null ? FileImage(avatarImage!) : const AssetImage('assets/images/avatar.png') as ImageProvider,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              email,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              child: CustomButton(
                onPressed: () => AutoRouter.of(context).push(const ChangePasswordRoute()),
                text: "Change Password",
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: CustomButton(
                onPressed: () => _logout(context),
                text: "Log out",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.grey,
        side: const BorderSide(color: AppColors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.black),
      ),
    );
  }
}
