import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const SizedBox(width: 10,),
          Expanded(child: Container(color: Colors.grey.withOpacity(0.5), height: 1)),
          const SizedBox(width: 8,),
          Text(
            text,
            style: theme.textTheme.labelSmall!.copyWith(color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.normal, fontSize: 18),
          ),
          const SizedBox(width: 8,),
          Expanded(child: Container(color: Colors.grey.withOpacity(0.5), height: 1)),
          const SizedBox(width: 10,),
        ],
      ),
    );
  }
}