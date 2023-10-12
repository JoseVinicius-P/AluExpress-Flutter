import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/presentation/presentation_store.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/my_colors.dart';

class PresentationPage extends StatefulWidget {
  final String title;
  const PresentationPage({Key? key, this.title = 'PresentationPage'}) : super(key: key);
  @override
  PresentationPageState createState() => PresentationPageState();
}
class PresentationPageState extends State<PresentationPage> with SingleTickerProviderStateMixin/*Usado para sincronizar animação com frame rate do dispositivo*/ {
  final PresentationStore store = Modular.get();
  late AnimationController _animationController; //Usado para controlar a animação
  late Animation<double> _animation; //Armazena o tipo da animaçãdicion

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this, //sincronizando com atualização da tela
      duration: const Duration(seconds: 15), // Duração da animação
    );

    _animation = Tween(begin: 1.0, end: 1.1).animate(_animationController); //Tipo da animação

    // Inicia a animação automaticamente
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose(); //Desativando animação quando tela for fechada
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Widget esponsavel por animar
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: const Image(
                      image: AssetImage('assets/images/presentation_background.jpg'),
                      fit: BoxFit.cover,),
                  ),
                );
              },
            ),
            Column(
              children: [
                const Spacer(),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.7)],
                      ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 105,),
                        AutoSizeText(
                          "Bem Vindo ao 👋",
                          style: theme.textTheme.titleMedium!.copyWith(),
                          textAlign: TextAlign.left,
                          maxFontSize: 50,
                        ),
                        const SizedBox(height: 10,),
                        AutoSizeText(
                          "Luguel",
                          style: theme.textTheme.titleLarge!.copyWith(),
                          textAlign: TextAlign.left,
                          maxFontSize: 80,

                        ),
                        const SizedBox(height: 25,),
                        AutoSizeText(
                          "Encontre seu lar perfeito! Onde a Casa dos seus sonhos se torna um aluguel da realidade!",
                          style: theme.textTheme.labelSmall!.copyWith(),
                          textAlign: TextAlign.left,
                          maxFontSize: 30,
                        ),
                        const SizedBox(height: 35,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(35),
                                  //Se a authenticação estiver sendo feita o botão não funcionará
                                  onTap: () => Modular.to.pushNamed("/presentation_slide"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(35),
                                        ),
                                        border: Border.all(
                                          width: 1,
                                          style: BorderStyle.solid,
                                          color: Colors.transparent,
                                        ),
                                        color: MyColors.primaryColor,
                                        boxShadow: [
                                          BoxShadow(
                                            color: MyColors.primaryColor.withOpacity(0.4),
                                            spreadRadius: 0.1,
                                            blurRadius: 15,
                                            offset: const Offset(2, 10),
                                          ),
                                        ]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: AutoSizeText(
                                        maxLines: 1,
                                        'Vamos começar',
                                        style: theme.textTheme.labelSmall,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 30,),
                      ],
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}