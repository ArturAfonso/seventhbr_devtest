import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double? widith;
  final double? height;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.widith,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widith,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
            /*   backgroundColor: MaterialStateProperty.all(
                Get.isDarkMode ? Theme.of(context).primaryColor : Theme.of(context).focusColor), */
            shape: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)));
          }
          return const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)));
        })),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
