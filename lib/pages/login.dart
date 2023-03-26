import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Navigator.pushNamed(context, '/home');
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
        color: Colors.white,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            inputEmail(),
            inputPassword(),
            login(),
            SizedBox(
              height: 180,
            ),
            footer()
          ],
        ),
      ),
    );
  }
}
