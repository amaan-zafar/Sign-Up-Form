class User {
  String _name;
  String _email;
  String _password;
  String _phone;
  String _gender = 'Other';

  String get name => _name;

  set name(String value) => _name = value;

  String get email => _email;

  set email(String value) => _email = value;

  String get password => _password;

  set password(String value) => _password = value;

  String get phone => _phone;

  set phone(String value) => _phone = value;

  String get gender => _gender;

  set gender(String value) => _gender = value;
}
