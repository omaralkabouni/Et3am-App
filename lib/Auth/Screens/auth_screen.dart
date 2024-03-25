import 'package:et3am/Auth/cubits/auth_cubit.dart';
import 'package:et3am/Auth/widgets/custom_appbar.dart';
import 'package:et3am/Auth/widgets/login_widget.dart';
import 'package:et3am/Auth/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _SplashState();
}

class _SplashState extends State<AuthScreen> {
  bool isLogin = true;
  Widget content = const LogInFormWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 15,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              const CustomAppBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          content = const LogInFormWidget();
                          isLogin = true;
                        });
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.labelLarge!.color,
                            fontSize: isLogin ? 25 : 15),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          content = const SignUpFormWidget();
                          isLogin = false;
                        });
                      },
                      child: Text('Sign_up',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.labelLarge!.color,
                              fontSize: !isLogin ? 25 : 15))),
                ],
              ),
              BlocProvider(
                create: (context) => AuthCubit(),
                child: content,
              )
            ],
          ),
        ));
  }
}
