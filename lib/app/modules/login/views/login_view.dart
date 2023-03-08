import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

import '../../../data/shared/widgets/customTextField.dart';
import '../../../data/shared/widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.loginformKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.size.height,
            child: Column(
              children: [
                SizedBox(
                  height: Get.size.height * 0.30,
                ),
                SvgPicture.asset(
                  controller.assetName,
                  height: 50,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomTextField(
                    customTextController: controller.controllerLogin,
                    validator: Validatorless.multiple([
                      Validatorless.required('O campo e obrigatorio'),
                    ]),
                    height: 60,
                    icon: const Icon(
                      Icons.email_outlined,
                      size: 24,
                    ),
                    label: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomTextField(
                    isObscure: true,
                    validator: Validatorless.multiple([Validatorless.required('O campo e obrigatorio')]),
                    customTextController: controller.controllerPassword,
                    height: 60,
                    icon: const Icon(
                      Icons.lock_outline,
                      size: 24,
                    ),
                    label: const Text(
                      "Senha",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                ),
                CustomButton(
                  label: "ACESSAR",
                  onPressed: () {
                    controller.login();
                  },
                  widith: Get.size.width,
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
