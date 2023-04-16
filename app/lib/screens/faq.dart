import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  var textController = TextEditingController();
  void showSnackbar(context, color, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message ?? '',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 10),
        child: FloatingActionButton(
          onPressed: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Column(children: [
                          TextFormField(
                            controller: textController,
                            decoration: InputDecoration(
                              hintText: 'Ask your question..',
                              labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF247C7C), width: 4),
                                  borderRadius: BorderRadius.circular(7)),
                              prefixIcon: Icon(
                                Icons.question_mark,
                                color: Color(0xFF247C7C),
                              ),
                            ),
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
                              onPressed: () {
                                if (textController != null &&
                                    textController.toString().trim().length !=
                                        0) {
                                  showSnackbar(context, Colors.green,
                                      'Submitted Successfully!');
                                } else {
                                  showSnackbar(
                                      context, Colors.red, 'Invalid Input!');
                                }

                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  backgroundColor: Color(0xFF247C7C),
                                ),
                              )),
                        ]),
                      ),
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(title: Text('FAQ')),
      body: ListView(
        padding: EdgeInsets.only(top: 20),
        children: [
          Container(
            child: Text(
              'How can we help you ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ExpansionTile(
            title: Text('Q1:-How can I register on this portal?'),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    'Ans:-The login and registeration portal have been made very convenient for all the users.All you have to do is just input your email and password and if you are new to the portal,you will be automatically redirected to the registeration page.'),
              )
            ],
          ),
          ExpansionTile(
            title: Text('Q2:-As a common citizen,how it can benefit me?'),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Ans:-It can act as a single platform for all of the health schemes available in all states where you can know about any scheme by just a single click,'),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
                'Q3:-I am a resident of Chhattisgarh.How can I know my state schemes?'),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Ans:-For this problem,we have included the Filter feature through which we can filter the schemes based on your preferred state.'),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
                'Q4:-How can I apply to various schemes through this portal?'),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Ans:-When you filter out the schemes based on your age and state,you just have to click on the scheme name and it will take you to its description where you can get the button '
                    'Link to Apply'
                    '.Clicking on that button will lead you directly to the scheme main page.'),
              )
            ],
          ),
          ExpansionTile(
            title: Text('Q5:-Can I ask my personal query here on this portal?'),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Ans:-Actually currently it is just a prototype but in future we are planning to add a discussion forum where everyone can discuss with each other their problems and help each other out thus building an autonomous community.'),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
                'Q6:-I am a pregnant woman.Does government have any schemes for me?'),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Ans:-You can easily check it through the filter feature to search the schemes for pregnant women.'),
              )
            ],
          ),
          ExpansionTile(
            title: Text(
                'Q7:-I am from slum area and not financially independent.How can I search schemes for me?'),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                    'Ans:-For your convenience,you can go to our site and register yourself on it.Then you can easily find schemes related to Below Poverty Line in the category section.'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
