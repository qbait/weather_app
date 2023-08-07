import 'package:flutter/material.dart';

class BottomScrim extends StatelessWidget {
  final double height;

  const BottomScrim({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.center,
          colors: [Colors.black, Colors.transparent],
        ),
      ),
    );
  }
}