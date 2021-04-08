import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

// Mandar información o mantener la información global en toda la app.

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Recuperar los datos del Stream;
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);
  
  Stream<bool> get formValidStream => Rx.combineLatest2(emailStream, passwordStream, (email, pass) => true);
  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
