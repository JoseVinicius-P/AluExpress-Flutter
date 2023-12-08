import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/presentation/widgets/gradiend_background_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widgets/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(11)
              ),
              padding: const EdgeInsets.all(3),
              child: const Icon(Icons.home_rounded, color: Colors.white, size: 25,)
            ),
            const SizedBox(width: 8,),
            Text(
              "Luguel",
              style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 22),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications_active_outlined, color: MyColors.textColor)
          )
        ],
      ),
      body: PageView(
        //Controller
        controller: pageViewController,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MyEdgeInsets.standard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "Olá, José 👋",
                        style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 35),
                      ),
                      const SizedBox(height: 15,),
                      TextFieldWidget(
                        hint: "Pesquisar",
                        prefixIcon: Icons.search_rounded,
                        suffixIcon: Icons.tune_rounded,
                        onPressedSuffixIcon: (){},
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: MyEdgeInsets.standard.left,),
                          SimpleFilterWidget(textFilter: "Bem avaliadas", onTap: (){}, isSelected: true,),
                          const SizedBox(width: 5,),
                          SimpleFilterWidget(textFilter: "Mais baratas", onTap: (){}, isSelected: false,),
                          const SizedBox(width: 5,),
                          SimpleFilterWidget(textFilter: "Mais Caras", onTap: (){}, isSelected: false,),
                          const SizedBox(width: 5,),
                          SimpleFilterWidget(textFilter: "Em alta", onTap: (){}, isSelected: false,),
                          SizedBox(width: MyEdgeInsets.standard.right,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: MyEdgeInsets.standard.left,),
                          const ItemHouseWidget(),
                          const SizedBox(width: 15,),
                          const ItemHouseWidget(),
                          const SizedBox(width: 15,),
                          const ItemHouseWidget(),
                          const SizedBox(width: 15,),
                          const ItemHouseWidget(),
                          const SizedBox(width: 15,),
                          SizedBox(width: MyEdgeInsets.standard.right,),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: MyEdgeInsets.standard,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Add recentemente",
                            style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 18),
                          ),
                          Text(
                            "Ver tudo",
                            style: theme.textTheme.titleMedium!.copyWith(color: MyColors.primaryColor, fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 5.0,
                                  spreadRadius: 1,
                                ),
                              ]
                            ),
                            padding: MyEdgeInsets.standard,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: const Image(
                                    image: AssetImage('assets/images/house.png'),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Casa grande",
                                      style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 20),
                                    ),
                                    Text(
                                      "Iaciara - GO",
                                      style: theme.textTheme.titleMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey),
                                      textAlign: TextAlign.left,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star_rounded, color: Colors.yellow, size: 15,),
                                        const SizedBox(width: 3,),
                                        AutoSizeText(
                                          "4,8",
                                          style: theme.textTheme.labelSmall!.copyWith(color: MyColors.grey),
                                        ),
                                        const SizedBox(width: 3,),
                                        Text(
                                          "(150 avaliações)",
                                          style: theme.textTheme.titleMedium!.copyWith(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.grey),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 15,),
                        itemCount: 25)
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ],
      ),

      //Criando o BottomNavigation
      bottomNavigationBar: BottomNavigationBarWidget(pageViewController: pageViewController),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.pageViewController,
  });

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //Possibilitando a troca da current page usando o controller do PageView
        animation: pageViewController,
        builder: (context, snapshot) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5.0,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
              child: BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: Colors.transparent,
                currentIndex: pageViewController.page?.round() ?? 0,
                selectedItemColor: MyColors.primaryColor,
                unselectedItemColor: Colors.grey,
                onTap: (index){
                  pageViewController.animateToPage(index, // Índice da página para animar
                    duration: const Duration(milliseconds: 800), // Duração da animação
                    curve: Curves.easeInOutCubicEmphasized, // Curva de animação
                  );
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded),
                    label: 'Pesquisar'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_home),
                    label: 'Casas'
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_rounded),
                    label: 'Perfil'
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

class ItemHouseWidget extends StatelessWidget {
  const ItemHouseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 350,
      width: 262,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: Stack(
          children: [
            const Image(
              image: AssetImage('assets/images/house.png'),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: MyEdgeInsets.standard,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: MyColors.primaryColor
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.star_rounded, color: MyColors.iconButtonColor, size: 15,),
                            const SizedBox(width: 3,),
                            AutoSizeText(
                              "4,8",
                              style: theme.textTheme.labelSmall,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GradiendBackgroundWidget(
                child: Padding(
                  padding: MyEdgeInsets.standard,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Casa grande",
                            style: theme.textTheme.titleMedium!.copyWith(fontSize: 30),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Iaciara - Go",
                            style: theme.textTheme.titleMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w100),
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "R\$  400,00",
                                style: theme.textTheme.titleMedium!.copyWith(fontSize: 25),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "/mês",
                                style: theme.textTheme.titleMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.w100),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SimpleFilterWidget extends StatelessWidget {
  final String textFilter;
  final void Function() onTap;
  final bool isSelected;

  const SimpleFilterWidget({
    super.key, required this.textFilter, required this.onTap, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: MyColors.primaryColor
          ),
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? MyColors.primaryColor : Colors.white
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Text(
          textFilter,
          style: theme.textTheme.labelSmall!.copyWith(color: isSelected ? Colors.white : MyColors.primaryColor),
        ),
      ),
    );
  }
}