import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final Widget? icon;
  final Widget? label;
  Widget? labelFinal;
  final double? height;
  bool isObscure;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final String? initialValue;
  final int? maxLines;

  bool readOnly;
  TextEditingController? customTextController = TextEditingController();
  String? Function(String?)? validator;

  CustomTextField({
    super.key,
    this.icon,
    this.label,
    this.isObscure = false,
    this.inputFormatters,
    this.inputType,
    this.initialValue,
    this.readOnly = false,
    this.customTextController,
    this.validator,
    this.height,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.labelFinal = widget.label;
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      setState(() {
        widget.labelFinal = null;
      });
    } else {
      setState(() {
        widget.labelFinal = widget.label;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = widget.isObscure.obs;

    return Center(
      child: Obx(
        () => TextFormField(
          //style: const TextStyle(fontSize: 15),

          maxLines: widget.maxLines,
          focusNode: _focus,
          validator: widget.validator,
          controller: widget.customTextController,
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          keyboardType: widget.inputType,
          inputFormatters: widget.inputFormatters,
          obscureText: obscureText.value,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: widget.height ?? 60, minHeight: widget.height ?? 60),
            isDense: false,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromRGBO(146, 149, 158, 1), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color.fromRGBO(146, 149, 158, 1), width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            errorStyle: const TextStyle(
              fontSize: 12,
            ),
            prefixIcon: widget.icon,
            suffixIcon: widget.isObscure == true
                ? IconButton(
                    onPressed: () {
                      obscureText.value = !obscureText.value;
                    },
                    icon: obscureText.value == true ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off))
                : null,
            label: widget.customTextController!.text == "" ? widget.labelFinal : null,
          ),
        ),
      ),
    );
  }
}
