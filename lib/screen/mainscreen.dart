// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/provider/provider.dart';
import 'package:food_delivery_app/screen/home/editScreens/category.dart';
import 'package:food_delivery_app/screen/home/editScreens/menu.dart';
import 'package:food_delivery_app/screen/home/homescreen.dart';
import 'package:food_delivery_app/screen/home/order_screen.dart';
import 'package:food_delivery_app/screen/myitems/my_items.dart';
import 'package:food_delivery_app/screen/profile/profile_dashboard.dart';
import 'package:food_delivery_app/screen/revenue_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> screens = [
    HomeScreen(),
    CategoryEditScreen(
      key: UniqueKey(),
      section: "Add",
    ),
    CategoryEditScreen(
      key: UniqueKey(),
      section: "Edit",
    ),
    MenuEditScreen(
      key: UniqueKey(),
      section: "Add",
    ),
    MenuEditScreen(
      key: UniqueKey(),
      section: "Edit",
    ),
    OrderScreen(
      key: UniqueKey(),
    ),
    RevenueScreen(
      key: UniqueKey(),
    ),
    ItemsScreen(
      key: UniqueKey(),
    ),
    ProfileDashboard(
      key: UniqueKey(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryBGColor,
        body: Consumer<MyProvider>(
          builder: (context, data, child) {
            return screens[data.getCurrentIndex()];
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3, color: Colors.black45, offset: Offset(0, -1))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          height: 50,
          width: size.width,
          child: Consumer<MyProvider>(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        provider.updateIndex(0);
                        provider.updateScreen('home');
                      },
                      child: Icon(
                        Icons.home,
                        color: value.getActiveScreen() == 'home'
                            ? primaryColor
                            : Colors.grey.shade700,
                        size: 35,
                      )),
                  InkWell(
                    onTap: () {
                      provider.updateIndex(7);
                      provider.updateScreen('items');
                    },
                    child: Material(
                      color: value.getActiveScreen() == 'items'
                          ? primaryColor
                          : Colors.grey.shade700,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      provider.updateIndex(8);
                      provider.updateScreen('profile');
                    },
                    child: Material(
                      color: value.getActiveScreen() == 'profile'
                          ? primaryColor
                          : Colors.grey.shade700,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.person_outline_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
