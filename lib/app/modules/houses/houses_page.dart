import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/houses/houses_store.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/widgets/carousel_slider_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);
  @override
  HousesPageState createState() => HousesPageState();
}
class HousesPageState extends State<HousesPage> {
  final HousesStore store = Modular.get();
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: const IconThemeData(
            color: MyColors.iconButtonColor,
            shadows: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0, 0),
                blurRadius: 20,
              )
            ]
        ),
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          CarouselSliderWidget(
            carouselController: _carouselController,
            onPageChanged: (index) {},
            axis: Axis.horizontal,
            height: 100.sw * 0.8,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            enableInfiniteScroll: true,
            children: [
              Container(
                constraints: const BoxConstraints.expand(),
                child: Image(
                  image: AssetImage('assets/images/house.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}