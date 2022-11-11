import 'package:uesb_eventos/core/models/usuario_model.dart';

import 'auth_result.dart';

abstract class RemoteService{
  Future<AuthResult> login(String user, String pass);
  Future<AuthResult> register(Map<String, dynamic> user);
  Future<void> logout();
  Future<Usuario> getUser();
}