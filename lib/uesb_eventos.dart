import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:provider/provider.dart';
import 'package:uesb_eventos/ui/pages/login/login_page.dart';
import 'package:uesb_eventos/utils/config/colors.dart';

class UesbEventos extends StatelessWidget {
  const UesbEventos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UesbEventos',
      theme: ThemeData.from(colorScheme: Palette.colors),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      navigatorKey: context.read<GlobalKey<NavigatorState>>(),
      home: const LoginPage(),
    );
  }
}
