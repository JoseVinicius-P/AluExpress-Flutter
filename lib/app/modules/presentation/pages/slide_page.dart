import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:luguel/app/modules/presentation/interfaces/i_slide_store.dart';
import 'package:luguel/app/modules/presentation/widgets/carousel_slider_widget.dart';
import 'package:luguel/app/modules/presentation/widgets/slide_indicator_widget.dart';
import 'package:luguel/app/modules/presentation/widgets/slide_page_widget.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widgets/default_button_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SlidePage extends StatefulWidget {
  final String title;
  const SlidePage({Key? key, this.title = 'SlidePage'}) : super(key: key);
  @override
  SlidePageState createState() => SlidePageState();
}
class SlidePageState extends State<SlidePage>{
  final ISlideStore store = Modular.get();

  List<Widget> _buildElementsList(bool expandImage){
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

  final skipButtonWidget = DefaultButtonWidget(
    onTap: () => Modular.to.navigate('/authentication/'),
    text: "Pular",
    backgroundColor: MyColors.secondaryColor,
    textColor: MyColors.primaryColor,
  );

  Widget _buildNextButtonState(int currentSlide){
    return DefaultButtonWidget(
      onTap: currentSlide != 2 ? () => store.setCarouselPage(currentSlide + 1) : () => Modular.to.navigate('/authentication/'),
      text: currentSlide != 2 ? "Continuar" : "Finalizar",
      icon: Icon(
        currentSlide != 2 ? Icons.keyboard_arrow_right_rounded : Icons.done_rounded,
        color: MyColors.iconButtonColor,),
      backgroundColor: MyColors.primaryColor,
      textColor: MyColors.textButtonColor,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
                      children: _buildElementsList(false),
                    ),
                    TripleBuilder(
                        store: store,
                        builder: (context, triple) {
                          return SlideIndicatorWidget(
                            seletedItem: triple.state as int,
                            numberOfItems: _buildElementsList(false).length,
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
                  padding: MyEdgeInsets.standard,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TripleBuilder(
                          store: store,
                          builder: (context, triple) => _buildNextButtonState(triple.state as int),
                          ),
                      ),
                      const SizedBox(height: 20,),
                      Flexible(child: skipButtonWidget),
                    ],
                  ),
                ),
              ),
            ],
          ),
          landscape: (context) => Row(
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
                      children: _buildElementsList(true),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: MyEdgeInsets.standard,
                  child: Row(
                    children: [
                      TripleBuilder(
                          store: store,
                          builder: (context, triple) {
                            return SlideIndicatorWidget(
                                seletedItem: triple.state as int,
                                numberOfItems: _buildElementsList(true).length,
                                axis: Axis.vertical,
                                onItemTap: (index) => store.setCarouselPage(index)
                            );
                          }
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TripleBuilder(
                              store: store,
                              builder: (context, triple) => _buildNextButtonState(triple.state as int),
                            ),
                            const SizedBox(height: 20,),
                            skipButtonWidget,
                          ],
                        ),
                      ),
                    ],
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