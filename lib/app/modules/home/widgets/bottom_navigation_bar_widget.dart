import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

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