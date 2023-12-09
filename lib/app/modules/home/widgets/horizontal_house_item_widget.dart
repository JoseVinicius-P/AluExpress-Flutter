import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';


class HorizontalHouseItemWidget extends StatelessWidget {
  const HorizontalHouseItemWidget({
    super.key, this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 126,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5.0,
                spreadRadius: 1,
              ),
            ]
        ),
        padding: MyEdgeInsets.standard,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const Image(
                image: AssetImage('assets/images/house.png'),
                width: 100,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Casa grande",
                  style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 20),
                ),
                Text(
                  "Iaciara - GO",
                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.yellow, size: 15,),
                    const SizedBox(width: 3,),
                    AutoSizeText(
                      "4,8",
                      style: theme.textTheme.labelSmall!.copyWith(color: MyColors.grey),
                    ),
                    const SizedBox(width: 3,),
                    Text(
                      "(150 avaliações)",
                      style: theme.textTheme.titleMedium!.copyWith(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.grey),
                      textAlign: TextAlign.left,
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10,),
                Text(
                  "R\$ 400,00",
                  style: theme.textTheme.titleMedium!.copyWith(color: MyColors.primaryColor, fontSize: 18),
                ),
                Text(
                  "/mês",
                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}