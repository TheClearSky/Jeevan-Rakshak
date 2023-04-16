import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hospitality_app/services/auth_service.dart';
import 'package:flutter_hospitality_app/widgets/helper_function.dart';
import 'package:flutter_hospitality_app/screens/home.dart';
import 'package:flutter_hospitality_app/screens/registered.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  String email;
  String password;
  Register(this.email, this.password);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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

  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  // bool _isLoading = false;

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    register() async {
      // if (formKey.currentState!.validate()) {
      //   setState(() {
      //     _isLoading = true;
      //   });
      // }
      await authService
          .registerUserWithEmailandPassword(
              nameController.text.trim(), widget.email, widget.password)
          .then((value) async {
        if (value == true) {
          await HelperFunctions.saveUserLoggedInStatus(true);
          print('value==true');
          await HelperFunctions.saveUserEmailSF(widget.email.toString());
          await HelperFunctions.saveUserNameSF(nameController.text.toString());
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => Registered())));
        } else {
          showSnackbar(context, Colors.red, value);
          // setState(() {
          //   _isLoading = false;
          // });
        }
      });
    }

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
                  height: 10,
                ),
                Text(
                  'Welcome User',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'We Want to you to fill some basic details',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Name:",
                    //   style: TextStyle(color: Colors.black, fontSize: 15),
                    // ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w300),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFF247C7C), width: 4),
                            borderRadius: BorderRadius.circular(7)),
                        prefixIcon: Icon(
                          Icons.person,
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
                    // Text(
                    //   "Date Of Birth:",
                    //   style: TextStyle(color: Colors.black, fontSize: 15),
                    // ),
                    TextFormField(
                        controller: dateController,
                        decoration: InputDecoration(
                          labelText: 'Date Of Birth',
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFF247C7C), width: 4),
                              borderRadius: BorderRadius.circular(7)),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF247C7C),
                          ),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateController.text = formattedDate;
                            });
                          }
                        }),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF247C7C),
                      ),
                    ),
                    onPressed: register,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        backgroundColor: Color(0xFF247C7C),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(widget.email,
                    style: TextStyle(color: Colors.black, fontSize: 10)),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
