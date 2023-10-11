import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/presentation/presentation_store.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatefulWidget {
  final String title;
  const PresentationPage({Key? key, this.title = 'PresentationPage'}) : super(key: key);
  @override
  PresentationPageState createState() => PresentationPageState();
}
class PresentationPageState extends State<PresentationPage> {
  final PresentationStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: const Image(
                image: AssetImage('assets/images/presentation_background.jpg'),
                fit: BoxFit.cover,),
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
                        const SizedBox(height: 25,),
                        Text(
                          "Bem Vindo ao 👋",
                          style: theme.textTheme.titleMedium!.copyWith(),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          "Luguel",
                          style: theme.textTheme.titleLarge!.copyWith(),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 25,),
                        Text(
                          "Encontre seu lar perfeito! Onde a Casa dos seus sonhos se torna um aluguel da realidade!",
                          style: theme.textTheme.labelSmall!.copyWith(),
                          textAlign: TextAlign.left,
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