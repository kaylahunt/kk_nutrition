import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaylaknows_nutrition/screens/sign_up_page.dart';
import 'package:kaylaknows_nutrition/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kaylaknows_nutrition/screens/home.dart';

final auth = FirebaseAuth.instance;
User user = auth.currentUser!;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late String email, password;
  bool _validatePass = false;
  bool _validateEmail = false;
  String errorMessage = "";
  //final auth = FirebaseAuth.instance;
  bool _passwordVisible = true;
  final passwordController = TextEditingController();

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.cyan.shade700,
          Colors.cyan.shade300,
          Colors.cyanAccent
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/sign-in.png",
                width: double.infinity, height: 200),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Text(Constants.textSignInTitle,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w300)),
                      SizedBox(
                        height: 1,
                      ),
                      Center(
                        child: Text(
                          Constants.textSmallSignIn,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 13),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 25,
                          offset: Offset(0, 10))
                    ]),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      child: TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.mail),
                                          hintText: "Email Address",
                                          hintStyle:
                                              TextStyle(color: Colors.black45),
                                          border: InputBorder.none,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            email = value.trim();
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              !_validateEmail
                                  ? Container()
                                  : Text(
                                      errorMessage,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      child: TextFormField(
                                        controller: passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: !_passwordVisible,
                                        //This will obscure text dynamically
                                        decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.lock),
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                              color: Colors.black45),
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            icon: Icon(
                                              // Based on passwordVisible state choose the icon
                                              _passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.black45,
                                            ),
                                            onPressed: () {
                                              // Update the state i.e. toogle the state of passwordVisible variable
                                              setState(() {
                                                _passwordVisible =
                                                    !_passwordVisible;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              !_validatePass
                                  ? Container()
                                  : Text(
                                      errorMessage,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                            ],
                          ),
                        ),
                        // Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       const Text("Forgot Password?"),
                        //       GestureDetector(
                        //         onTap: () {
                        //           Navigator.pushReplacement(
                        //               context,
                        //               MaterialPageRoute(
                        //                   builder: (context) => const ResetScreen()));
                        //         },
                        //         child: Text("To Reset Click Here!",
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.w700,
                        //               color: Colors.cyan.shade500,
                        //             )),
                        //       )
                        //     ]),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            password = passwordController.text;
                            _signin(email, password);
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 75),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.cyan.shade500,
                                border: Border.all(color: Colors.black12),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 4)
                                ]),
                            child: const Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        buildRowDivider(size: size),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text("Don't have an account?"),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                child: Text("Register now",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.cyan.shade500,
                                    )),
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRowDivider({required Size size}) {
    return SizedBox(
      width: size.width * 0.8,
      child: Row(children: const <Widget>[
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "or",
              style: TextStyle(color: Colors.grey),
            )),
        Expanded(child: Divider(color: Colors.grey)),
      ]),
    );
  }

  _signin(String _email, String _password) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((_) async {
        user = auth.currentUser!;
        if (user.emailVerified) {
          late String role;
          var collection = FirebaseFirestore.instance.collection('userdata');
          var querySnapshot = await collection.get();
        }
        // else {
        //   Fluttertoast.showToast(
        //       msg: "Please verify your email before signing-in",
        //       gravity: ToastGravity.TOP);
        // }
      });
    } on FirebaseAuthException catch (error) {
      errorMessage = error.message.toString();
      setState(() {
        if (errorMessage ==
            "The password is invalid or the user does not have a password.") {
          errorMessage = "Invalid Password";
          _validatePass = true;
          _validateEmail = false;
        } else {
          if (errorMessage == "The email address is badly formatted.") {
            errorMessage = "Invalid email";
            _validateEmail = true;
            _validatePass = false;
          } else {
            Fluttertoast.showToast(
                msg: errorMessage, gravity: ToastGravity.TOP);
            _validateEmail = false;
            _validatePass = false;
          }
        }
      });
    }
  }
}
