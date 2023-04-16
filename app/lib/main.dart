import 'package:flutter/material.dart';
import 'package:flutter_hospitality_app/screens/dropdown.dart';
import 'package:flutter_hospitality_app/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hospitality_app/screens/register.dart';
import 'package:flutter_hospitality_app/screens/registered.dart';
import 'package:flutter_hospitality_app/screens/splash_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

const MaterialColor primaryHealth = MaterialColor(
  _HealthPrimaryValue,
  <int, Color>{
    50: Color(0xFF247C7C),
    100: Color(0xFF247C7C),
    200: Color(0xFF247C7C),
    300: Color(0xFF247C7C),
    400: Color(0xFF247C7C),
    500: Color(_HealthPrimaryValue),
    600: Color(0xFF247C7C),
    700: Color(0xFF247C7C),
    800: Color(0xFF247C7C),
    900: Color(0xFF247C7C),
  },
);
const int _HealthPrimaryValue = 0xFF247C7C;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryHealth,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SplashScreen(),
      ),
    );
  }
}
