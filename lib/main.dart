import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanctuarysend/Layout/Otp_layout/otpdesktop_layout.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupdesktop_layout.dart';
import 'package:sanctuarysend/Layout/Signup_layout/signupmobi_layout.dart';
import 'package:sanctuarysend/Responsive/signin_breakpoint.dart';
import 'package:sanctuarysend/Responsive/signup_breakpoint.dart';

import 'Firebase/deeplink_handler.dart';
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
  runApp(MyApp());
  initUniLinks();
}

class MyApp extends StatelessWidget {
  final router = FluroRouter();
  MyApp({super.key}){
    router.define('/signin', handler: Handler(handlerFunc: (_, __) => SigninResponsiveLayout(
      mobileLayout: SignIn(router: router,),
      desktopLayout: const OtpDesktop(),
    )));
    router.define('/registration/:email', handler: Handler(handlerFunc: (_, params) {
      String email = params['email']?[0] ?? '';
      return SignupResponsiveLayout(mobileLayout: SignUpMobi(email: email), desktopLayout:
      const SignUpDesktop());
    }));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: router.generator,
      title: 'SanctuarySend',
      theme: ThemeData(
        fontFamily: 'montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SigninResponsiveLayout(
        mobileLayout: SignIn(router: router,),
        desktopLayout: const OtpDesktop(),
      ),
    );
  }
}
