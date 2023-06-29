import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/utils/language.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:flutter_dialogflow/v2/dialogflow_v2.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_chatbot/Screens/AboutMentalIllness/about_mental_illness.dart';
import 'package:mental_health_chatbot/Screens/GetHelp/get_help.dart';
import 'package:mental_health_chatbot/Screens/ViewDASS_21ScoringGuidelines/view_dass_21_scoring_guidelines.dart';
import 'package:mental_health_chatbot/dashboard.dart';

class EvaluationScreen extends StatefulWidget {
  final String title;
  final String info;
  final String defaultMessage;
  const EvaluationScreen({Key? key, required this.info, required this.title, required this.defaultMessage}) : super(key: key);

  @override
  State<EvaluationScreen> createState() => _EvaluationScreenState();
}

class _EvaluationScreenState extends State<EvaluationScreen> {
  final TextEditingController messageInsert = TextEditingController();
  List<Map> messages = [];
  // Initialize the scores to zero
  var depressionScore = 0;
  var anxietyScore = 0;
  var stressScore = 0;
  // Initialize a boolean variable to track whether a result message has been displayed
  bool resultDisplayed = false;
  bool cancelEvaluation = false;

  @override
  void initState() {
    super.initState();
    // Add the initial message "Start Evaluation"
    response("Start Evaluation");
  }

  void response(String text) async {
    messageInsert.clear();
    setState(() {
      messages.insert(0, {
        "data": 1,
        "message": text,
      });
    });
    AuthGoogle authGoogle = await AuthGoogle(
        fileJson: "assets/service.json")
        .build();
    Dialogflow dialogflow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(text);
    // Process the Dialogflow response
    setState(() {
      messages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]['text']['text'][0],
      });
    });

    // Check if there is a second text response or custom payload
    if (aiResponse.getListMessage().length > 1) {
      var payload = aiResponse.getListMessage()[1]['payload'];
      if (kDebugMode) {
        print(payload);
      }
      if (payload != null && payload.containsKey('richContent')) {
        var richContent = payload['richContent'];
        if (richContent is List && richContent.isNotEmpty) {
          var options = richContent[0][0]['options'];
          if (options is List && options.isNotEmpty) {
            setState(() {
              // Display buttons for each option
              messages.insertAll(0, options.map((option) =>
              {
                "data": 0,
                "message": option['text'],
                "button": true // add a button flag to identify button messages
              }));
            });
          }
        }
      }
      setState(() {
        messages.insert(0, {
          "data": 0,
          "message": aiResponse.getListMessage()[1]['text']['text'][0] ?? ''
        });
      });
      if (aiResponse.getListMessage().length > 2) {
        var payload = aiResponse.getListMessage()[2]['payload'];
        if (kDebugMode) {
          print(payload);
        }
        if (payload != null && payload.containsKey('richContent')) {
          var richContent = payload['richContent'];
          if (richContent is List && richContent.isNotEmpty) {
            var options = richContent[0][0]['options'];
            if (options is List && options.isNotEmpty) {
              setState(() {
                // Display buttons for each option
                messages.insertAll(0, options.map((option) =>
                {
                  "data": 0,
                  "message": option['text'],
                  "button": true // add a button flag to identify button messages
                }));
              });
            }
          }
        }
        setState(() {
          messages.insert(0, {
            "data": 0,
            "message": aiResponse.getListMessage()[2]['text']['text'][0] ?? ''
          });
        });
        if (aiResponse.getListMessage().length > 3) {
          var payload = aiResponse.getListMessage()[3]['payload'];
          if (kDebugMode) {
            print(payload);
          }
          if (payload != null && payload.containsKey('richContent')) {
            var richContent = payload['richContent'];
            if (richContent is List && richContent.isNotEmpty) {
              var options = richContent[0][0]['options'];
              if (options is List && options.isNotEmpty) {
                setState(() {
                  // Display buttons for each option
                  messages.insertAll(0, options.map((option) =>
                  {
                    "data": 0,
                    "message": option['text'],
                    "button": true // add a button flag to identify button messages
                  }));
                });
              }
            }
          }
        }
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
        body: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final reply = messages[index];
                        if (reply['button'] == true) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                              child: SizedBox(
                              width: 200,
                              height: 50,
                              child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              textStyle: const TextStyle(fontSize: 16),
                            ),
                            onPressed: () async {
                              response(reply['message']);
                              // Get the user's response from the intent
                              var userResponse = reply['message'];
                              if (kDebugMode) {
                                print(reply['message']);
                              }

                            if (reply['message'] != 'Cancel Test' && reply['message'] != 'DASS-21 Scoring Guide' && reply['message'] != 'Back to Menu' && reply['message'] != 'Retest' && reply['message'] != 'Get Help' && reply['message'] != 'About Mental Illness') {
                              // Extract the number from the response using a regular expression
                              var regex = RegExp(r'\[(\d+)\]');

                              var match = regex.firstMatch(userResponse);
                              var number = match?.group(1);

                              // Convert the number to an integer
                              var score = int.parse(number!);
                              if (kDebugMode) {
                                print(score);
                              }
                              // Assuming userResponse is the string containing the user's response
                              RegExp exp = RegExp(r'(\d+)\.');

                              Match matchQuestion = exp.firstMatch(
                                  userResponse) as Match;
                              String? questionNumber = matchQuestion.group(1);
                              if (kDebugMode) {
                                print(questionNumber);
                              }

                              // Map each question to its corresponding scale based on its index
                              switch (questionNumber) {
                              // Questions that belong to the depression scale
                                case '3':
                                case '5':
                                case '10':
                                case '13':
                                case '16':
                                case '17':
                                case '21':
                                  depressionScore += score;
                                  break;

                              // Questions that belong to the anxiety scale
                                case '2':
                                case '4':
                                case '7':
                                case '9':
                                case '15':
                                case '19':
                                case '20':
                                  anxietyScore += score;
                                  break;

                              // Questions that belong to the stress scale
                                case '1':
                                case '6':
                                case '8':
                                case '11':
                                case '12':
                                case '14':
                                case '18':
                                  stressScore += score;
                                  break;
                              }
                              if (reply['message'] ==
                                  '21. [0]' || reply['message'] ==
                                  '21. [1]' || reply['message'] ==
                                  '21. [2]' || reply['message'] ==
                                  '21. [3]') {
                                // Calculate the total score and save it to the database
                                final String formattedDateTime =
                                DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
                                var date = formattedDateTime;
                                var url = "http://192.168.43.74/mental_health_assistant_chatbot/StartEvaluation/evaluationResult.php";
                                var dataResponse = await http.post(url, body: {
                                  "email": widget.info,
                                  "date": date.toString(),
                                  "depression_score": depressionScore.toString(),
                                  "anxiety_score": anxietyScore.toString(),
                                  "stress_score": stressScore.toString()
                                });
                                var data = json.decode(
                                    json.encode(dataResponse.body));
                                if (kDebugMode) {
                                  print(data);
                                }
                                // Display the result to the user
                                setState(() {
                                  messages.insert(0, {
                                    "data": 0,
                                    "message": 'You have finished your evaluation test!\n\nThe result of your DASS-21 Scoring: \nDepression - $depressionScore \nAnxiety - $anxietyScore \nStress - $stressScore'
                                  });
                                  resultDisplayed = true;
                                });
                              }
                            }
                            else if(reply['message'] == 'Cancel Test'){
                                // Cancel the evaluation
                                BuildContext context = this.context;  // Save the context
                                setState(() {
                                  messages.insert(0, {
                                    "data": 0,
                                    "message": 'You have already cancelled the test.\nAll the data of your previous input will not be saved.'
                                  });
                                  cancelEvaluation = true;
                                });
                                Future.delayed(const Duration(seconds: 5), () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context)=>DashBoard(info: widget.info),
                                    ),
                                  );
                                });
                              }else if (reply['message'] == 'DASS-21 Scoring Guide') {
                              BuildContext context = this.context;  // Save the context
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>ViewDASS21ScoringGuidelinesScreen(info: widget.info),
                                  ),
                                );
                              });
                            }else if(reply['message'] == 'Back to Menu'){
                              BuildContext context = this.context;  // Save the context
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>DashBoard(info: widget.info),
                                  ),
                                );
                              });
                            }else if(reply['message'] == 'Retest'){
                              BuildContext context = this.context;  // Save the context
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>EvaluationScreen(info: widget.info, title: '', defaultMessage: '',),
                                  ),
                                );
                              });
                            }else if(reply['message'] == 'Get Help'){
                              BuildContext context = this.context;  // Save the context
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>GetHelpScreen(info: widget.info),
                                  ),
                                );
                              });
                            }else if(reply['message'] == 'About Mental Illness'){
                              BuildContext context = this.context;  // Save the context
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context)=>AboutMentalIllnessScreen(info: widget.info),
                                  ),
                                );
                              });
                            }
                              },
                            child: Text(reply['message']),
                              ),
                          ),
                              ),
                          );
                        } else {
                          return chat(reply['message'], reply['data']);
                        }
                      }),
              ),
              const SizedBox(
                height: 20,
              ),

              const Divider(
                height: 5.0,
                color: Colors.greenAccent,
              ),
              ListTile(

                title: Container(
                  height: 35,
                  padding: const EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: const InputDecoration(
                      hintText: "Enter a Message...",
                      hintStyle: TextStyle(
                          color: Colors.black26
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),

                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black
                    ),
                    onChanged: (value) {

                    },
                  ),
                ),

                trailing: IconButton(

                    icon: const Icon(

                      Icons.send,
                      size: 30.0,
                      color: Colors.greenAccent,
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        if (kDebugMode) {
                          print("empty message");
                        }
                      } else {
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),

              ),

            ],
          ),

        ),

        bottomNavigationBar: BottomAppBar(
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Icon(
                  Icons.email,
                ),
              ),
              Text(" ${widget.info}",
                  style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
              )
            ],
          ),
        ),
    ),
    );
  }
  Widget chat(String message, int data) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),

      child: Row(
        mainAxisAlignment: data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [

          data == 0 ? const SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/icons/chatbot.png"),
            ),
          ) : Container(),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Bubble(
                radius: const Radius.circular(15.0),
                color: data == 0 ? const Color.fromRGBO(23, 157, 139, 1) : Colors.orangeAccent,
                elevation: 0.0,

                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                          child: Container(
                            constraints: const BoxConstraints( maxWidth: 200),
                            child: Text(
                              message,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                )),
          ),


          data == 1? const SizedBox(
            height: 60,
            width: 60,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/icons/person.png"),
            ),
          ) : Container(),

        ],
      ),
    );
  }
}

