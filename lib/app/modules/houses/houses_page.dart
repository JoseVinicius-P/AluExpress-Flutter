import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/houses/houses_store.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widget/title_and_button_widget.dart';
import 'package:luguel/app/shared/widgets/carousel_slider_widget.dart';
import 'package:luguel/app/shared/widgets/divider_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);
  @override
  HousesPageState createState() => HousesPageState();
}
class HousesPageState extends State<HousesPage> {
  final HousesStore store = Modular.get();
  final CarouselController _carouselController = CarouselController();

  final List<IconData> icons = [
    Icons.home,
    Icons.food_bank,
    Icons.bathtub,
    Icons.tv,
    Icons.wifi,
    Icons.pool,
    // Adicione mais ícones conforme necessário
  ];


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 10,),
            Padding(
              padding: MyEdgeInsets.standard,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Casa grande",
                    style: theme.textTheme.titleMedium!.copyWith(fontSize: 30, color: MyColors.textColor),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5,),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on_rounded, color: MyColors.primaryColor,),
                          const SizedBox(width: 5,),
                          AutoSizeText(
                            "Av. Rio de Janeiro Qd. 57 Lt-08A",
                            style: theme.textTheme.labelSmall!.copyWith(color: MyColors.grey, fontWeight: FontWeight.normal),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const DividerWidget(),
                  const SizedBox(height: 30),
                  const TitleAndButtonWidget(title: "Galeria", buttonText: "Ver tudo"),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: MyEdgeInsets.standard.right),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: AssetImage('assets/images/house.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemCount: 5
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: MyEdgeInsets.standard,
              child: Column(
                children: [
                  TitleAndButtonWidget(title: "Detalhes", buttonText: ' '),
                  GridView.builder(
                    padding: EdgeInsets.only(top: 0),
                    itemCount: icons.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(icons[index], color: MyColors.primaryColor, size: 28), // Ícone
                            const SizedBox(height: 5.0),
                            AutoSizeText(
                              "Icone",
                              style: theme.textTheme.labelSmall!.copyWith(fontSize: 13, color: MyColors.grey, fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,

                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 15,),
                  TitleAndButtonWidget(title: "Descrição", buttonText: ' '),
                  const SizedBox(height: 15,),
                  AutoSizeText(
                    "Na residência, uma sala ampla e elegante abre-se com uma lareira central, enquanto a cozinha moderna se integra a uma generosa área de jantar. Os quartos oferecem suítes luxuosas, e o pátio externo apresenta uma piscina convidativa. Complementada por uma sala de entretenimento e espaços versáteis, a casa une conforto e sofisticação.",
                    style: theme.textTheme.labelSmall!.copyWith(color: MyColors.grey, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
        
          ],
        ),
      ),
    );
  }
}