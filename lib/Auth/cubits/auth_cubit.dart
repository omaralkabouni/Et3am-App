import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:et3am/Auth/cubits/auth_states.dart';
import 'package:et3am/Auth/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitialState());
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  void login(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
     
    } catch (e) {
      emit(LoginFaildState(e.toString()));
    }
  }

  void signUp(UserModel user) async {
    emit(SignUpLoadingState());
    try {
      await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      
      await firebase.collection('users').doc(auth.currentUser!.uid).set({
        'name': user.name,
        'email': user.email,
        'gender': user.gender,
        'dateOfBirth': user.birthDay,
      });

    } catch (e) {
      emit(SignUpFaildState(e.toString()));
    }
  }
}
