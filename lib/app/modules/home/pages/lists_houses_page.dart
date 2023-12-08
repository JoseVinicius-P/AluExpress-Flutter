import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/home/widgets/horizontal_house_item_widget.dart';
import 'package:luguel/app/modules/home/widgets/vertical_house_item_widget.dart';
import 'package:luguel/app/modules/home/widgets/simple_filter_item_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';
import 'package:luguel/app/shared/utilities/my_edge_insets.dart';
import 'package:luguel/app/shared/widgets/text_field_widget.dart';

class ListsHousesPage extends StatelessWidget {
  const ListsHousesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MyEdgeInsets.standard,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Olá, José 👋",
                  style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 35),
                ),
                const SizedBox(height: 15,),
                TextFieldWidget(
                  hint: "Pesquisar",
                  prefixIcon: Icons.search_rounded,
                  suffixIcon: Icons.tune_rounded,
                  onPressedSuffixIcon: (){},
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: MyEdgeInsets.standard.left,),
                    SimpleFilterItemWidget(textFilter: "Bem avaliadas", onTap: (){}, isSelected: true,),
                    const SizedBox(width: 5,),
                    SimpleFilterItemWidget(textFilter: "Mais baratas", onTap: (){}, isSelected: false,),
                    const SizedBox(width: 5,),
                    SimpleFilterItemWidget(textFilter: "Mais Caras", onTap: (){}, isSelected: false,),
                    const SizedBox(width: 5,),
                    SimpleFilterItemWidget(textFilter: "Em alta", onTap: (){}, isSelected: false,),
                    SizedBox(width: MyEdgeInsets.standard.right,),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: MyEdgeInsets.standard.left,),
                    const VerticalHouseItemWidget(),
                    const SizedBox(width: 15,),
                    const VerticalHouseItemWidget(),
                    const SizedBox(width: 15,),
                    const VerticalHouseItemWidget(),
                    const SizedBox(width: 15,),
                    const VerticalHouseItemWidget(),
                    const SizedBox(width: 15,),
                    SizedBox(width: MyEdgeInsets.standard.right,),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: MyEdgeInsets.standard,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add recentemente",
                      style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 18),
                    ),
                    Text(
                      "Ver tudo",
                      style: theme.textTheme.titleMedium!.copyWith(color: MyColors.primaryColor, fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const HorizontalHouseItemWidget();
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 15,),
                    itemCount: 25)
              ],
            ),
          )
        ],
      ),
    );
  }
}