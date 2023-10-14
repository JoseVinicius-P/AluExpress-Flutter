import 'package:flutter_triple/flutter_triple.dart';

abstract class ISlideStore extends Store<int>{
  ISlideStore(super.initialState);

  void updateCurrentSlide(int current);
}