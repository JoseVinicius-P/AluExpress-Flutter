import 'package:flutter/material.dart';

class VerticalDividerWidget extends StatelessWidget {
  const VerticalDividerWidget({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Expanded(child: Container(color: Colors.grey.withOpacity(0.5), width: 1)),
          const SizedBox(height: 8,),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              text,
              style: theme.textTheme.labelSmall!.copyWith(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.normal, fontSize: 18),
            ),
          ),
          const SizedBox(height: 8,),
          Expanded(child: Container(color: Colors.grey.withOpacity(0.5), width: 1)),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}