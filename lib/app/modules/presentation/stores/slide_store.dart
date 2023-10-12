import 'package:flutter_triple/flutter_triple.dart';

class SlideStore extends Store<int> {

  SlideStore() : super(0);

  void updateCurrentSlide(int current){
    update(current);
  }

}