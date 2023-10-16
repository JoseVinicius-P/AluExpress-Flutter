import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/presentation/interfaces/i_slide_store.dart';
import 'package:luguel/app/modules/presentation/widgets/carousel_slider_widget.dart';
import 'package:luguel/app/modules/presentation/widgets/slide_indicator_widget.dart';
import 'package:luguel/app/modules/presentation/widgets/slide_page_widget.dart';
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
          store.setCarouselPage(0);
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
                      carouselController: store.getCarouselController(),
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
                            onItemTap: (index) => store.setCarouselPage(index),
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
                              onTap: current != 2 ? () => store.setCarouselPage(current + 1) : (){},
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
                        carouselController: store.getCarouselController(),
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
                                onItemTap: (index) => store.setCarouselPage(index)
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
                                onTap: current != 2 ? () => store.setCarouselPage(current + 1) : (){},
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