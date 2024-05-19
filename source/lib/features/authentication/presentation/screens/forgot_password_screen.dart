import 'package:auto_route/auto_route.dart';
import 'package:client/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:client/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:client/features/authentication/utils/validator.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../../../create/presentation/widgets/custom_bottom_app_bar.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final otpFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  String? emailError;
  String? otpError;
  String? newPasswordError;
  String? confirmPasswordError;
  bool readOnly = false;

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    otpFocusNode.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
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
              ElevatedButton(
                onPressed: () async {
                  AutoRouter.of(context);
                  try {
                    AuthenticationUseCase authenticationUseCase = AuthenticationUseCase();
                    await authenticationUseCase.generateOTP(emailController.text.trim());
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
                child: const Text('Generate OTP'),
              ),
              CustomTextFieldWidget(
                focusNode: otpFocusNode,
                onChange: () {
                  setState(() {
                    otpError = null;
                  });
                },
                readOnly: readOnly,
                errorText: otpError,
                controller: otpController,
                helperText: 'OTP',
                hintText: "Enter OTP",
              ),
              CustomTextFieldWidget(
                focusNode: newPasswordFocusNode,
                onChange: () {
                  setState(() {
                    newPasswordError = null;
                  });
                },
                readOnly: readOnly,
                obscureText: true,
                errorText: newPasswordError,
                controller: newPasswordController,
                helperText: 'New Password',
                hintText: "Enter new password",
              ),
              CustomTextFieldWidget(
                focusNode: confirmPasswordFocusNode,
                onChange: () {
                  setState(() {
                    confirmPasswordError = null;
                  });
                },
                readOnly: readOnly,
                obscureText: true,
                errorText: confirmPasswordError,
                controller: confirmPasswordController,
                helperText: 'Confirm Password',
                hintText: "Repeat new password",
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
            await authenticationUseCase.resetPassword(
              emailController.text.trim(),
              otpController.text.trim(),
              newPasswordController.text.trim(),
            );
            router.pushAndPopUntil(
              const AuthenticationRoute(),
              predicate: (_) => false,
            );
          } catch (e) {
            setState(() {
              readOnly = false;
              if (e.toString() == "Invalid OTP." || e.toString() == "OTP expired. Please request a new one.") {
                otpError = e.toString();
                otpFocusNode.requestFocus();
              } else {
                emailError = e.toString();
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
          if (emailError == null) {
            emailError = validator.emailValidator(emailController.text);
            emailFocusNode.requestFocus();
            setState(() {
              emailError;
            });
          } else {
            emailFocusNode.requestFocus();
          }
          // Kiểm tra OTP
          if (otpError == null) {
            otpError = validator.otpValidator(otpController.text);
            otpFocusNode.requestFocus();
            setState(() {
              otpError;
            });
          } else {
            otpFocusNode.requestFocus();
          }
          if (newPasswordError == null) {
            newPasswordError = validator.passwordValidator(newPasswordController.text);
            newPasswordFocusNode.requestFocus();
            setState(() {
              newPasswordError;
            });
          } else {
            newPasswordFocusNode.requestFocus();
          }
          if (confirmPasswordError == null) {
            confirmPasswordError = validator.rePasswordValidator(newPasswordController.text, confirmPasswordController.text);
            confirmPasswordFocusNode.requestFocus();
            setState(() {
              confirmPasswordError;
            });
          } else {
            confirmPasswordFocusNode.requestFocus();
          }
          if (emailError == null && otpError == null && newPasswordError == null && confirmPasswordError == null) {
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
