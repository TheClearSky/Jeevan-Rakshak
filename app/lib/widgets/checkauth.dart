import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hospitality_app/screens/home.dart';
import 'package:flutter_hospitality_app/screens/login.dart';
import 'package:flutter_hospitality_app/widgets/helper_function.dart';

class Checkauth extends StatefulWidget {
  const Checkauth({super.key});

  @override
  State<Checkauth> createState() => _CheckauthState();
}

class _CheckauthState extends State<Checkauth> {
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        print(value);
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSignedIn ? HomePage() : Login();
  }
}
