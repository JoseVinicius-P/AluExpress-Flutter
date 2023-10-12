import 'package:luguel/app/modules/presentation/stores/slide_store.dart';
import 'package:luguel/app/modules/presentation/pages/presentation_page.dart';
import 'package:luguel/app/modules/presentation/pages/slide_page.dart';
import 'package:luguel/app/modules/presentation/stores/presentation_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PresentationModule extends Module {
  @override
  final List<Bind> binds = [Bind.lazySingleton((i) => SlideStore()),Bind.lazySingleton((i) => PresentationStore()),];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PresentationPage()),
    ChildRoute('/presentation_slide', child: (_, args) => const SlidePage(), transition: TransitionType.rightToLeftWithFade),
  ];

}