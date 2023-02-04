import 'views/buy/buy.dart';
import 'views/user_choice.dart';
import 'views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    bool onboardingShown = prefs.getBool('onboardingShown') ?? false;

    return MaterialApp(
      title: 'EcoBuild',
      theme: ThemeData(
          primaryColor: const Color(0xFF1FC557),
          scaffoldBackgroundColor: const Color(0xFFF9F9F9),
          fontFamily: 'Montserrat'),
      routes: {
        '/': (context) =>
            (onboardingShown) ? const OnBoarding() : const UserChoiceScreen(),
        '/buy': (context) => const Buy(),
      },
    );
  }
}
