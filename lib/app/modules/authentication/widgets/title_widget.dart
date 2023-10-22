import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            "Como vamos\nentrar?",
            style: theme.textTheme.titleMedium!.copyWith(color: Colors.black, fontSize: 10.sw),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}