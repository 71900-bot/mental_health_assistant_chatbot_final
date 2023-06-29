import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Components/already_have_an_account_acheck.dart';
import 'package:mental_health_chatbot/Screens/SignIn/signin_screen.dart';
import 'package:mental_health_chatbot/Screens/SignUp/signup_screen.dart';
import 'package:mental_health_chatbot/constants.dart';

class TermsOfUse extends StatefulWidget {
  const TermsOfUse({super.key});

  @override
  _TermsOfUseState createState() => _TermsOfUseState();
}

// Hold the state of the TermsOfUse widget
class _TermsOfUseState extends State<TermsOfUse>{

  // Build a form for terms of use
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const Text(
            "Terms of Use",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding * 2),
          RichText(
            text: const TextSpan(
              text: "You are required to agree to the Terms and \nconditions listed below by using the Mental Health \nAssistant Chatbot. The Mental Health Assistant \nChatbot is a Listening Service that uses the \nDASS-21 to provide self-assessments and advice \non coping strategies based on the severity of \none's mental health",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' ONLY AVAILABLE \nTO UNIVERSITY STUDENTS.',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: defaultPadding / 2),
          Row(children: const [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text('1. ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text('We are not a counseling or professional \nmental health service.',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ]),
          const SizedBox(height: defaultPadding / 2),
          Row(children: const [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text('2. ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text("We mainly assist university students to \nevaluate their mental health situation and \nprovide them with instant and easily \naccessible mental health professionals' \nsupport.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ]),
          const SizedBox(height: defaultPadding / 2),
          Row(children: const [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text('3. ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text('We are not and never will be considered \nan emergency service, a stand-in for, or an \nalternative to receiving competent medical \ncare.',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ]),
          const SizedBox(height: defaultPadding / 2),
          Row(children: const [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text('4. ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text('To guarantee a high standard of security, we \nhave implemented two key measures:',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ]),
          Row(children: const [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text('i.  ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text('Your real name and IP address will never \nbe tracked by us.',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ]),
          Row(children: const [
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Text('ii. ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text("Your data from evaluations won't ever be \nkept. At the end of the evaluation, all \nyour data will be immediately deleted.",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ]),
          const SizedBox(height: defaultPadding * 2),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>const SignUpScreen(),
                ),
              );
            },
            child: Text("Back".toUpperCase()),
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
}