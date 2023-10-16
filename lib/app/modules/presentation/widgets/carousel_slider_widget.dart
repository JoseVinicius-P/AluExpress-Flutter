import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required CarouselController carouselController,
    required this.children, required this.onPageChanged,
    required this.axis,
  }) : _carouselController = carouselController;

  final CarouselController _carouselController;
  final List<Widget> children;
  final Function(int) onPageChanged;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
            scrollDirection: axis,
            height: 70.sh,
            enlargeCenterPage: false,
            autoPlay: false,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              onPageChanged(index);
            }),
        items: children,
      ),
    );
  }
}