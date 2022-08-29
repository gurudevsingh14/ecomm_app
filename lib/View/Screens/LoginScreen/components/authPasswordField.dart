import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';

class AuthPasswordField extends StatefulWidget {
  String? label;
  String? hintText;
  TextEditingController controller;
  AuthPasswordField({this.label, this.hintText, required this.controller});

  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Cannot be empty';
              } else if (value.length < 6) {
                return 'password length should be atleast 6';
              }
              return null;
            },
            obscureText: visible ? false : true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.orange.shade50,
              errorStyle: const TextStyle(color: Colors.redAccent),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              prefixIcon: Icon(
                Icons.lock_outline,
                size: 22,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                  icon: visible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
              hintText: widget.hintText!,
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
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent)),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ],
      ),
    );
  }
}
