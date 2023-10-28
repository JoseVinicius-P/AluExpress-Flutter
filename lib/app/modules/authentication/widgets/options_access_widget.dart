import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/divider_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/google_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/question_and_button_widget.dart';
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
  final void Function()? onTapCreateAccount;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GoogleButtonWidget(onTap: onTapGoogleButton),
            const SizedBox(height: 35),
            const DividerWidget(text: "ou"),
            const SizedBox(height: 35),
            DefaultButtonWidget(
              onTap: () => onTapSignEmailWithPassword(),
              text: "Entrar com email e senha",
              backgroundColor: MyColors.primaryColor,
              textColor: Colors.white,
              shadow: true,
            ),
            const SizedBox(height: 50),
            QuestionAndButtonWidget(
                question: "Não tem conta?",
                buttonText: "Criar agora",
                onPressed: onTapCreateAccount
            ),
          ],
        )
    );
  }
}