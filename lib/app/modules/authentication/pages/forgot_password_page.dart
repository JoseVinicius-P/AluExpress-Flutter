import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);
  @override
  ForgotPasswordPageState createState() => ForgotPasswordPageState();
}
class ForgotPasswordPageState extends State<ForgotPasswordPage> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _scaleAnimation;

  void initializeAnimation(){
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Defina a duração da animação aqui
    );

    _floatAnimation = Tween(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut
        )
    );

    _scaleAnimation = Tween(begin: 1.0, end: 1.3).animate(
        CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut
        )
    );


    _controller.repeat(reverse: true);// Repete a animação indefinidamente
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
    var theme = Theme.of(context);
    initializeAnimation();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Esqueci minha senha",
          style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: AnimatedBuilder(
                  animation: _floatAnimation,
                  builder: (context, child) {
                    return Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0, _floatAnimation.value),
                          child: Image(
                            image: AssetImage('assets/images/padlock2.png'),
                            fit: BoxFit.cover,
                            height: 28.sh,
                          ),
                        ),
                        Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Opacity(
                            opacity: 0.3,
                            child: Image(
                              image: AssetImage('assets/images/shadow.png'),
                              fit: BoxFit.cover,
                              height: 18.sh,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}