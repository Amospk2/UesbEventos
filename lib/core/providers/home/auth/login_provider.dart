import 'package:flutter/material.dart';
import '../../../models/auth_result.dart';
import '../../../models/remote_service.dart';

enum LoginState { idle, sucess, error, loading }

class LoginProvider extends ChangeNotifier {
  final RemoteService remoteService;
  LoginProvider({required this.remoteService});

  var loginstate = LoginState.idle;
  String? responseMSG;


  Future<void> auth(user) async {
    AuthResult response = await remoteService.login(user['email'], user['senha']);
    
    if (response.isSucess) {
      loginstate = LoginState.sucess;
    } else {
      loginstate = LoginState.error;
      responseMSG = response.msgError;
    }
    notifyListeners();
  }
}
