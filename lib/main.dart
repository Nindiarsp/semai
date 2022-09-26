import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SecondScreen()),);
    });
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(98, 174, 53, 1.0),
        body: Center(
          child: Image.asset("assets/splashscreen (1).png", width: 500
            ,height: 500,),

              //color: Colors.lightGreen,
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreen();
}
class _SecondScreen extends State<SecondScreen> {
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen, fontFamily: 'Domine'),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    'assets/onboarding.png',
                    width: 300,
                    height: 300,
                  ),
                ),
                Container(
                    height: 55,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 21,
                      vertical: 42,
                    ),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MySimpleLogin()),
                          );
                          },
                        child: const Text(
                          "Mulai",
                          style: TextStyle(color: Colors.white, fontSize: 20,)
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySimpleLogin extends StatefulWidget {
  const MySimpleLogin({Key? key}) : super(key: key);

  @override
  State<MySimpleLogin> createState() => _MySimpleLoginState();
}

class _MySimpleLoginState extends State<MySimpleLogin> {
  var email = "";
  var password = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen, fontFamily: 'Domine'),
      title: "My ITK Dude",
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Image.asset(
                    "assets/login.png",
                    width: 150,
                    height: 150,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: const Text(
                    "Login Akun Anda",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Masukkan Email Anda",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => email = value),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                  width: double.infinity,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Masukkan Password Anda",
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => setState(() => password = value),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                Container(
                    height: 55,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 28,
                    ),
                    child: Builder(
                      builder: (context) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                          FocusScope.of(context).unfocus();
                          if (email.isEmpty || password.isEmpty) {
                            const message = 'Input Data Please';
                            const snackBar = SnackBar(
                              content: Text(
                                message,
                                style: TextStyle(fontSize: 20),
                              ),
                              backgroundColor: Colors.red,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            final message =
                                'Email: $email\nPassword: $password';
                            final snackBar = SnackBar(
                              content: Text(
                                message,
                                style: const TextStyle(fontSize: 20),
                              ),
                              backgroundColor: Colors.lightGreen,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text(
                          "Masuk",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),

                ),
                ),
                )],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Home", style: TextStyle(color: Colors.white, fontSize: 20),),
      actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.white,),
          onPressed: () {},
        ),
      ],
    ),
    body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.lightGreen),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Buah",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.lightGreen),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Sayur",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        Container(
          width: 50,
          height: 30,
          child: ElevatedButton(
            onPressed: () {},
            child: Image.asset(
              "assets/Vector (1).png",
            ),
          ),
        ),
      ],
    ),
  );
}
}

// RGB (98, 174, 53, 1.0) HIJAU TUA
// RGB (150, 213, 113, 1.0) HIJAU MUDA
// RGB (78, 100, 65, 1.0) ARMY
// RGB (180, 166, 48, 1.0) EMAS
// RGB (233, 90, 45, 1.0) MERAH ERROR
// RGB (178, 198, 166, 1.0) HIJAU PUCAT
