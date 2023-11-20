import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SlidePageWidget extends StatelessWidget {
  const SlidePageWidget({
    super.key,
    required this.slidePath,
    required this.title,
    required this.subtitle,
    required this.expandImage,
  });

  final String slidePath;
  final String title;
  final String subtitle;
  final bool expandImage;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          constraints: expandImage ? const BoxConstraints.expand() : BoxConstraints.tightFor(width: 100.sw),
          child: Image(
            image: AssetImage(slidePath),
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: MyEdgeInsets.standard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Spacer(),
              Flexible(
                child: SizedBox(
                  width: 40.sw,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        color: Colors.white.withOpacity(0.99)
                    ),
                    child: Padding(
                      padding: MyEdgeInsets.insideTextBubble,
                      child: AutoSizeText(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white.withOpacity(0.99)
                  ),
                  child: Padding(
                    padding: MyEdgeInsets.insideTextBubble,
                    child: AutoSizeText(
                      subtitle,
                      style: theme.textTheme.labelSmall?.copyWith(color: Colors.grey, fontSize: 3.5.sw),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}