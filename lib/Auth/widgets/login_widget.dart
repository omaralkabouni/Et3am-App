import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:et3am/Auth/cubits/auth_cubit.dart';
import 'package:et3am/Auth/cubits/auth_states.dart';

class LogInFormWidget extends StatefulWidget {
  const LogInFormWidget({Key? key}) : super(key: key);

  @override
  State<LogInFormWidget> createState() => _LogInFormWidgetState();
}

class _LogInFormWidgetState extends State<LogInFormWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) {
              email = value;
            },
            validator: validateEmail,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is LoginLoadingState) {
                return const CircularProgressIndicator();
              }
              else if (state is LoginFaildState) {
                return ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                  child: Text(
                    state.error,
                  ),
                );
              }
               else {
                return ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                 
                  child:  Text(
                    'Login',
                   style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge!.color,
                   ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form fields

      // Dispatch the login action using the email and password
      BlocProvider.of<AuthCubit>(context).login(email!, password!);
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return 'Please enter a password with at least 8 characters';
    }

    return null;
  }
}
