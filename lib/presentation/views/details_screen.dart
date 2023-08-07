import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/entities/weather_entity.dart';
import 'package:weather_app/presentation/views/bottom_scrim.dart';
import 'package:weather_app/presentation/views/top_scrim.dart';
import 'city_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const topBarHeight = 240.0;
    final extendedTopBarHeight =
        topBarHeight + MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: topBarHeight,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    entity.city,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  background: Stack(
                    children: [
                      CityImage(
                        assetPath: entity.cityImagePath,
                        height: extendedTopBarHeight,
                      ),
                      BottomScrim(height: extendedTopBarHeight),
                      TopScrim(height: extendedTopBarHeight),
                    ],
                  )),
            ),
          ];
        },
        body: Column(
          children: [
            const SizedBox(height: 8),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Lottie.asset(entity.animationPath, height: 100),
                Text(
                  entity.temperature,
                  style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(entity.description),
            ),
          ],
        ),
      ),
    );
  }

  WeatherEntity get entity => Get.arguments as WeatherEntity;
}
