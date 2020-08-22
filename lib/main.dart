import 'package:flutter/material.dart';
import 'package:sign_up/screens/user_credentials.dart';
import 'colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        iconTheme: IconThemeData(color: kPrimaryColor),
      ),
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
