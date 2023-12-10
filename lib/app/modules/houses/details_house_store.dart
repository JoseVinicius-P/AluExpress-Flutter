import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/presentation/interfaces/i_slide_store.dart';

class DetailsHouseStore extends Store<int> implements ISlideStore{
  final CarouselController _carouselController = CarouselController();

  DetailsHouseStore() : super(0);

  @override
  CarouselController getCarouselController() {
    return _carouselController;
  }

  @override
  void setCarouselPage(int index) {
    _carouselController.animateToPage(
        index,
        duration: const Duration(milliseconds: 800),
        curve: Curves.linear);
  }

  @override
  void updateCurrentSlide(int current) {
    update(current);
  }



}