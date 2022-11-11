import 'package:flutter/material.dart';
import '../../../models/auth_result.dart';
import '../../../models/remote_service.dart';

enum RegisterState { idle, sucess, error, loading }

class RegisterProvider extends ChangeNotifier {
  final RemoteService remoteService;
  RegisterProvider({required this.remoteService});

  var registerstate = RegisterState.idle;
  String? responseMSG;


  Future<void> create(user) async {
    AuthResult response =
        await remoteService.register(user);
    if (response.isSucess) {
      registerstate = RegisterState.sucess;
    } else {
      registerstate = RegisterState.error;
      responseMSG = response.msgError;
    }
    notifyListeners();
  }
}
