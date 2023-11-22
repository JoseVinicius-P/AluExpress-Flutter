import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widgets/default_button_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/widgets/flexible_sized_box.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: MyEdgeInsets.getInsetsBelowStatusBar(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "Bem Vindo ao 👋",
              style: theme.textTheme.titleMedium!.copyWith(),
              textAlign: TextAlign.left,
              maxFontSize: 50,
              maxLines: 1,
            ),
            const FlexibleSizedBox(height: 10,),
            AutoSizeText(
              "Luguel",
              style: theme.textTheme.titleLarge!.copyWith(),
              textAlign: TextAlign.left,
              maxFontSize: 80,
              maxLines: 1,
            ),
            const FlexibleSizedBox(height: 25,),
            AutoSizeText(
              "Encontre seu lar perfeito! Onde a Casa dos seus sonhos se torna um aluguel da realidade!",
              style: theme.textTheme.labelSmall!.copyWith(),
              textAlign: TextAlign.left,
              maxFontSize: 30,
              maxLines: 3,
            ),
            const FlexibleSizedBox(height: 35,),
            DefaultButtonWidget(
              onTap: () => Modular.to.pushNamed("/presentation_slide"),
              text: "Vamos começar",
              icon: const Icon(Icons.keyboard_arrow_right_rounded, color: MyColors.iconButtonColor,),
              backgroundColor: MyColors.primaryColor,
              textColor: Colors.white,
              shadow: true,
            ),
          ],
        ),
      ),
    );
  }
}