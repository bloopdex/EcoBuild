import 'package:flutter/material.dart';

class BuyHome extends StatelessWidget {
  const BuyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text('Hello,',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text('Make sure to enjoy your shopping to build.',
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
