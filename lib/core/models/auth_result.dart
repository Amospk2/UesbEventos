import 'package:firebase_auth/firebase_auth.dart';

class AuthResult{
  final String? msgError;
  final UserCredential? user;
  AuthResult({this.msgError, this.user});


  bool get isSucess => msgError == null;
}