import 'package:flutter/material.dart';
import 'package:luguel/app/shared/widgets/divider_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/google_button_widget.dart';
import 'package:luguel/app/modules/authentication/widgets/question_and_button_widget.dart';
import 'package:luguel/app/shared/widgets/default_button_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/widgets/flexible_sized_box.dart';

class OptionsAccessWidget extends StatelessWidget {
  const OptionsAccessWidget({
    super.key,
    required this.onTapGoogleButton,
    required this.onTapSignEmailWithPassword,
    required this.onTapCreateAccount,
    required this.onTapLoginAsVisitor,
  });

  final void Function() onTapGoogleButton;
  final void Function() onTapSignEmailWithPassword;
  final void Function() onTapCreateAccount;
  final void Function() onTapLoginAsVisitor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GoogleButtonWidget(onTap: onTapGoogleButton),
        const FlexibleSizedBox(height: 30),
        const DividerWidget(text: "ou"),
        const FlexibleSizedBox(height: 30),
        DefaultButtonWidget(
          onTap: onTapSignEmailWithPassword,
          text: "Entrar com email e senha",
          backgroundColor: MyColors.primaryColor,
          textColor: MyColors.textButtonColor,
          shadow: false,
        ),
        const FlexibleSizedBox(height: 25),
        DefaultButtonWidget(
          onTap: onTapLoginAsVisitor,
          text: "Entrar como visitante",
          backgroundColor: MyColors.secondaryColor,
          textColor: MyColors.primaryColor,
          shadow: false,
          icon: const Icon(Icons.person_outlined, color: MyColors.primaryColor,),
        ),
        const FlexibleSizedBox(height: 50),
        QuestionAndButtonWidget(
            question: "Não tem conta?",
            buttonText: "Criar agora",
            onPressed: onTapCreateAccount
        ),
      ],
    );
  }
}