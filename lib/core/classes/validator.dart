import 'package:form_field_validator/form_field_validator.dart';

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Name is required'),
  MinLengthValidator(3, errorText: "name must have at least two characters"),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: "email is required"),
  PatternValidator(r'(@)', errorText: 'email must have "@"'),
  PatternValidator('.com', errorText: 'email must have ".com"'),
]);

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be at least 8 characters'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'passwords must have at least one special character')
]);
