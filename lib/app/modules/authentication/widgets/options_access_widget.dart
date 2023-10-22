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
    return Expanded(
        child: Column(
          children: [
            const Spacer(),
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
                  onPressed: () => onTapCreateAccount(),
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