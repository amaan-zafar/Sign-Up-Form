import 'package:flutter/material.dart';
import '../colors.dart';

class RoundButton extends StatelessWidget {
  final Function onPressed;
  final String textOnButton;

  RoundButton({this.textOnButton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Text(textOnButton, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
