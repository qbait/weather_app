import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Lottie.asset(
            'assets/animations/error-cloud.json',
            width: 400,
          ),
        ),
        const Center(
            child: Padding(
          padding: EdgeInsets.only(
            top: 164.0,
            right: 24,
            left: 24,
          ),
          child: Text(
            'There was an error loading data',
            style: TextStyle(fontSize: 18),
          ),
        )),
      ],
    );
  }
}
