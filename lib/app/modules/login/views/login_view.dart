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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: controller.percentHeight(.30),
                ),
                SvgPicture.asset(controller.assetName,
                    colorFilter: ColorFilter.mode(
                        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor, BlendMode.srcIn),
                    semanticsLabel: 'A red up arrow'),
                const SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomTextField(
                    customTextController: controller.controllerLogin,
                    validator: Validatorless.multiple(
                        [Validatorless.email('Email invalido'), Validatorless.required('O campo e obrigatorio')]),
                    height: 60 /* controller.loginformKey.currentState!.validate() ? 60 : 70 */,
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
                    Navigator.of(context).popAndPushNamed('/home');
                  },
                  widith: controller.screenWidith,
                  height: 60,
                ),
              ],
            ),
          ),
        ));
  }
}
