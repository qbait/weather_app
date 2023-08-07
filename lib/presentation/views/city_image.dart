import 'package:flutter/material.dart';

class CityImage extends StatelessWidget {
  final String assetPath;
  final double height;
  
  const CityImage({
    super.key,
    required this.assetPath,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
