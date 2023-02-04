import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserChoiceWidget extends StatelessWidget {
  final String image;
  final String title;
  const UserChoiceWidget({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            )),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SvgPicture.asset(image, height: 120),
              const SizedBox(height: 10),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ))
            ],
          ),
        ));
  }
}
