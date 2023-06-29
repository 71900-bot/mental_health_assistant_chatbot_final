import 'package:flutter/material.dart';
import 'package:mental_health_chatbot/Screens/ViewPastResult/view_past_result.dart';
import 'package:mental_health_chatbot/constants.dart';

// Create a view DASS-21 scoring guide screen for the app that allows user to see the DASS-21 scoring methods
class ViewDASS21ScoringGuidelinesScreen extends StatelessWidget {

  final String info;
  const ViewDASS21ScoringGuidelinesScreen({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mental Health Assistant Chatbot'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: defaultPadding / 2),
              const Text(
                "DASS-21 Scoring Guide",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: defaultPadding / 2),
              DataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) => Colors.deepOrangeAccent),
                columns: [
                  DataColumn(
                    label: Container(
                      width: 50, // Adjust the width as needed
                      child: Text(
                        'Severity',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 30, // Adjust the width as needed
                      child: Text(
                        'D',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 30, // Adjust the width as needed
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Container(
                      width: 30, // Adjust the width as needed
                      child: Text(
                        'S',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Normal')),
                    DataCell(Text('0 - 9')),
                    DataCell(Text('0 - 7')),
                    DataCell(Text('0 - 14')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Mild')),
                    DataCell(Text('10 - 13')),
                    DataCell(Text('8 - 9')),
                    DataCell(Text('15 - 18')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Moderate')),
                    DataCell(Text('14 - 20')),
                    DataCell(Text('10 - 14')),
                    DataCell(Text('19 - 25')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Severe')),
                    DataCell(Text('21 - 27')),
                    DataCell(Text('15 - 19')),
                    DataCell(Text('26 - 33')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Extremely Severe')),
                    DataCell(Text('28+')),
                    DataCell(Text('20+')),
                    DataCell(Text('34+')),
                  ]),
                ],
              ),
              const SizedBox(height: defaultPadding / 2),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
                child: Image.asset(
                  "assets/images/dass_21_scoring_guide.gif",
                ),
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
                        builder: (context)=>ViewPastResultScreen(info: info),
                      ),
                    );
                  },
                  child: Text("Go Back".toUpperCase(), textAlign: TextAlign.center),
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

