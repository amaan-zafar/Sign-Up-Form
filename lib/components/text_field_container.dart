import 'package:flutter/material.dart';
import '../colors.dart';

class TextFieldContainer extends StatelessWidget {
  Widget child;
  TextFieldContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Card(
          shadowColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(padding: EdgeInsets.only(left: 14), child: child),
        ));
  }
}
