class AuthState {}

class LoginInitialState extends AuthState {}

class LoginenticatedState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginFaildState extends AuthState {
  final String error;
  LoginFaildState(this.error);
}

class SignUpInitalState extends AuthState {}

class SignUpAuthenticatedState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpFaildState extends AuthState {
  final String error;
  SignUpFaildState(this.error);
}
