import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
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
                            height: 22.sh,
                          ),
                        ),
                        Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Opacity(
                            opacity: _scaleAnimation.value/4,
                            child: Image(
                              image: AssetImage('assets/images/shadow.png'),
                              fit: BoxFit.cover,
                              height: 12.sh,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                )
              ),
              AutoSizeText(
                "Selecione qual o contato você quer usar para redefinir sua senha.",
                style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 25,),
              ContactMethodWidget(
                icon: Icons.message_rounded,
                nameOfContactMethod: "SMS",
                contactMethod: "(62)  9 * * * - * * 94",
              ),
              SizedBox(height: 10,),
              ContactMethodWidget(
                icon: Icons.email_rounded,
                nameOfContactMethod: "email",
                contactMethod: "josev*****@gmail.com",
              ),
              Spacer(),
              DefaultButtonWidget(
                onTap: (){},
                text: "Continuar",
                backgroundColor: MyColors.primaryColor,
                textColor: Colors.white,
                shadow: true,
                icon: const Icon(Icons.keyboard_arrow_right_rounded, color: Colors.white,),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContactMethodWidget extends StatelessWidget {
  const ContactMethodWidget({
    super.key,
    this.isSelected,
    required this.icon,
    required this.nameOfContactMethod,
    required this.contactMethod,
  });

  final bool? isSelected;
  final IconData icon;
  final String nameOfContactMethod;
  final String contactMethod;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: MyColors.grayLight,
          width: 2
        ),
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: MyColors.primaryColor.withOpacity(0.05),
            ),
            padding: EdgeInsets.all(25),
            child: Icon(icon, color: MyColors.primaryColor,),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Via $nameOfContactMethod:",
                style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 8,),
              AutoSizeText(
                contactMethod,
                style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}