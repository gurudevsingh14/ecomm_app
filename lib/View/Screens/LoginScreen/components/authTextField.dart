import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';

class AuthTextField extends StatelessWidget {
  TextEditingController controller;
  String? hintText;
  Widget? prefix;
  String? Function(String?)? validator;
  AuthTextField(
      {this.hintText, required this.controller, this.validator, this.prefix});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orange.shade50,
              prefixIcon: prefix,
              errorStyle: const TextStyle(color: Colors.redAccent),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              alignLabelWithHint: true,
              hintText: hintText!,
              hintStyle: TextStyle(
                color: mutedTextColor,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: mutedLineColor,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.5,
                    color: mutedLineColor,
                  ),
                  borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ],
      ),
    );
  }
}
