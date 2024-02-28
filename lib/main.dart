import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Otp_layout/otpdesktop_layout.dart';
import 'package:sanctuarysend/Responsive/signin_breakpoint.dart';

import 'Layout/Signin_layout/signinmobi_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyBsMNSbrZH2zMjo0Ovx_4lelXQp7Lt6w3U',
      appId: '1:550624213594:web:cc6805e9e65af3a595b663',
      messagingSenderId: '550624213594',
      projectId: 'sanctuarysend',
      storageBucket: 'sanctuarysend.appspot.com',
    ));
  } else {
    await Firebase.initializeApp();
  }

  // await Firebase.initializeApp();

  // FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SanctuarySend',
      theme: ThemeData(
        fontFamily: 'montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SigninResponsiveLayout(
        mobileLayout: SignIn(),
        desktopLayout: OtpDesktop(),
      ),
    );
  }
}
