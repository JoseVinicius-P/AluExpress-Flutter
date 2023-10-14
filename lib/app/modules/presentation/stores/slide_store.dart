import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/presentation/interfaces/i_slide_store.dart';

class SlideStore extends Store<int> implements ISlideStore{

  SlideStore() : super(0);

  @override
  void updateCurrentSlide(int current){
    update(current);
  }

}