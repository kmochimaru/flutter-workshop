library flutter_workshop.validators;

final String textEmptyInvalid = 'กรุณากรอกข้อมูล';
final String textFormatEmail = 'กรุณากรอกรูปแบบอีเมล';

validateIsEmpty(String value) {
  if (value.isEmpty) {
    return textEmptyInvalid;
  }
  return null;
}

validateEmail(String value) {
  if (value.isEmpty) {
    return null;
  } else {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return textFormatEmail;
    else
      return null;
  }
}

validatePhoneNumber(String value) {
  if (value.length != 10) {
    return 'กรุณากรอกเบอร์โทร 10 หลัก';
  }
  return null;
}
