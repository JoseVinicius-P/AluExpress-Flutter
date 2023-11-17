
import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FloatingImageWidget extends StatefulWidget {
  const FloatingImageWidget({Key? key, required this.assetImage}) : super(key: key);

  final AssetImage assetImage;

  @override
  State<FloatingImageWidget> createState() => _FloatingImageWidgetState();
}

class _FloatingImageWidgetState extends State<FloatingImageWidget> with TickerProviderStateMixin{
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
                  image: widget.assetImage,
                  fit: BoxFit.cover,
                  height: 22.sh,
                ),
              ),
              const SizedBox(height: 20,),
              Transform.scale(
                scale: _scaleAnimation.value,
                child: Opacity(
                  opacity: _scaleAnimation.value/4,
                  child: Image(
                    image: const AssetImage('assets/images/shadow.png'),
                    fit: BoxFit.cover,
                    height: 6.sh,
                  ),
                ),
              ),
            ],
          );
        }
    );
  }
}