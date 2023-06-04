import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:incubix/bloc/login/login_cubit.dart';
import 'package:incubix/pages/home.dart';
import 'package:incubix/pages/phone_auth_screen.dart';
import 'package:incubix/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = true;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential).then(
        (value) async => await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/logo.png"),
            Text(
              "Welcome Back, ",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign in to continue",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "E-mail",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff323465)),
                ),
                child: Center(
                  child: TextField(
                    controller: emailEdc,
                    decoration:
                        InputDecoration.collapsed(hintText: "masukan e-mail"),
                  ),
                ))
          ],
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xff323465)),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: passEdc,
                          obscureText: true,
                          decoration: InputDecoration.collapsed(
                              hintText: "masukan password"),
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.remove_red_eye))
                    ],
                  ),
                ))
          ],
        ),
      );
    }

    Widget login() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Forgot passwod?",
              style: TextStyle(color: Color(0xff323465)),
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<LoginCubit>()
                    .login(email: emailEdc.text, password: passEdc.text);

                // Navigator.pushNamed(context, '/home');
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff323465),
                ),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New user ?",
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff323465)),
                ))
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('Loading..')));
            }
            if (state is LoginFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.msg),
                  backgroundColor: Colors.red,
                ));
            }
            if (state is LoginSuccess) {
              // context.read<AuthCubit>().loggedIn();
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(state.msg),
                  backgroundColor: Colors.green,
                ));
              Navigator.pushNamedAndRemoveUntil(
                  context, rHome, (route) => false);
            }
          },
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              inputEmail(),
              inputPassword(),
              login(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      signInWithGoogle();
                    },
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://img2.pngdownload.id/20190228/qby/kisspng-google-logo-google-account-g-suite-google-images-g-icon-archives-search-png-5c77ad39b77471.9286340315513470017515.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhoneAuthScreen()));
                    },
                    child: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://freepngimg.com/thumb/business/83615-blue-icons-symbol-telephone-computer-logo.png'),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 180,
              ),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
