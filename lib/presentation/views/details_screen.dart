import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/data/entities/forecast_entity.dart';
import 'package:weather_app/presentation/controllers/details_controller.dart';
import 'package:weather_app/presentation/views/bottom_scrim.dart';
import 'package:weather_app/presentation/views/city_image.dart';
import 'package:weather_app/presentation/views/loading_view.dart';
import 'package:weather_app/presentation/views/top_scrim.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const topBarHeight = 240.0;
    final extendedTopBarHeight =
        topBarHeight + MediaQuery.of(context).viewPadding.top;

    final weatherEntity = controller.weatherEntity;

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
                    weatherEntity.city,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  background: Stack(
                    children: [
                      CityImage(
                        assetPath: weatherEntity.cityImagePath,
                        height: extendedTopBarHeight,
                      ),
                      BottomScrim(height: extendedTopBarHeight),
                      TopScrim(height: extendedTopBarHeight),
                    ],
                  )),
            ),
          ];
        },
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                _generalInfo(
                  weatherEntity.animationPath,
                  weatherEntity.temperature,
                  weatherEntity.description,
                  weatherEntity.humidity,
                  weatherEntity.pressure,
                ),
                LoadingView(
                  controller.loader,
                  Column(
                      children: controller
                              .forecastEntity()
                              ?.items
                              .map((e) => _forecastItem(e))
                              .toList() ??
                          []),
                  progressView: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _generalInfo(
    String animationPath,
    String temperature,
    String? description,
    num? humidity,
    num? pressure,
  ) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Lottie.asset(animationPath, height: 100),
        Text(
          temperature,
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null) Text(description.capitalize ?? ''),
            if (humidity != null) Text('Humidity: $humidity%'),
            if (pressure != null) Text('Pressure: $pressure'),
          ],
        ),
      ],
    );
  }

  Widget _forecastItem(ForecastItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListTile(
        title: Text(item.time != null
            ? DateFormat('EEEE, h a').format(item.time!)
            : ''),
        subtitle: Text(item.description?.capitalize ?? ''),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgPicture.asset(
              item.iconPath,
              height: 48,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              item.temperature,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
