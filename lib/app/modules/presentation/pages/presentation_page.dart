import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/presentation/stores/presentation_store.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/presentation/widgets/animated_background_widget.dart';
import 'package:luguel/app/modules/presentation/widgets/gradiend_background_widget.dart';
import 'package:luguel/app/modules/presentation/widgets/welcome_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PresentationPage extends StatefulWidget {
  final String title;
  const PresentationPage({Key? key, this.title = 'PresentationPage'}) : super(key: key);
  @override
  PresentationPageState createState() => PresentationPageState();
}
class PresentationPageState extends State<PresentationPage>{
  final PresentationStore store = Modular.get();


  @override
  Widget build(BuildContext context) {
    return OrientationLayoutBuilder(
      portrait: (context) => const Scaffold(
        body: AnimatedBackgroundWidget(
          image: Image(
            image: AssetImage('assets/images/presentation_background.jpg'),
            fit: BoxFit.cover,
          ),
          child: Column(
            children: [
              Spacer(),
              GradiendBackgroundWidget(
                child: Column(
                  children: [
                    SizedBox(height: 105,),
                    WelcomeWidget(),
                  ],
              )),
            ],
          ),
        ),
      ),
      landscape: (context) => Scaffold(
        body: AnimatedBackgroundWidget(
          image: const Image(
            image: AssetImage('assets/images/presentation_background_landscape.jpg'),
            fit: BoxFit.cover,
          ),
          child: Column(
            children: [
              GradiendBackgroundWidget(
                  child: Center(
                    child: SizedBox(
                      width: 100.sw,
                      height: 100.sw,
                      child: const Center(child: WelcomeWidget()),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}