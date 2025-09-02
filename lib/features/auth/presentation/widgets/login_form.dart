import 'package:flutter/material.dart';

import '../../../../config/routes/page_name.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/utils/keys_manager.dart';
import '../../../../core/utils/widgets/fields/password_fields.dart';
import '../../../../core/utils/widgets/fields/text_field/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0,
            children: [
              CustomTextFormField(
                controller: emailController,
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              PasswordFields(
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                passwordHint: 'Enter your password',
                confirmPasswordHint: 'Confirm your password',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;

                  CacheHelper.set(key: KeysManager.isLoggedIn, value: true);

                  Navigator.pushReplacementNamed(
                    context,
                    PageName.homeScreen,
                  );
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
