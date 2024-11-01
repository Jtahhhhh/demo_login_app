import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/colors.dart';
import '../../../core/routers/routes.dart';
import '../controller/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.isDarkMode ? ColorConfig.backgroundColorDark : ColorConfig.backgroundColorLight,
        bottomNavigationBar: _registerText(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _loginText(),
                const SizedBox(height: 50),
                _inputField(
                  hintText: 'Full Name',
                  onSaved: (value) => controller.fullName = value ?? '',
                ),
                const SizedBox(height: 20),
                _inputField(
                  hintText: 'Password',
                  obscureText: true,
                  onSaved: (value) => controller.password = value ?? '',
                ),
                const SizedBox(height: 30),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginText() {
    return Column(
      children: [
        Image.asset(
          'assets/pictures/logo.png',
          height: 100,
          width: 100,
        ),
        const SizedBox(height: 20),
        Text(
          'Welcome Back!',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: ColorConfig.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Login to your account',
          style: TextStyle(
            fontSize: 16,
            color: ColorConfig.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Widget _inputField({
    required String hintText,
    required Function(String?) onSaved,
    bool obscureText = false,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: ColorConfig.hintTextColor),
        filled: true,
        fillColor: ColorConfig.inputFillColor.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        prefixIcon: Icon(
          hintText == 'Password' ? Icons.lock : Icons.person,
          color: ColorConfig.iconColorSecondary,
        ),
      ),
      obscureText: obscureText,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $hintText';
        }
        return null;
      },
    );
  }

  Widget _loginButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: ColorConfig.buttonBackground,
          shadowColor: ColorConfig.buttonShadow.withOpacity(0.4),
          elevation: 8,
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            await controller.login();
          }
        },
        child: const Text(
          'Login',
          style: TextStyle(
            color: ColorConfig.textPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _registerText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don’t have an account?',
            style: TextStyle(fontSize: 14, color: ColorConfig.textSecondaryColor),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.register),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: ColorConfig.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
