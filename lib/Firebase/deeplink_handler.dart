import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sanctuarysend/Layout/Signup_layout/signupdesktop_layout.dart';
// import 'package:sanctuarysend/Layout/Signup_layout/signupmobi_layout.dart';
import 'package:uni_links/uni_links.dart';

// import '../Responsive/signup_breakpoint.dart';


Future<void> initUniLinks() async {
  try {
    final initialLink = await getInitialLink();
    handleLink(initialLink!);
  } on PlatformException {
    // Handle exception
    // CustomToast.showToast(,"Hello, this is a custom toast!", Colors.white);
    Fluttertoast.showToast(
      gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        msg: 'error occurred',
    );
  }

  linkStream.listen((String? link) {
    handleLink(link!);
  }, onError: (err) {
    // Handle errors
    print('error occurred');
  });
}

void handleLink(String link) {
  if (link.isNotEmpty) {
    Uri uri = Uri.parse(link);
    if (uri.scheme == "sanctuarysend" && uri.host == "registration") {
      String? email = uri.queryParameters['email'];
      // Navigate to the desired screen with the extracted email parameter
      // Example: Navigator.pushNamed(context, '/screen', arguments: email);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupResponsiveLayout(mobileLayout: SignUpMobi(), desktopLayout: SignUpDesktop(),)));
    }
  }
}

