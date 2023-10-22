import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({
    super.key, required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: const AssetImage('assets/images/icon_google.png'),
                width: 6.sw,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              AutoSizeText(
                maxLines: 1,
                minFontSize: 2.5.sw.roundToDouble(),
                'Continuar com o google',
                style: theme.textTheme.labelSmall!.copyWith( color: Colors.black),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}