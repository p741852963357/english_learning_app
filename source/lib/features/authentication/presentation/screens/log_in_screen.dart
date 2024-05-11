import 'package:auto_route/annotations.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:client/features/create/presentation/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Log in",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldWidget(
                onChange: () {
                  setState(() {
                    emailError = null;
                  });
                },
                errorText: emailError,
                controller: emailController,
                helperText: 'Email',
                hintText: "Enter your email",
              ),
              CustomTextFieldWidget(
                onChange: () {
                  setState(() {
                    passwordError = null;
                  });
                },
                obscureText: true,
                errorText: passwordError,
                controller: passwordController,
                helperText: 'Password',
                hintText: "Enter your password",
              ),
              TextButton(
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                ),
                // TODO: Forgot password
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: AppColors.blue),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom * 0.5,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        onPressed: () async {
          if (emailController.text.isEmpty) {
            setState(() {
              emailError = "Field is required";
            });
          }
          if (passwordController.text.isEmpty) {
            setState(() {
              passwordError = "Field is required";
            });
          }
          // TODO: catch more error
          // TODO: add login
        },
        validate: () {
          return null;
        },
      ),
    );
  }
}
