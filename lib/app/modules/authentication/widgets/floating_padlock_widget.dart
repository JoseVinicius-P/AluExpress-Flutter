
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FloatingPadlockWidget extends StatefulWidget {
  const FloatingPadlockWidget({Key? key}) : super(key: key);

  @override
  State<FloatingPadlockWidget> createState() => _FloatingPadlockWidgetState();
}

class _FloatingPadlockWidgetState extends State<FloatingPadlockWidget> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void initializeAnimation(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Defina a duração da animação aqui
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
  Widget build(BuildContext context) {
    initializeAnimation();
    return AnimatedBuilder(
        animation: _floatAnimation,
        builder: (context, child) {
          return Column(
            children: [
              Transform.translate(
                offset: Offset(0, _floatAnimation.value),
                child: Image(
                  image: const AssetImage('assets/images/padlock2.png'),
                  fit: BoxFit.cover,
                  height: 22.sh,
                ),
              ),
              Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _scaleAnimation.value/4,
                  child: Image(
                    image: const AssetImage('assets/images/shadow.png'),
                    fit: BoxFit.cover,
                    height: 12.sh,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}