import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/shared/interfaces/i_slide_store.dart';

class SlideStore extends Store<int> implements ISlideStore{
  final CarouselController _carouselController = CarouselController();

  SlideStore() : super(0);

  @override
  void updateCurrentSlide(int current){
    update(current);
  }

  @override
  void setCarouselPage(int index) {
    _carouselController.animateToPage(
        index,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastEaseInToSlowEaseOut);
  }

  @override
  CarouselController getCarouselController() {
    return _carouselController;
  }

}