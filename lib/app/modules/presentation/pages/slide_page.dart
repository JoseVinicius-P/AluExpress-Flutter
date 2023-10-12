import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SlidePage extends StatefulWidget {
  final String title;
  const SlidePage({Key? key, this.title = 'SlidePage'}) : super(key: key);
  @override
  SlidePageState createState() => SlidePageState();
}
class SlidePageState extends State<SlidePage> {
  int _currentSlide = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> elementsList = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              height: 70.sh,
              enlargeCenterPage: false,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 15),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlide = index;
                });
              }),
            items: elementsList,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: elementsList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 1.sh,
                  height: 1.sh,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : MyColors.primaryColor)
                          .withOpacity(_currentSlide == entry.key ? 0.7 : 0.1)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}