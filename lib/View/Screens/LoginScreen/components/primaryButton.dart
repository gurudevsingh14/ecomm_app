import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  double? height;
  double? width;
  double? fontSize;
  VoidCallback? callBack;
  PrimaryButton(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      this.fontSize,
      this.callBack});
  VoidCallback nothing = () {};
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width!,
      child: MaterialButton(
          onPressed: callBack ?? nothing,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          height: height!,
          color: primaryColor,
          //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: fontSize),
          )),
    );
  }
}
