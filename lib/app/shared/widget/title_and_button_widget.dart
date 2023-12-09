import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';


class TitleAndButtonWidget extends StatelessWidget {
  const TitleAndButtonWidget({
    super.key, required this.title, required this.buttonText, this.onTapButton,
  });

  final String title;
  final String buttonText;
  final void Function()? onTapButton;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 18),
        ),
        InkWell(
          enableFeedback: false,
          onTap: onTapButton,
          child: Text(
            buttonText,
            style: theme.textTheme.titleMedium!.copyWith(color: MyColors.primaryColor, fontSize: 16, fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}