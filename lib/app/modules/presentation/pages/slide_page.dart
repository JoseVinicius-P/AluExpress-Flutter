import 'package:auto_size_text/auto_size_text.dart';
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
  List<Widget> elementsList = [
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Image(
            image: AssetImage('assets/images/slide1.png'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.sh),
              AutoSizeText(
                "Encontre \na casa \nque \nsempre \nsonhou!",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: AutoSizeText(
                  "No Luguel você pode encontrar uma grande diversidade de casas e apartamentos, tudo de acordo com a cidade que você mora!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    ),
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Image(
            image: AssetImage('assets/images/slide2.png'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.sh),
              AutoSizeText(
                "Divulgue \nseus imóveis \npara um \ngrande base de \nclientes",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: AutoSizeText(
                  "Aqui você pode divulgar seus imóveis sem nenhum custo, encontrando inquilinos com mais velocidade!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    ),
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Image(
            image: AssetImage('assets/images/slide3.png'),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.sh),
              AutoSizeText(
                "Alugue \ncom \nrapidez e \ncomodidade!",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: AutoSizeText(
                  "Com apenas alguns minutos você consegue ver todas as casa disponíveis na sua cidade, alugando sem precisar procurar manualmente",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),

            ],
          ),
        )
      ],
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
              autoPlay: false,
              enableInfiniteScroll: false,
              viewportFraction: 1,
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