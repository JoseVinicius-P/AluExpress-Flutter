import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AccessOptionsPage extends StatefulWidget {
  const AccessOptionsPage({Key? key}) : super(key: key);
  @override
  AccessOptionsPageState createState() => AccessOptionsPageState();
}
class AccessOptionsPageState extends State<AccessOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => SystemNavigator.pop(),
          icon: const Icon(Icons.close_rounded, color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: OrientationLayoutBuilder(
          portrait: (context) => const Column(
            children: [
              TitleWidget(),
              OptionsAccessWidget(),
            ],
          ),
          landscape: (context) => const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TitleWidget(),
              OptionsAccessWidget(),
            ],
          ),
        ),

      ),
    );
  }
}

class OptionsAccessWidget extends StatelessWidget {
  const OptionsAccessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
    child: Column(
      children: [
        const Spacer(),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('assets/images/icon_google.png'),
                    width: 6.sw,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 8),
                  AutoSizeText(
                    maxLines: 1,
                    minFontSize: 2.5.sw.roundToDouble(),
                    'Continuar com o google',
                    style: theme.textTheme.labelSmall!.copyWith( color: Colors.black),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(child: Container(color: Colors.grey.withOpacity(0.5), height: 1)),
              const SizedBox(width: 8,),
              Text(
                "ou",
                style: theme.textTheme.labelSmall!.copyWith(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.normal, fontSize: 18),
              ),
              const SizedBox(width: 8,),
              Expanded(child: Container(color: Colors.grey.withOpacity(0.5), height: 1)),
              const SizedBox(width: 10,),
            ],
          ),
        ),
        const SizedBox(height: 35),
        DefaultButtonWidget(
          onTap: (){},
          text: "Entrar com email e senha",
          backgroundColor: MyColors.primaryColor,
          textColor: Colors.white,
          shadow: true,
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              "Não tem conta?",
              style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
            ),
            TextButton(
              onPressed: (){},
              child: AutoSizeText(
                "Criar agora",
                style: theme.textTheme.labelSmall!.copyWith(color: MyColors.primaryColor),
              ),
            )
          ],
        ),
        ],
      )
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "Como vamos\nentrar?",
            style: theme.textTheme.titleMedium!.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}