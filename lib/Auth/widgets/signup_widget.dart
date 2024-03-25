import 'package:et3am/Auth/cubits/auth_cubit.dart';
import 'package:et3am/Auth/cubits/auth_states.dart';
import 'package:et3am/Auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  DateTime selectedDate = DateTime(2001);
  String dropdownValue = "male";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
            onSaved: (value) {
              name = value;
            },
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            
            keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value;
              },
              validator: validateEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
              )),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () async {
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime(2001),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2010),
                  ).then((value) => setState(() => selectedDate = value!));
                },
                label: Text(
                  style: TextStyle(
                      color: Theme.of(context).textTheme.labelLarge!.color),
                  '${selectedDate.year}-${selectedDate.month}-${selectedDate.day.toString().padLeft(2, '0')}',
                ),
                icon: Icon(Icons.calendar_today,
                    color: Theme.of(context).iconTheme.color),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                items: ["male", "female"].map((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
            ],
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is SignUpLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SignUpFaildState) {
                return ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (states) => Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Text(
                    state.error,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge!.color,
                    ),
                  ),
                );
              } else {
                return ElevatedButton(
                  onPressed: () {
                    submitForm();
                  },
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  //     (state) => Theme.of(context).primaryColor,
                  //   ),
                  // ),
                  child: Text(
                    'Sign-Up',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleLarge!.color,
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

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form fields
      final UserModel user = UserModel(
        password: password!,
        birthDay: selectedDate.toString(),
        email: email!,
        gender: dropdownValue,
        name: name!,
      );
      // Dispatch the login action using the email and password
      BlocProvider.of<AuthCubit>(context).signUp(user);

      // Dispatch the login action using the email and password
    }
  }
}

class Final {}
