import 'package:flutter/material.dart';

import 'package:trascan/page/login_register/welcome_page.dart';
import 'package:trascan/service/providers/profil/profil_provider.dart';
import 'package:trascan/service/providers/riwayat/riwayat_provider.dart';

import 'package:trascan/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfilProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RiwayatProvider(),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context); //???
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: const ColorScheme.light().copyWith(
              background: Colors.white,
            ),
          ),
          home: const WelcomePage(),
        ),
      ),
    );
  }
}
