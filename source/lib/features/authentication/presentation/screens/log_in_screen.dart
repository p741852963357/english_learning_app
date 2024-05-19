import 'package:auto_route/auto_route.dart';
import 'package:client/core/local_storage.dart';
import 'package:client/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:client/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:client/features/authentication/utils/validator.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:client/constants/app_colors.dart';

import '../../../create/presentation/widgets/custom_bottom_app_bar.dart';
import '../../data/models/user_model.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  String? emailError;
  String? passwordError;
  bool readOnly = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

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
                focusNode: emailFocusNode,
                onChange: () {
                  setState(() {
                    emailError = null;
                  });
                },
                readOnly: readOnly,
                errorText: emailError,
                controller: emailController,
                helperText: 'Email',
                hintText: "Enter your email",
              ),
              CustomTextFieldWidget(
                focusNode: passwordFocusNode,
                onChange: () {
                  setState(() {
                    passwordError = null;
                  });
                },
                readOnly: readOnly,
                obscureText: true,
                errorText: passwordError,
                controller: passwordController,
                helperText: 'Password',
                hintText: "Enter your password",
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () {
                  AutoRouter.of(context).push(const ForgotPasswordRoute());
                },
                child: Text(
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
          final router = AutoRouter.of(context);
          try {
            AuthenticationUseCase authenticationUseCase = AuthenticationUseCase();
            UserModel user = await authenticationUseCase.loginUser(
              emailController.text.trim(),
              passwordController.text.trim(),
            );
            LocalStorage localStorage = LocalStorage();
            await localStorage.setUserInfo(user.email);
            router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (_) => false,
            );
          } catch (e) {
            setState(() {
              readOnly = false;
              String errorMessage = e.toString();
              if (errorMessage == "Incorrect password!") {
                passwordError = errorMessage;
                passwordFocusNode.requestFocus();
              } else {
                emailError = errorMessage;
                emailFocusNode.requestFocus();
              }
            });
          }
          setState(() {
            readOnly = false;
          });
        },
        validate: () {
          setState(() {
            readOnly = true;
          });
          Validator validator = Validator();
          emailError = validator.emailValidator(emailController.text);
          passwordError = validator.passwordValidator(passwordController.text);

          setState(() {});

          if (emailError == null && passwordError == null) {
            return true;
          } else {
            setState(() {
              readOnly = false;
            });
            return false;
          }
        },
      ),
    );
  }
}