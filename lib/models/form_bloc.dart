import 'package:rx_dart/models/form_validation.dart';
import 'package:rxdart/rxdart.dart';

class FormBlock with Validation {
  BehaviorSubject<String> email = BehaviorSubject<String>.seeded('@');
  BehaviorSubject<String> name = BehaviorSubject<String>.seeded('name');
  BehaviorSubject<String> password = BehaviorSubject<String>.seeded('password');

  Stream<String> get email$ => email.stream.transform(emailValidation);
  Sink<String> get inEmail => email.sink;

  Stream<String> get name$ => name.stream.transform(nameValidation);
  Sink<String> get inName => name.sink;

  Stream<String> get password$ => password.stream.transform(passwordValidation);
  Sink<String> get inPassword => password.sink;

  Stream<bool> get isFormValid$ =>
      CombineLatestStream([name$, email$, password$], (values) => true);

  void sendData() {
    //Handle data with the backend
    print(name.value);
    print(email.value);
    print(password.value);
  }
}
