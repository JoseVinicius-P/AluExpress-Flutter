import 'package:flutter_modular/flutter_modular.dart';
import 'package:luguel/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/home/pages/lists_houses_page.dart';
import 'package:luguel/app/modules/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:luguel/app/shared/utilities/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();
  final pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(11)
              ),
              padding: const EdgeInsets.all(3),
              child: const Icon(Icons.home_rounded, color: Colors.white, size: 25,)
            ),
            const SizedBox(width: 8,),
            Text(
              "Luguel",
              style: theme.textTheme.titleMedium!.copyWith(color: MyColors.textColor, fontSize: 22),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.notifications_active_outlined, color: MyColors.textColor)
          )
        ],
      ),
      body: PageView(
        //Controller
        controller: pageViewController,
        children: const [
          ListsHousesPage(),
          SizedBox(),
          SizedBox(),
          SizedBox(),
        ],
      ),

      //Criando o BottomNavigation
      bottomNavigationBar: BottomNavigationBarWidget(pageViewController: pageViewController),
    );
  }
}