import 'package:app_flutter_arch/app/core/ui/styles/colors_app.dart';
import 'package:app_flutter_arch/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class GenericInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final double? width;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Function(String)? onFieldSubmitted;

  const GenericInput({
    super.key,
    required this.label,
    required this.placeholder,
    this.width,
    this.isPassword = false,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textStyles.textInputLabel.copyWith(
              color: ColorsApp.instance.white,
            ),
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: width,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0), // Border radius
                ),
                contentPadding: const EdgeInsets.all(20),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: ColorsApp.instance.orange,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: ColorsApp.instance.white,
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: ColorsApp.instance.gray,
                ),
              ),
              focusNode: focusNode,
              obscureText: isPassword ? true : false,
              onFieldSubmitted: (term) {
                nextFocusNode?.requestFocus();
                if (onFieldSubmitted != null) onFieldSubmitted!(term);
              },
            ),
          ),
        ],
      ),
    );
  }
}
