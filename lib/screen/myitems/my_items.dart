// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/constant/textstyles.dart';
import 'package:food_delivery_app/provider/provider.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenIndex = Provider.of<MyProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (screenIndex.currentIndex != 0) {
          screenIndex.updateIndex(0);
          return false;
        }
        return true;
      },
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (screenIndex.currentIndex != 0) {
                                    screenIndex.updateIndex(0);
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "My Items",
                                  style: titleStyle,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.notifications_on,
                              size: 28,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(top: 30),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 20),
                        child: ListTile(
                          leading: Container(
                            height: 70,
                            width: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/categories/dalrice.jpg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          title: SizedBox(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Dal Rice"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Material(
                                    elevation: 1,
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0,
                                          right: 5,
                                          top: 2,
                                          bottom: 2),
                                      child: Text("Available"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          trailing: SizedBox(
                              width: 50,
                              height: 40,
                              child: Center(child: Text("₹ 100"))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
