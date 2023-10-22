import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/divider_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/google_button_widget.dart';
import 'package:luguel/app/shared/default_button_widget.dart';
import 'package:luguel/app/shared/my_colors.dart';

class OptionsAccessWidget extends StatelessWidget {
  const OptionsAccessWidget({
    super.key,
    required this.onTapGoogleButton,
    required this.onTapSignEmailWithPassword,
    required this.onTapCreateAccount,
  });

  final Function onTapGoogleButton;
  final Function onTapSignEmailWithPassword;
  final Function onTapCreateAccount;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GoogleButtonWidget(onTap: onTapGoogleButton),
            const SizedBox(height: 35),
            const DividerWidget(),
            const SizedBox(height: 35),
            DefaultButtonWidget(
              onTap: () => onTapSignEmailWithPassword(),
              text: "Entrar com email e senha",
              backgroundColor: MyColors.primaryColor,
              textColor: Colors.white,
              shadow: true,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    "Não tem conta?",
                    style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                ),
                Flexible(
                  child: TextButton(
                    onPressed: () => onTapCreateAccount(),
                    child: AutoSizeText(
                      "Criar agora",
                      style: theme.textTheme.labelSmall!.copyWith(color: MyColors.primaryColor),
                      maxLines: 1,
                    ),
                  ),
                )
              ],
            ),
          ],
        )
    );
  }
}