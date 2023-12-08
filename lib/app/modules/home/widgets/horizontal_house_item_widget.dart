import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/shared/widgets/gradiend_background_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';

class HorizontalHouseItemWidget extends StatelessWidget {
  const HorizontalHouseItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 350,
      width: 262,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45),
        child: Stack(
          children: [
            const Image(
              image: AssetImage('assets/images/house.png'),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: MyEdgeInsets.standard,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyColors.primaryColor
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.star_rounded, color: MyColors.iconButtonColor, size: 15,),
                            const SizedBox(width: 3,),
                            AutoSizeText(
                              "4,8",
                              style: theme.textTheme.labelSmall,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: GradiendBackgroundWidget(
                  child: Padding(
                    padding: MyEdgeInsets.standard,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Casa grande",
                              style: theme.textTheme.titleMedium!.copyWith(fontSize: 30),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Iaciara - Go",
                              style: theme.textTheme.titleMedium!.copyWith(fontSize: 20, fontWeight: FontWeight.w100),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "R\$  400,00",
                                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 25),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "/mês",
                                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.w100),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}