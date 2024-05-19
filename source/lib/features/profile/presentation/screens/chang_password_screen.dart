import 'package:auto_route/auto_route.dart';
import 'package:client/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:client/features/authentication/presentation/widgets/custom_text_field.dart';
import 'package:client/features/authentication/utils/validator.dart';
import 'package:client/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:client/core/local_storage.dart';

import '../../../create/presentation/widgets/custom_bottom_app_bar.dart';

@RoutePage()
class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final currentPasswordFocusNode = FocusNode();

  String? currentPasswordError;
  String? newPasswordError;
  String? confirmNewPasswordError;
  bool readOnly = false;
  LocalStorage localStorage = LocalStorage();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    currentPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Change Password",
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
                focusNode: currentPasswordFocusNode,
                onChange: () {
                  setState(() {
                    currentPasswordError = null;
                  });
                },
                readOnly: readOnly,
                obscureText: true,
                errorText: currentPasswordError,
                controller: currentPasswordController,
                helperText: 'Current Password',
                hintText: "Enter your current password",
              ),
              CustomTextFieldWidget(
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
                hintText: "Create your new password",
              ),
              CustomTextFieldWidget(
                onChange: () {
                  setState(() {
                    confirmNewPasswordError = null;
                  });
                },
                readOnly: readOnly,
                obscureText: true,
                errorText: confirmNewPasswordError,
                controller: confirmNewPasswordController,
                helperText: 'Confirm New Password',
                hintText: "Repeat your new password",
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
            LocalStorage localStorage = LocalStorage();
            String email = await localStorage.getUserInfo();
            
            AuthenticationUseCase authenticationUseCase = AuthenticationUseCase();
            await authenticationUseCase.changePassword(
              email,
              currentPasswordController.text.trim(),
              newPasswordController.text.trim(),
            );
            router.pushAndPopUntil(
              const ProfileRoute(),
              predicate: (_) => false,
            );
          } catch (e) {
            setState(() {
              readOnly = false;
              currentPasswordError = e.toString();
              currentPasswordFocusNode.requestFocus();
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
          if (currentPasswordError == null) {
            currentPasswordError = validator.passwordValidator(currentPasswordController.text);
            currentPasswordFocusNode.requestFocus();
            setState(() {
              currentPasswordError;
            });
          } else {
            currentPasswordFocusNode.requestFocus();
          }
          if (newPasswordError == null) {
            newPasswordError = validator.passwordValidator(newPasswordController.text);
            setState(() {
              newPasswordError;
            });
          }
          if (confirmNewPasswordError == null) {
            confirmNewPasswordError = validator.rePasswordValidator(newPasswordController.text, confirmNewPasswordController.text);
            setState(() {
              confirmNewPasswordError;
            });
          }
          if (currentPasswordError == null && newPasswordError == null && confirmNewPasswordError == null) {
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
