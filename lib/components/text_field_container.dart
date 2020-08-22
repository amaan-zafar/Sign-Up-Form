import 'package:flutter/material.dart';
import '../colors.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  TextFieldContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Card(
        shadowColor: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 2,
        child: Padding(padding: EdgeInsets.only(left: 14), child: child),
      ),
    );
  }
}
