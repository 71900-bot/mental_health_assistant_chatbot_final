import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_chatbot/Components/accept_terms_of_use.dart';
import 'package:mental_health_chatbot/Components/already_have_an_account_acheck.dart';
import 'package:mental_health_chatbot/Screens/SignIn/signin_screen.dart';
import 'package:mental_health_chatbot/Screens/TermsOfUse/termsofuse_screen.dart';
import 'package:mental_health_chatbot/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

// Hold the state of the SignUpForm widget
class _SignUpState extends State<SignUpForm>{

  String _gender = 'Please Choose Your Gender';

  //TextController to read text entered in text field
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _dateInput = TextEditingController();

  bool checkboxValue = false;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // Build a form for signing up
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const Text(
            "SIGN UP",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding * 2),
          // Email field
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
                child: Icon(Icons.email),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          // Password field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _password,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              validator: (password) {
                if (password == null || password.isEmpty) {
                  return '* Please enter a password';
                }
                if (password.length < 8) {
                  return '* Password must be at least 8 characters long';
                }
                if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+]).{8,}$').hasMatch(password)) {
                  return '* Password must contain at least one \nuppercase letter, one lowercase letter, one \ndigit, and one special character';
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
          const SizedBox(height: defaultPadding / 2),
          // Confirm password field
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _confirmpassword,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              validator: (confirmpassword){
                if(confirmpassword == null || confirmpassword.isEmpty)
                {
                  return '* Please re-enter your password';
                }
                if (kDebugMode) {
                  print(_password.text);
                }

                if (kDebugMode) {
                  print(_confirmpassword.text);
                }

                if(_password.text != _confirmpassword.text){
                  return "* Password does not match";
                }

                return null;
              },
              decoration: const InputDecoration(
                hintText: "Please Confirm Your Password",
                hintStyle: TextStyle(fontSize: 14),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          // Gender field
          DropdownButtonFormField<String>(
            value: _gender,
            items: <String>['Please Choose Your Gender', 'Male', 'Female', 'Prefer Not to Say']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
            value: value,
            child: Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                  ),
                );
              }).toList(),
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
              onChanged: (String? newValue) {
              setState(() {
                _gender = newValue!;
              });
            },
            validator: (gender){
              if(gender == 'Please Choose Your Gender')
              {
                return '* Please choose your gender';
              }
              return null;
            },
          ),
          const SizedBox(height: defaultPadding * 2),
        // Birthday field
        TextFormField(
          controller: _dateInput,
          //editing controller of this TextField
          decoration: const InputDecoration(
            hintText: "Please Choose Your Birthday",
            hintStyle: TextStyle(fontSize: 14),
            prefixIcon: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Icon(Icons.calendar_today),
            ),
          ),
          readOnly: true,
          //set it true, so that user will not able to edit text
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              if (kDebugMode) {
                print(
                  pickedDate);
              } //pickedDate output format => 2021-03-10 00:00:00.000
              String formattedDate =
              DateFormat('yyyy-MM-dd').format(pickedDate);
              if (kDebugMode) {
                print(
                  formattedDate);
              } //formatted date output using intl package =>  2021-03-16
              setState(() {
                _dateInput.text =
                    formattedDate; //set output date to TextField value.
              });
            } else {
            }
          },
          validator: (dateInput){
            if(dateInput ==  null || dateInput.isEmpty)
            {
              return '* Please choose your birthday';
            }
            return null;
          },
        ),
          const SizedBox(height: defaultPadding * 2),

        // Confirm terms of use field
      FormField<bool>(
        builder: (state) {
          return Column(
            children: <Widget>[
            Row(
            children: <Widget>[
            Checkbox(
              value: checkboxValue,
              onChanged: (value) {
              setState(() {
            //save checkbox value to variable that store terms and notify form that state changed
                checkboxValue = value!;
                state.didChange(value);
              });
            },
        ),
              // Allow user to navigate to terms of use screen by clicking on a link
              AcceptTermsOfUse(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>const TermsOfUseScreen(),
                    ),
                  );
                },
              ),
        ],
      ),
              //display error in matching theme
              Text(
                state.errorText ?? '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              )
            ],
          );
        },
      //output from validation will be displayed in state.errorText (above)
        validator: (value) {
          if (!checkboxValue) {
            return '* You Should Need to Accept Terms of Use!';
          } else {
            return null;
          }
        },
      ),
          const SizedBox(height: defaultPadding),
          // Show sign up button
          ElevatedButton(
            onPressed: () {
              if(_formkey.currentState!.validate())
              {
                registrationUser();
                if (kDebugMode) {
                  print("Successful");
                }
              }else{
                if (kDebugMode) {
                  print("Unsuccessful");
                }
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding * 2),
          // Allow user to navigate to sign in screen by clicking on a link if they already registered account
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const SignInScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // An asynchronous function that sends a POST request to the user_registration.php file on the server using the http package
  Future registrationUser() async{

    var url = "http://192.168.43.74/mental_health_assistant_chatbot/Authentication/user_registration.php";
    var response = await http.post(url, body: {
      "email": _email.text,
      "password": _password.text,
      "gender": _gender,
      "dateOfBirth": _dateInput.text
    });
    var data = json.decode(json.encode(response.body));

    if (data == "Connection Success!Error") {
      Fluttertoast.showToast(
          msg: "User Already Exist!",
          fontSize: 25,
          textColor: Colors.red
          );
    } else {
      Fluttertoast.showToast(
          msg: "Registration Successful",
          fontSize: 25,
          textColor: Colors.green);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen(),),);
    }
  }
}
