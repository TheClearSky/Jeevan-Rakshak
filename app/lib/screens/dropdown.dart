import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage1 extends StatefulWidget {
  final Function(String) onClicked;
  const MyHomePage1({required this.onClicked});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  late String _myActivity;
  late String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  // _saveForm() {
  //   var form = formKey.currentState;
  //   if (form.validate()) {
  //     form.save();
  //     setState(() {
  //       _myActivityResult = _myActivity;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: DropDownFormField(
                titleText: 'My workout',
                hintText: 'Please choose one',
                value: _myActivity,
                onSaved: (value) {
                  setState(() {
                    _myActivity = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    print(value);
                    print(value.length);

                    _myActivity = value;
                    widget.onClicked(value);
                  });
                },
                dataSource: [
                  {
                    "display": "All",
                    "value": "",
                  },
                  {
                    "display": "Central",
                    "value": "Central",
                  },
                  {
                    "display": "Andhra Pradesh",
                    "value": "Andhra Pradesh",
                  },
                  {
                    "display": "Arunachal Pradesh",
                    "value": "Arunachal Pradesh",
                  },
                  {
                    "display": "Assam",
                    "value": "Assam",
                  },
                  {
                    "display": "Bihar",
                    "value": "Bihar",
                  },
                  {
                    "display": "Chhattisgarh",
                    "value": "Chhattisgarh",
                  },
                  {
                    "display": "Goa",
                    "value": "Goa",
                  },
                  {
                    "display": "Gujarat",
                    "value": "Gujarat",
                  },
                  {
                    "display": "Haryana",
                    "value": "Haryana",
                  },
                  {
                    "display": "Himachal Pradesh",
                    "value": "Himachal Pradesh",
                  },
                  {
                    "display": "Jharkhand",
                    "value": "Jharkhand",
                  },
                  {
                    "display": "Karnataka",
                    "value": "Karnataka",
                  },
                  {
                    "display": "Kerala",
                    "value": "Kerala",
                  },
                  {
                    "display": "Madhya Pradesh",
                    "value": "Madhya Pradesh",
                  },
                  {
                    "display": "Maharashtra",
                    "value": "Maharashtra",
                  },
                  {
                    "display": "Manipur",
                    "value": "Manipur",
                  },
                  {
                    "display": "Meghalaya",
                    "value": "Meghalaya",
                  },
                  {
                    "display": "Mizoram",
                    "value": "Mizoram",
                  },
                  {
                    "display": "Nagaland",
                    "value": "Nagaland",
                  },
                  {
                    "display": "Odisha",
                    "value": "Odisha",
                  },
                  {
                    "display": "Punjab",
                    "value": "Punjab",
                  },
                  {
                    "display": "Rajasthan",
                    "value": "Rajasthan",
                  },
                  {
                    "display": "Sikkim",
                    "value": "Sikkim",
                  },
                  {
                    "display": "Tamil Nadu",
                    "value": "Tamil Nadu",
                  },
                  {
                    "display": "Telangana",
                    "value": "Telangana",
                  },
                  {
                    "display": "Tripura",
                    "value": "Tripura",
                  },
                  {
                    "display": "Uttar Pradesh",
                    "value": "Uttar Pradesh",
                  },
                  {
                    "display": "Uttarakhand",
                    "value": "Uttarakhand",
                  },
                  {
                    "display": "West Bengal",
                    "value": "West Bengal",
                  },
                ],
                textField: 'display',
                valueField: 'value',
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(8),
            //   child: ElevatedButton(
            //     child: Text('Save'),
            //     onPressed: null,
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.all(16),
            //   child: Text(_myActivityResult),
            // )
          ],
        ),
      ),
    );
  }
}
