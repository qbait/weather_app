import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:weather_app/presentation/views/bottom_scrim.dart';
import 'package:weather_app/presentation/views/city_image.dart';
import 'package:weather_app/presentation/views/error_view.dart';
import 'package:weather_app/presentation/views/loading_view.dart';
import 'package:weather_app/presentation/controllers/home_controller.dart';
import 'package:weather_app/navigation/nav.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const itemHeight = 220.0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => LoadingView(
          controller.loader,
          ListView(
            children: controller.entities
                .map(
                  (entity) => SizedBox(
                    height: itemHeight,
                    child: Stack(
                      children: [
                        CityImage(
                          assetPath: entity.cityImagePath,
                          height: itemHeight,
                        ),
                        const BottomScrim(height: itemHeight),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              entity.city,
                              style: const TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.end,
                            direction: Axis.horizontal,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: SvgPicture.asset(
                                  entity.iconPath,
                                  height: 72,
                                  width: 72,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 12.0,
                                  left: 4.0,
                                  bottom: 12.0,
                                ),
                                child: Text(
                                  entity.temperature,
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Get.toNamed(
                              Routes.details,
                              arguments: entity,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          errorView: const ErrorView(),
        ),
      ),
    );
  }
}
