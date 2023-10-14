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
class SlidePageState extends State<SlidePage>{
  final SlideStore store = Modular.get();
  final CarouselController _carouselController = CarouselController();
  late List<Widget> elementsList;

  void initElementsList (){
    elementsList = [
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
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                Flexible(
                  child: SizedBox(
                    width: 40.sw,
                    child: const AutoSizeText(
                      "Encontre a casa que sempre sonhou!",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Flexible(
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
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                Flexible(
                  child: SizedBox(
                    width: 40.sw,
                    child: const AutoSizeText(
                      "Divulgue seus imóveis para um grande base de clientes",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Flexible(
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
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                Flexible(
                  child: SizedBox(
                    width: 40.sw,
                    child: const AutoSizeText(
                      "Alugue com rapidez, sem sair de casa!",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Flexible(
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
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initElementsList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Flexible(
                  child: CarouselSlider(
                    carouselController: _carouselController,
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
                ),
                TripleBuilder(
                    store: store,
                    builder: (context, triple) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: elementsList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _carouselController.animateToPage(entry.key),
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
              ],
            ),
          ),
          Expanded(
            flex: 1,
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
                        onTap: current != 2 ? () => _carouselController.animateToPage(current + 1, duration: const Duration(milliseconds: 800), curve: Curves.fastEaseInToSlowEaseOut) : (){},
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