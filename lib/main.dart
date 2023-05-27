import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:incubix/controller/auth_controller.dart';
import 'package:incubix/pages/home.dart';
import 'package:incubix/pages/login.dart';
import 'package:incubix/pages/register.dart';
import 'package:incubix/pages/splash.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 // FirebaseAuth _auth = FirebaseAuth.instance;
  final authC = AuthController();
 //
 // @override
 //  void initState() {
 //    super.initState();
 //    checkAuth();
 //  }
 //
 //  Future<void> checkAuth() async {
 //    User? user = _auth.currentUser;
 //    if (user != null) {
 //      Navigator.of(context).pushReplacementNamed('/home');
 //    } else {
 //      Navigator.of(context).pushReplacementNamed('/register');
 //    }
 //  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot){
        print(snapshot);
        return MaterialApp(debugShowCheckedModeBanner: false,
            home: SplashScreen(),
            routes: {
              '/login': (context) => LoginPage(),
              '/register': (context) => RegisterPage(),
              '/home': (context) => HomePage(),
            }
            );
      },
    );
  }
}
