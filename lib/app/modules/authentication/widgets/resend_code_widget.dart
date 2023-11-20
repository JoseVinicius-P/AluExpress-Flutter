import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class ResendCodeWidget extends StatefulWidget {
  const ResendCodeWidget({
    super.key, required this.countdownSeconds, required this.onTapResendCode,
  });

  final int countdownSeconds;
  final void Function() onTapResendCode;

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return widget.countdownSeconds != 0 ?
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Você pode reenviar o código em",
          style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        AutoSizeText(
          " ${widget.countdownSeconds} ",
          style: theme.textTheme.labelSmall?.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.normal),
        ),
        AutoSizeText(
          "s",
          style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ],
    )
        :
    InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: (){
        widget.onTapResendCode();
      },
      child: AutoSizeText(
        "Reenviar código",
        style: theme.textTheme.labelSmall?.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.normal),
      ),
    );
  }
}