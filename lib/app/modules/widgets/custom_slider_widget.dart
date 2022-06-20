import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/slider_model.dart';
import 'package:ostadjee/app/modules/widgets/custom_image_widget.dart';

class CustomSliderWidget extends StatelessWidget {
  final List<Sliders>? slider;

  const CustomSliderWidget({
    Key? key,
    required this.slider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.5,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        viewportFraction: 1,
        reverse: true,
        autoPlay: true,
      ),
      items: slider?.map((Sliders item) {
        return SizedBox(
          width: Get.width,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CustomImageWidget(imageUrl: item.image!),
                  // if (item.title != null)
                  //   Positioned(
                  //     bottom: 0.0,
                  //     left: 0.0,
                  //     right: 0.0,
                  //     child: Container(
                  //       decoration: const BoxDecoration(
                  //         gradient: LinearGradient(
                  //           colors: [
                  //             Color.fromARGB(200, 0, 0, 0),
                  //             Color.fromARGB(0, 0, 0, 0)
                  //           ],
                  //           begin: Alignment.bottomCenter,
                  //           end: Alignment.topCenter,
                  //         ),
                  //       ),
                  //       padding: const EdgeInsets.symmetric(
                  //           vertical: 10.0, horizontal: 20.0),
                  //       child: Text(
                  //         item.title ?? "",
                  //         style: TextStyle(
                  //           color: AppColors.white,
                  //           fontSize: Dimens.fontSize15,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                ],
              )),
        );
      }).toList(),
    );
  }
}
