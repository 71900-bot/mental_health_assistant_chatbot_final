import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/AboutMentalIllness/about_mental_illness.dart';
import 'package:mental_health_chatbot/constants.dart';

// Create a causes of mental illness screen for the app
class CausesOfMentalIllnessScreen extends StatelessWidget {

  final String info;
  const CausesOfMentalIllnessScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
        body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Causes of Mental Illness",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding / 2),
          const Divider(
            height: 20,
            thickness: 2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/academic.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Academics\n",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Stress from studies, quizzes, \ntutorials, assignments, projects \nand exams.',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/relationship.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Relationships\n",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Less heart-to-heart consultation \nwith families, friends, colleagues \nand lovers.',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/financial_issue.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Financial Issue\n",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Lack of enough income to cope \nwith increasing education-related \nand household expenses.',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/body_health_condition.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Body Health Condition\n",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Side effects of drugs or medical \ntreatments and biological factors \ninclude chemical imbalances in the \nbrain.',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
              Row(children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 1, horizontal: 30),
                  child: Image.asset(
                    "assets/icons/life_experience.png",
                    height: 70.0,
                    width: 70.0,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: "Life Experiences\n",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Child abuse, school bully, cyberbully \nand so on.',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
              ),
            ],
          ),
          const SizedBox(height: defaultPadding / 2),
          SizedBox(
            width: 200,
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>AboutMentalIllnessScreen(info: info),
                  ),
                );
              },
              child: Text("Go Back".toUpperCase()),
            ),
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
            Text(" $info",
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
}