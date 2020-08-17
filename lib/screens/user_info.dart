import 'package:flutter/material.dart';
import 'package:sign_up/components/background.dart';
import 'package:sign_up/components/round_button.dart';
import 'package:sign_up/components/text_field_container.dart';
import 'package:sign_up/models/user.dart';

import '../colors.dart';

class UserInfo extends StatefulWidget {
  final User user;
  UserInfo(this.user);
  @override
  _UserInfoState createState() => _UserInfoState(user);
}

class _UserInfoState extends State<UserInfo> {
  User user;
  static var _gender = ['Male', 'Female', 'Other'];

  _UserInfoState(this.user);

  Widget buildName() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Name',
        border: InputBorder.none,
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value.trim().isEmpty) {
          return 'Name is reuired';
        }
      },
      onSaved: (String value) {
        user.name = value.trim();
      },
    );
  }

  Widget buildPhone() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Phone No.',
        border: InputBorder.none,
        icon: Icon(Icons.smartphone),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        value = value.trim();
        if (value.isEmpty) {
          return 'Phone No.is reuired';
        } else if (value.length < 10) {
          return 'Phone Number must be of 10 digits';
        }
        int phone = int.tryParse(value.trim());
        if (phone == null) {
          return 'Enter a valid phone number';
        }
      },
      onSaved: (String value) {
        user.phone = value;
      },
    );
  }

  Widget buildGender() {
    return ListTile(
      leading: Icon(Icons.wc),
      title: DropdownButton<String>(
        items: _gender.map((String dropDownItem) {
          return DropdownMenuItem<String>(
            child: Container(child: Text(dropDownItem)),
            value: dropDownItem,
          );
        }).toList(),
        onChanged: (genderSelected) {
          setState(() {
            user.gender = genderSelected;
          });
        },
        hint: Text('Gender'),
        value: user.gender,
      ),
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Background(),
      Center(
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6.0,
          margin: EdgeInsets.symmetric(horizontal: 28),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 48),
            child: Form(
              key: _formKey,
              child: Wrap(
                children: <Widget>[
                  Center(
                    child: Text(
                      'Complete Your Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(height: 22),
                  TextFieldContainer(child: buildName()),
                  TextFieldContainer(child: buildPhone()),
                  TextFieldContainer(child: buildGender()),
                  Container(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[],
                  ),
                  Center(
                      child: RoundButton(
                    textOnButton: 'COMPLETE SIGNUP',
                    onPressed: () {},
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
