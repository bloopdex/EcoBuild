// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecobuild/widgets/user_choice_widget.dart';
import 'package:flutter/material.dart';

class UserChoiceScreen extends StatelessWidget {
  const UserChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 3),
            const Text('Hello,',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const Text('What do you want to do today?',
                style: TextStyle(fontSize: 20)),
            const Spacer(flex: 1),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/estimate'),
              child: const UserChoiceWidget(
                  image: 'lib/assets/images/estimate.svg',
                  title: 'Estimate your budget of construction materials '),
            ),
            const Spacer(flex: 1),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/buy'),
              child: const UserChoiceWidget(
                  image: 'lib/assets/images/buy.svg',
                  title: 'Buy construction materials '),
            ),
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
