import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/colors.dart';
import '../../../core/data/model/role_respone_model.dart';
import '../../../core/routers/routes.dart';
import '../controller/register_page_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final RegisterController controller = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: context.isDarkMode ? ColorConfig.backgroundColorDark : ColorConfig.backgroundColorLight,
        bottomNavigationBar: _signinText(context),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _registerText(),
                const SizedBox(height: 50),
                _inputField(
                  hintText: 'Full Name',
                  icon: Icons.person_outline,
                  onSaved: (value) => controller.fullName = value ?? '',
                ),
                const SizedBox(height: 20),
                _inputField(
                  hintText: 'Password',
                  icon: Icons.lock_outline,
                  obscureText: true,
                  onSaved: (value) => controller.password = value ?? '',
                ),
                const SizedBox(height: 20),
                _roleDropdown(),
                const SizedBox(height: 30),
                _registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerText() {
    return Column(
      children: [
        const Icon(
          Icons.person_add_alt_1_outlined,
          size: 80,
          color: ColorConfig.primaryColor,
        ),
        const SizedBox(height: 20),
        Text(
          'Create Account',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: ColorConfig.primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'Please fill in the details below',
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
    IconData? icon,
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
          icon,
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

  Widget _roleDropdown() {
    return Obx(() {
      return DropdownButtonHideUnderline(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: ColorConfig.inputFillColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: ColorConfig.inputBorderColor),
          ),
          child: DropdownButton<RoleResponeModel>(
            value: controller.choosenRole.value,
            hint: const Text("Select Role"),
            items: controller.roles.map((role) {
              return DropdownMenuItem(
                value: role,
                child: Text(role.roleName),
              );
            }).toList(),
            onChanged: (selectedRole) {
              controller.choosenRole.value = selectedRole;
            },
          ),
        ),
      );
    });
  }

  Widget _registerButton() {
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            controller.register();
          }
        },
        child: const Text(
          'Regiter',
          style: TextStyle(
            color: ColorConfig.textPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(fontSize: 14, color: ColorConfig.textSecondaryColor),
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.login),
            child: const Text(
              'Sign In',
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
