import 'dart:convert';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hospitality_app/alldetails.dart';
import 'package:flutter_hospitality_app/screens/dropdown.dart';
import 'package:flutter_hospitality_app/screens/faq.dart';
import 'package:flutter_hospitality_app/screens/login.dart';
import 'package:flutter_hospitality_app/services/auth_service.dart';
import 'package:flutter_hospitality_app/widgets/carddetails.dart';
import 'package:flutter_hospitality_app/widgets/helper_function.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();

    init();
  }

  List<DummyData> list = [];
  List<DummyData> display_list = [];
  String query = '';
  String statefilter = '';
  int min = 0, max = 150;

  Future init() async {
    final display_list = await getPostApi(statefilter, query, min, max);
    setState(() {
      this.display_list = List.from(display_list);
    });
  }

  Future<List<DummyData>> getPostApi(
      String statefilter, String value, int min, int max) async {
    final response = await http.get(Uri.parse(
        'https://health-website-dsa-default-rtdb.firebaseio.com/schemelist.json'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      list.clear();
      for (Map<String, dynamic> i in data) {
        list.add(DummyData.fromJson(i));
      }

      if (value != null) {
        list = list
            .where((element) => element.name!
                .toLowerCase()
                .trim()
                .contains(value.toLowerCase().trim()))
            .toList();
      }
      if (statefilter != null) {
        print('state func in get');
        list = list
            .where((element) => element.category!
                .toLowerCase()
                .trim()
                .contains(statefilter.toLowerCase().trim()))
            .toList();
      }

      print('update min list');
      list = list
          .where((element) =>
              (((element.minage == -1) ? 0 : element.minage)! <= max &&
                  ((element.maxage == -1) ? 150 : element.maxage)! > min))
          .toList();

      // if (max != 100) {
      //   print('update max list');
      //   list = list
      //       .where(
      //           (element) => (element.minage! <= max && element.maxage! <= min))
      //       .toList();
      // }

      return list;
    } else {
      return list;
    }
  }

  Future minagefilter(int min) async {
    print('function called1');
    var display_list = await getPostApi(statefilter, query, min, max);
    setState(() {
      this.min = min;
      this.display_list = List.from(display_list);
    });
  }

  Future statefunc(String statefilter) async {
    print('function called state');
    print(statefilter);
    var display_list = await getPostApi(statefilter, query, min, max);
    setState(() {
      this.statefilter = statefilter;
      this.display_list = List.from(display_list);
    });
  }

  Future maxagefilter(int max) async {
    print('function called2');
    var display_list = await getPostApi(statefilter, query, min, max);
    setState(() {
      this.max = max;
      this.display_list = List.from(display_list);
    });
  }

  Future searchcard(String query) async {
    var display_list = await getPostApi(statefilter, query, min, max);
    setState(() {
      this.query = query;
      this.display_list = List.from(display_list);
    });
  }

  // gettingUserData() async {
  //   // await HelperFunctions.getUserEmailSF().then((value) {
  //   //   setState(() {
  //   //     emai = value.toString();
  //   //   });
  //   // });
  //   await HelperFunctions.getUserNameSF().then((value) {
  //     setState(() {
  //       userName = value.toString();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var minagecontroller = TextEditingController();
    var maxagecontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FaqScreen()));
              },
              child: Icon(
                Icons.question_answer,
                size: 25,
              ),
            ),
            alignment: Alignment.centerRight,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 50),
            children: [
              Icon(
                Icons.account_circle,
                size: 150,
                color: Colors.grey[700],
              ),
              // SizedBox(
              //   height: 15,
              // ),
              // Text(
              //   userName,
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(fontWeight: FontWeight.bold),
              // ),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 2,
              ),
              ListTile(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            height: 350,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                    child: Text(
                                  'Filter',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xFF247C7C)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Min age: '),
                                          SizedBox(
                                            width: 50,
                                            height: 40,
                                            child: Center(
                                              child: TextFormField(
                                                onChanged: (value) =>
                                                    minagefilter(
                                                        int.parse(value)),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.only(
                                                          top: 5, left: 10),
                                                  hintText: min.toString(),
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text('Max age: '),
                                          SizedBox(
                                            width: 50,
                                            height: 40,
                                            child: TextField(
                                              onChanged: (min) =>
                                                  maxagefilter(int.parse(min)),
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    top: 5, left: 10),
                                                hintText: max.toString(),
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                MyHomePage1(
                                  onClicked: (value) => statefunc(value),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Color(0xFF247C7C),
                                      ),
                                    ),
                                    onPressed: () {
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
                              ],
                            ),
                          ),
                        );
                      });
                },
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                leading: const Icon(Icons.filter),
                title: const Text(
                  'Filters',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text("Are you sure you want to Logout?"),
                          actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await authService.signout();
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                      (route) => false);
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: Colors.green,
                                )),
                          ],
                        );
                      });
                },
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                leading: const Icon(Icons.exit_to_app),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
      ),
      body: Column(children: [
        Container(
          height: 80,
          padding: EdgeInsets.all(20),
          child: TextFormField(
            onChanged: searchcard,
            decoration: InputDecoration(
              labelText: 'Search',
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF247C7C), width: 4),
                  borderRadius: BorderRadius.circular(7)),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF247C7C),
              ),
            ),
          ),
        ),
        list.length == 0
            ? Center(
                child: Text('No Scheme Available'),
              )
            : Expanded(
                child: Column(children: [
                  Expanded(
                    child: FutureBuilder(
                        future: getPostApi(statefilter, query, min, max),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return GridView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: display_list.length,
                            itemBuilder: (context, index) => CardDetails(
                              display_list[index].id.toString(),
                              display_list[index].name.toString(),
                              display_list[index].disease.toString(),
                              display_list[index].incomegroup.toString(),
                              display_list[index].minage,
                              display_list[index].maxage,
                              display_list[index].body.toString(),
                              display_list[index].link.toString(),
                              display_list[index].contact.toString(),
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3 / 3.5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                          );
                        }),
                  )
                ]),
              ),
      ]),
    );
  }
}
