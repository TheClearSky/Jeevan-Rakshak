import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_hospitality_app/services/auth_service.dart';
import 'package:flutter_hospitality_app/services/database_service.dart';
import 'package:flutter_hospitality_app/widgets/helper_function.dart';
import 'package:flutter_hospitality_app/screens/home.dart';
import 'package:flutter_hospitality_app/screens/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void showSnackbar(context, color, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(fontSize: 14),
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
        textColor: Colors.white,
      ),
    ));
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  // bool _isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  AuthService authService = AuthService();

  login() async {
    // if (formKey.currentState!.validate()) {
    //   setState(() {
    //     _isLoading = true;
    //   });
    // }

    await authService
        .loginUserWithEmailandPassword(
            emailController.text.trim(), passwordController.text.trim())
        .then((value) async {
      if (value == true) {
        // QuerySnapshot snapshot =
        // await DatabaseService(FirebaseAuth.instance.currentUser!.uid)
        //     .gettingUserData(emailController.text.toString());
        await HelperFunctions.saveUserLoggedInStatus(true);
        await HelperFunctions.saveUserEmailSF(emailController.text.toString());
        // await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => HomePage())));
      } else {
        // setState(() {
        //   _isLoading = false;
        // });
        FirebaseAuth.instance
            .fetchSignInMethodsForEmail(emailController.text)
            .then((result) {
          bool isNewUser = result.isEmpty;
          if (isNewUser) {
            if (passwordController.text.trim().length >= 6) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Register(
                          emailController.text.toString(),
                          passwordController.text.toString()))));
            } else {
              showSnackbar(context, Colors.red, value);
            }
          } else {
            showSnackbar(context, Colors.red, value);
          }
        }).catchError((error) {
          print('Error: $error');
          showSnackbar(context, Colors.red, value);
        });
        // Navigator.push(
        //     context, MaterialPageRoute(builder: ((context) => Register())));

        // setState(() {
        //   _isLoading = false;
        // });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Sign Up/Log In",
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF247C7C), width: 4),
                            borderRadius: BorderRadius.circular(7)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFF247C7C),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password:",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    TextFormField(
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null && value.length < 6
                          ? 'Enter min 6 characters'
                          : null,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF247C7C), width: 4),
                            borderRadius: BorderRadius.circular(7)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFF247C7C),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF247C7C),
                      ),
                    ),
                    onPressed: login,
                    child: const Text(
                      "Sign Up/Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        backgroundColor: Color(0xFF247C7C),
                      ),
                    )),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
