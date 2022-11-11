import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/core/providers/home/auth/login_provider.dart';
import 'package:uesb_eventos/core/providers/home/home_provider.dart';
import 'package:uesb_eventos/core/services/firebase/firebase_http_auth_service_imp.dart';
import 'package:uesb_eventos/uesb_eventos.dart';
import 'package:uesb_eventos/ui/pages/splash/splash_page.dart';
import 'core/providers/home/auth/register_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const SplashPage());

  await Future.wait([Firebase.initializeApp()]).then((value) => Future.delayed(
        const Duration(seconds: 3),
      ));

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => GlobalKey<NavigatorState>()),
      Provider(create: (_) => RemoteServiceImp()),
      ChangeNotifierProvider(
          create: (context) =>
              LoginProvider(remoteService: context.read<RemoteServiceImp>())),
      ChangeNotifierProvider(
          create: (context) => RegisterProvider(
              remoteService: context.read<RemoteServiceImp>())),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: const UesbEventos(),
  ));
}
