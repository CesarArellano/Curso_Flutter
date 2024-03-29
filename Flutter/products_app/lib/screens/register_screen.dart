import 'package:flutter/material.dart';
import 'package:products_app/helpers/snack_alert.dart';
import 'package:products_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:products_app/providers/login_form_provider.dart';
import 'package:products_app/ui/input_decorations.dart';
import 'package:products_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Scaffold(
        body: AuthBackground(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.28),
                  CardContainer(
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text('Registro', style: Theme.of(context).textTheme.headlineMedium),
                        const SizedBox(height: 15),
                        const _LoginForm()
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.deepPurple, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10) )
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('¿Ya tienes cuenta?', style: TextStyle( color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w400 )),
                    ),
                    onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final loginForm = Provider.of<LoginFormProvider>(context);

    return SizedBox(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              cursorColor: Colors.deepPurple,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Email',
                labelText: 'Correo Electrónico',
                icon: Icons.alternate_email_sharp
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);
                return regExp.hasMatch(value ?? '') ? null : 'El valor ingresado no es un correo';
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              cursorColor: Colors.deepPurple,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '****',
                labelText: 'Contraseña',
                icon: Icons.lock
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres';
              },
            ),

            const SizedBox(height: 30),

            MaterialButton(
              shape: const StadiumBorder(),
              disabledColor: Colors.deepPurple[400],
              color: Colors.deepPurple,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: loginForm.isLoading 
                  ? const CircularProgressIndicator( color: Colors.white )
                  : const Text('Login', style: TextStyle(color: Colors.white),),
              ),
              onPressed: loginForm.isLoading 
                ? null 
                : () async {
                  
                  FocusScope.of(context).unfocus();

                  if ( !loginForm.validateForm() ) return;
                  final authProvider = Provider.of<AuthProvider>(context, listen: false);
                  
                  loginForm.isLoading = true;

                  final String? errorMsg = await authProvider.createUser(loginForm.email, loginForm.password);
                  
                  loginForm.isLoading = false;

                  if( errorMsg != null ) {
                    return snackAlert(context, errorMsg);
                  }

                  Navigator.pushReplacementNamed(context, 'home');
                }
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}