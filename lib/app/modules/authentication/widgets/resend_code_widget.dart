import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/my_colors.dart';

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
  late int seconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    seconds = widget.countdownSeconds;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer(){
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds < 1) {
          timer.cancel();
        } else {
          seconds = seconds - 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return seconds != 0 ?
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          "Você pode reenviar o código em",
          style: theme.textTheme.labelSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        AutoSizeText(
          " $seconds ",
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
        setState(() {
          seconds = widget.countdownSeconds;
        });
        startTimer();
        widget.onTapResendCode();
      },
      child: AutoSizeText(
        "Reenviar código",
        style: theme.textTheme.labelSmall?.copyWith(color: MyColors.primaryColor, fontWeight: FontWeight.normal),
      ),
    );
  }
}