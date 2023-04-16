import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hospitality_app/screens/home.dart';

class Registered extends StatefulWidget {
  const Registered({super.key});

  @override
  State<Registered> createState() => _RegisteredState();
}

class _RegisteredState extends State<Registered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 80,
              color: Color(0xFF247C7C),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'User Registered Successfully!',
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Text(
            //   'Welcome User',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontStyle: FontStyle.normal,
            //     fontSize: 15,
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF247C7C),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomePage())));
                },
                child: const Text(
                  "Next",
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
  }
}
