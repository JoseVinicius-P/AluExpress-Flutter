import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/presentation/stores/slide_store.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SlidePage extends StatefulWidget {
  final String title;
  const SlidePage({Key? key, this.title = 'SlidePage'}) : super(key: key);
  @override
  SlidePageState createState() => SlidePageState();
}
class SlidePageState extends State<SlidePage> {
  final SlideStore store = Modular.get();
  final CarouselController _controller = CarouselController();
  List<Widget> elementsList = [
    Stack(
      children: [
        const Image(
          image: AssetImage('assets/images/slide1.png'),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.sh),
              const AutoSizeText(
                "Encontre \na casa \nque \nsempre \nsonhou!",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Expanded(
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
        const Image(
          image: AssetImage('assets/images/slide2.png'),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.sh),
              const AutoSizeText(
                "Divulgue \nseus imóveis \npara um \ngrande base de \nclientes",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Expanded(
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
        const Image(
          image: AssetImage('assets/images/slide3.png'),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.sh),
              const AutoSizeText(
                "Alugue \ncom \nrapidez e \ncomodidade!",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              const Expanded(
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
                store.updateCurrentSlide(index);
              }),
            items: elementsList,
          ),
          TripleBuilder(
            store: store,
            builder: (context, triple) {
              return Row(
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
                              .withOpacity(triple.state == entry.key ? 0.7 : 0.1)),
                    ),
                  );
                }).toList(),
              );
            }
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TripleBuilder(
                    store: store,
                    builder: (context, triple) {
                      int current = triple.state as int;
                      return DefaultButtonWidget(
                        onTap: current != 2 ? () => _controller.animateToPage(current + 1, duration: const Duration(milliseconds: 800), curve: Curves.fastEaseInToSlowEaseOut) : (){},
                        text: current != 2 ? "Continuar" : "Finalizar",
                        icon: Icon(
                          current != 2 ? Icons.keyboard_arrow_right_rounded : Icons.done_rounded,
                          color: Colors.white,),
                        background: MyColors.primaryColor,
                        textColor: Colors.white,
                      );
                    }
                  ),
                  const SizedBox(height: 20,),
                  DefaultButtonWidget(
                    onTap: (){},
                    text: "Pular",
                    background: MyColors.secondaryColor,
                    textColor: MyColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}