import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uesb_eventos/core/models/auth_result.dart';
import 'package:uesb_eventos/core/models/remote_service.dart';
import 'package:uesb_eventos/core/models/usuario_model.dart';

class RemoteServiceImp implements RemoteService {
  final auth = FirebaseAuth.instance;
  final create = FirebaseFirestore.instance;

  @override
  Future<AuthResult> login(String user, String pass) async {
    try {
      var result =
          await auth.signInWithEmailAndPassword(email: user, password: pass);
      return result.user != null
          ? AuthResult(user: result)
          : AuthResult(msgError: "Não foi possivel realizar o login.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthResult(msgError: "Usuário não encontrado.");
      } else if (e.code == 'wrong-password') {
        return AuthResult(msgError: "Senha incorreta.");
      }
    }

    return AuthResult(msgError: "Falha na authentificação, verifique sua conexão de internet.");
  }

  @override
  Future<AuthResult> register(user) async {
    var result = await _registerUserWithEmailAndPassword(user);

    if (result.isSucess) {
      await create.collection("users").doc(result.user!.user!.uid).set(user);
      return result;
    } else {
      return result;
    }
  }

  Future<AuthResult> _registerUserWithEmailAndPassword(user) async {
    try {
      if(!await isCPFInUse(user["CPF"]))
      {
        var result = await auth.createUserWithEmailAndPassword(
          email: user['email'], password: user['senha']);
        return result.user != null
          ? AuthResult(user: result)
          : AuthResult(msgError: "Não foi possivel realizar o login.");
      } else {
        return AuthResult(msgError: "CPF Já está sendo utilizado.");
      }
      
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return AuthResult(msgError: "Esse email já esta em uso.");
      } else if (e.code == 'weak-password') {
        return AuthResult(msgError: "Senha informada é muito fraca.");
      }
    } catch (e) {
      return AuthResult(msgError: e.toString());
    }

    return AuthResult(msgError: "Falha no cadastro, verifique sua conexão de internet.");
  }

  @override
  Future<void> logout() async {
    auth.signOut();
  }

  @override
  Future<Usuario> getUser() async {
    return Usuario(auth.currentUser!.uid, auth.currentUser!.email!);
  }

  Future<bool> isCPFInUse(String cpf) async
  {
    var result = await create
        .collection("users")
        .where("CPF", isEqualTo: cpf)
        .get();

    if(result.docs.isEmpty)
    {
      return false;
    }
    else
    {
      return true;
    }

  }
}
