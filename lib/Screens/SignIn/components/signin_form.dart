import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Components/already_have_an_account_acheck.dart';
import 'package:mental_health_chatbot/Screens/SignUp/signup_screen.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mental_health_chatbot/dashboard.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInState createState() => _SignInState();
}

// Hold the state of the SignInForm widget
class _SignInState extends State<SignInForm>{

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _email.dispose();
    super.dispose();
  }

  // Build a form for signing in
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          // Validate email field
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return '* Please enter your email';
              }
              if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(email)){
                return '* Please enter a valid email';
              }
              return null;
            },
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Please Enter Your Email",
              hintStyle: TextStyle(fontSize: 14),
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          // Validate password field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _password,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              validator: (password){
                if(password == null || password.isEmpty)
                {
                  return '* Please enter a password';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Please Enter Your Password",
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          // Show sign in button
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                if(_formkey.currentState!.validate())
                {
                  loginUser();
                  if (kDebugMode) {
                    print("Successful");
                  }

                  return;
                }else{
                  if (kDebugMode) {
                    print("Unsuccessful");
                  }
                }
              },
              child: Text(
                "SIGN IN".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),

          // Allow user to navigate to sign up screen by clicking on a link if they haven't register account
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
    }

  // An asynchronous function that sends a POST request to the login.php file on the server using the http package
  Future loginUser() async {
    var url = "http://192.168.43.74/mental_health_assistant_chatbot/Authentication/login.php";
    var response = await http.post(url, body: {
      "email": _email.text,
      "password": _password.text
    });
    var data = json.decode(json.encode(response.body));

    if (data == "Connection Success!Success") {
      Fluttertoast.showToast(
          msg: "Login Successful",
          fontSize: 25,
          textColor: Colors.green
          );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoard(info: _email.text),),);
    } else {
      Fluttertoast.showToast(
          msg: "Username or Password Invalid",
          fontSize: 25,
          textColor: Colors.red);
    }
  }
}