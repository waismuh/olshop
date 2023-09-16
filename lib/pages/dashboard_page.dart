import 'package:aostes/pages/cart_page.dart';
import 'package:aostes/pages/home_page.dart';
import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return CurvedNavBar(
      actionButton: CurvedActionBar(
          onTab: (value) {
            print(value);
          },
          activeIcon: Container(
            padding: EdgeInsets.all(17),
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: const Icon(
              Icons.add_shopping_cart_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          inActiveIcon: Container(
            padding: EdgeInsets.all(17),
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            child: const Icon(
              Icons.add_shopping_cart_outlined,
              size: 30,
              color: Colors.white70,
            ),
          ),),
      activeColor: Colors.white,
      navBarBackgroundColor: Colors.black,
      inActiveColor: Colors.white70,
      appBarItems: [
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            inActiveIcon: Icon(
              Icons.home,
              color: Colors.white70,
            ),
            text: 'Home'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            inActiveIcon: Icon(
              Icons.search,
              color: Colors.white70,
            ),
            text: 'Search'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.white,
            ),
            inActiveIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.white70,
            ),
            text: 'History'),
        FABBottomAppBarItem(
            activeIcon: Icon(
              Icons.person_2_outlined,
              color: Colors.white,
            ),
            inActiveIcon: Icon(
              Icons.person_2_outlined,
              color: Colors.white70,
            ),
            text: 'Profile'),
      ],
      bodyItems: [
        HomePage(),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        )
      ],
      actionBarView: CartPage(
      ),
    );
  }
}
