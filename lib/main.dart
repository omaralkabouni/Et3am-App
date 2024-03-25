import 'package:et3am/Auth/Screens/auth_screen.dart';
import 'package:et3am/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        primaryColor: const Color.fromARGB(255, 224, 7, 7)
      ), 
      home: StreamBuilder(
        stream: auth.authStateChanges(),

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return   Scaffold(
              appBar: AppBar(
                title: const Text('Home')
              ),
                body: Center(
              child: IconButton(onPressed: (){

                auth.signOut();
              }, icon:const Icon(Icons.logout))));
            
          } else {
            return const AuthScreen();
          }
        },
        // this
      ),
    );
  }
}
