import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required CarouselController carouselController,
    required this.children,
    required this.onPageChanged,
    required this.axis,
    this.height,
    this.autoPlay,
    this.enableInfiniteScroll,
    this.autoPlayInterval,
    this.autoPlayCurve,
  }) : _carouselController = carouselController;

  final CarouselController _carouselController;
  final List<Widget> children;
  final Function(int) onPageChanged;
  final Axis axis;
  final double? height;
  final bool? autoPlay;
  final bool? enableInfiniteScroll;
  final Duration? autoPlayInterval;
  final Curve? autoPlayCurve;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
          scrollDirection: axis,
          height: height ?? 100.sh,
          enlargeCenterPage: false,
          autoPlay: autoPlay ?? false,
          autoPlayInterval: autoPlayInterval ?? const Duration(),
          autoPlayCurve: autoPlayCurve ?? Curves.linear,
          enableInfiniteScroll: enableInfiniteScroll ?? false,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            onPageChanged(index);
          }),
      items: children,
    );
  }
}