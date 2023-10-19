import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Function onTap;
  final String text;
  final Icon? icon;
  final Color backgroundColor;
  final Color textColor;
  final bool? shadow;
  const DefaultButtonWidget({
    super.key, required this.onTap, required this.text, this.icon, required this.backgroundColor, required this.textColor, this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(35),
            //Se a authenticação estiver sendo feita o botão não funcionará
            onTap: () => onTap(),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(35),
                  ),
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.transparent,
                  ),
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: shadow != null && shadow! ? backgroundColor.withOpacity(0.4) : Colors.transparent,
                      spreadRadius: 0.1,
                      blurRadius: 15,
                      offset: const Offset(2, 10),
                    ),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      maxLines: 1,
                      text,
                      style: theme.textTheme.labelSmall?.copyWith(color: textColor),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if(icon != null) icon!,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}