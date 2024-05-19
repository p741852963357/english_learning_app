import 'package:auto_route/auto_route.dart';
import 'package:client/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:client/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:client/features/authentication/utils/validator.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../create/presentation/widgets/custom_bottom_app_bar.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  final emailFocusNode = FocusNode();

  String? emailError;
  String? passwordError;
  String? rePasswordError;
  bool readOnly = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
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
                hintText: "example@email.com",
              ),
              CustomTextFieldWidget(
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
                hintText: "Create your password",
              ),
              CustomTextFieldWidget(
                onChange: () {
                  setState(() {
                    rePasswordError = null;
                  });
                },
                readOnly: readOnly,
                obscureText: true,
                errorText: rePasswordError,
                controller: rePasswordController,
                helperText: 'Confirm password',
                hintText: "Repeat your password",
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
            await authenticationUseCase.createUser(emailController.text.trim(), passwordController.text.trim());
            router.pushAndPopUntil(
              const AuthenticationRoute(),
              predicate: (_) => false,
            );
          } catch (e) {
            setState(() {
              readOnly = false;
              emailError = e.toString();
              emailFocusNode.requestFocus();
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
          if (emailError == null) {
            emailError = validator.emailValidator(emailController.text);
            emailFocusNode.requestFocus();
            setState(() {
              emailError;
            });
          } else {
            emailFocusNode.requestFocus();
          }
          if (passwordError == null) {
            passwordError = validator.passwordValidator(passwordController.text);
            setState(() {
              passwordError;
            });
          }
          if (rePasswordError == null) {
            rePasswordError = validator.rePasswordValidator(passwordController.text, rePasswordController.text);
            setState(() {
              rePasswordError;
            });
          }
          if (emailError == null && passwordError == null && rePasswordError == null) {
            return true;
          }
          setState(() {
            readOnly = false;
          });
          return false;
        },
      ),
    );
  }
}
