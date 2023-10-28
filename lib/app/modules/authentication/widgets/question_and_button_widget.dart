import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/my_colors.dart';


class QuestionAndButtonWidget extends StatelessWidget {
  const QuestionAndButtonWidget({
    super.key, required this.question, required this.textButton, required this.onPressed,
  });

  final String question;
  final String textButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: AutoSizeText(
            question,
            style: theme.textTheme.labelSmall!.copyWith(color: Colors.grey, fontWeight: FontWeight.normal),
            maxLines: 1,
            softWrap: true,
          ),
        ),
        Flexible(
          child: TextButton(
            onPressed: onPressed,
            child: AutoSizeText(
              textButton,
              style: theme.textTheme.labelSmall!.copyWith(color: MyColors.primaryColor),
              maxLines: 1,
              softWrap: true,
            ),
          ),
        )
      ],
    );
  }
}