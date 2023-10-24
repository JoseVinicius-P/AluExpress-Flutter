import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key, required this.text, required this.textAlign,
  });

  final String text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: AutoSizeText(
                  text,
                  style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 10.sw),
                  textAlign: textAlign,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}