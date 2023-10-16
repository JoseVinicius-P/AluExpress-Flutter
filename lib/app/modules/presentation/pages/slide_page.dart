import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/presentation/interfaces/i_slide_store.dart';
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
  final ISlideStore store = Modular.get();
  final CarouselController _carouselController = CarouselController();

  List<Widget> getElementsList(bool expandImage){
    return [
      SlidePageWidget(
          slidePath: 'assets/images/slide1.png',
          title: "Encontre a casa que sempre sonhou!",
          subtitle: "No Luguel você pode encontrar uma grande diversidade de casas e apartamentos, tudo de acordo com a cidade que você mora!",
          expandImage: expandImage,
      ),
      SlidePageWidget(
          slidePath: 'assets/images/slide2.png',
          title: "Divulgue seus imóveis para um grande base de clientes",
          subtitle: "Aqui você pode divulgar seus imóveis sem nenhum custo, encontrando inquilinos com mais velocidade!",
        expandImage: expandImage,
      ),
      SlidePageWidget(
          slidePath: 'assets/images/slide3.png',
          title: "Alugue com rapidez, sem sair de casa!",
          subtitle: "Com apenas alguns minutos você consegue ver todas as casa disponíveis na sua cidade, alugando sem precisar procurar manualmente",
        expandImage: expandImage,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white,
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
      //Usado para interceptar quando a tela é fechada (Botão de fechar é pressionado, botão de voltar do sipositivo
      body: WillPopScope(
        onWillPop: () async{
          _carouselController.jumpToPage(0);
          return true;
        },
        child: OrientationLayoutBuilder(
          portrait: (context) => Column(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    CarouselSliderWidget(
                      carouselController: _carouselController,
                      onPageChanged: (index) => store.updateCurrentSlide(index),
                      axis: Axis.horizontal,
                      children: getElementsList(false),
                    ),
                    TripleBuilder(
                        store: store,
                        builder: (context, triple) {
                          return SlideIndicatorWidget(
                            seletedItem: triple.state as int,
                            numberOfItems: getElementsList(false).length,
                            axis: Axis.horizontal,
                            onItemTap: (index) => _carouselController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.fastEaseInToSlowEaseOut)
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
          landscape: (context) => Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      CarouselSliderWidget(
                        carouselController: _carouselController,
                        onPageChanged: (index) => store.updateCurrentSlide(index),
                        axis: Axis.vertical,
                        children: getElementsList(true),
                      ),
                      const SizedBox(width: 10,),
                      TripleBuilder(
                          store: store,
                          builder: (context, triple) {
                            return SlideIndicatorWidget(
                                seletedItem: triple.state as int,
                                numberOfItems: getElementsList(true).length,
                                axis: Axis.vertical,
                                onItemTap: (index) => _carouselController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 800),
                                    curve: Curves.fastEaseInToSlowEaseOut)
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
          ),
        ),
      ),
    );
  }
}

class SlidePageWidget extends StatelessWidget {
  const SlidePageWidget({
    super.key,
    required this.slidePath,
    required this.title,
    required this.subtitle,
    required this.expandImage,
  });

  final String slidePath;
  final String title;
  final String subtitle;
  final bool expandImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: expandImage ? const BoxConstraints.expand() : const BoxConstraints(),
          child: Image(
            image: AssetImage(slidePath),
            fit: BoxFit.cover,
          ),
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
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white.withOpacity(0.99)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AutoSizeText(
                        title,
                        style: const TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white.withOpacity(0.99)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AutoSizeText(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
    required CarouselController carouselController,
    required this.children, required this.onPageChanged,
    required this.axis,
  }) : _carouselController = carouselController;

  final CarouselController _carouselController;
  final List<Widget> children;
  final Function(int) onPageChanged;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CarouselSlider(
        carouselController: _carouselController,
        options: CarouselOptions(
            scrollDirection: axis,
            height: 70.sh,
            enlargeCenterPage: false,
            autoPlay: false,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              onPageChanged(index);
            }),
        items: children,
      ),
    );
  }
}

class SlideIndicatorWidget extends StatelessWidget {
  const SlideIndicatorWidget({
    super.key,
    required this.numberOfItems,
    this.onItemTap,
    required this.seletedItem,
    required this.axis,
  });

  final int numberOfItems;
  final Function(int)? onItemTap;
  final int seletedItem;
  final Axis axis;

  List<Widget> generateItems(){
    return List.generate(numberOfItems, (index) =>
        GestureDetector(
          onTap: onItemTap != null ? () => onItemTap!(index) : (){},
          child: Container(
            width: 1.sh,
            height: 1.sh,
            margin: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.primaryColor.withOpacity(seletedItem == index ? 0.7 : 0.1)
            ),
          ),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context){
        if(axis == Axis.horizontal){
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateItems(),
          );
        }else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: generateItems(),
          );
        }
      },
    );
  }
}