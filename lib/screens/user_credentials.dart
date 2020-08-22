import 'package:flutter/material.dart';
import 'package:sign_up/components/background.dart';
import 'package:sign_up/components/card.dart';
import 'package:sign_up/components/round_button.dart';
import 'package:sign_up/components/social_sites_container.dart';
import 'package:sign_up/components/text_field_container.dart';
import 'package:sign_up/models/user.dart';
import 'package:sign_up/screens/user_info.dart';

import '../colors.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User user = User();
  TextEditingController _passController = TextEditingController();
  bool _passObscureText = true;
  bool _confirmPassObscureText = true;

  void _togglePassVisibility() {
    setState(() {
      _passObscureText = !_passObscureText;
    });
  }

  void _toggleConfirmPassVisibility() {
    setState(() {
      _confirmPassObscureText = !_confirmPassObscureText;
    });
  }

  Widget _buildEmail() {
    return TextFieldContainer(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          border: InputBorder.none,
          icon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.trim().isEmpty) {
            return 'Email is reuired';
          }
          if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return 'Enter a valid email address';
          }
        },
        onSaved: (String value) {
          user.email = value.trim();
        },
      ),
    );
  }

  Widget _buildPassword() {
    return TextFieldContainer(
      child: TextFormField(
        controller: _passController,
        decoration: InputDecoration(
          hintText: 'Password',
          border: InputBorder.none,
          icon: Icon(Icons.lock),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _togglePassVisibility();
              });
            },
            child: _passObscureText == true
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          ),
        ),
        obscureText: _passObscureText,
        validator: (value) {
          if (value.isEmpty) {
            return 'Password is reuired';
          }
          if (value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return TextFieldContainer(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        border: InputBorder.none,
        icon: Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _toggleConfirmPassVisibility();
            });
          },
          child: _confirmPassObscureText == true
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
      ),
      obscureText: _confirmPassObscureText,
      validator: (value) {
        if (value.isEmpty) return 'Confirm your password';
        if (_passController.text != value) return 'Passwords do not match';
        return null;
      },
      onSaved: (String value) {
        user.password = value;
      },
    ));
  }

  Widget _buildCreateAccountBtn() {
    return Center(
        child: RoundButton(
      textOnButton: 'CREATE ACCOUNT',
      onPressed: () {
        if (!_formKey.currentState.validate()) {
          return;
        } else {
          _formKey.currentState.save();
          navigateToUserInfo(user);
        }
      },
    ));
  }

  Widget _buildSignUpUsingText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 8),
          Text('-OR-', style: TextStyle(fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text('Sign up using',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                  fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildSocialSites() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              debugPrint('Google clicked');
            },
            child: SocialSitesContainer('images/google.png')),
        SizedBox(width: 12),
        GestureDetector(
            onTap: () {
              debugPrint('Facebook clicked');
            },
            child: SocialSitesContainer('images/Facebook-png.png')),
        SizedBox(width: 12),
        GestureDetector(
            onTap: () {
              debugPrint('GitHub clicked');
            },
            child: SocialSitesContainer('images/GitHub-Mark.png')),
      ],
    );
  }

  void navigateToUserInfo(User user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return UserInfo(user);
    }));
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        Background(),
        Center(
          child: CustomCard(
            child: Form(
              key: _formKey,
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Container(height: 22),
                  _buildEmail(),
                  _buildPassword(),
                  _buildConfirmPassword(),
                  Container(height: 22),
                  _buildCreateAccountBtn(),
                  _buildSignUpUsingText(),
                  Container(height: 22),
                  _buildSocialSites(),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
