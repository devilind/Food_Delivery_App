// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/constant/textstyles.dart';

import 'package:food_delivery_app/provider/provider.dart';
import 'package:food_delivery_app/screen/home/models/categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Home",
                              style: titleStyle,
                            ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 0),
                                  blurRadius: 2)
                            ]),
                        height: 50,
                        width: size.width,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.search_outlined,
                                  color: primaryColor,
                                  size: 25,
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                style: normalStyle,
                                controller: searchController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    counterText: "",
                                    hintStyle: hintStyle,
                                    hintText: "Search by vender/menu"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5.0, left: 8, right: 8),
                            child: Text(
                              "Categories",
                              style: normalStyle,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              screenIndex.updateIndex(1);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 5.0, left: 8, right: 8),
                              child: Material(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Add Categories",
                                    style: subTitleStyle,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 140,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.builder(
                            key: PageStorageKey<String>("categoriesList"),
                            padding: EdgeInsets.only(left: 0, right: 5, top: 0),
                            scrollDirection: Axis.horizontal,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 130,
                                  height: 140,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                categories[index].imageUrl),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0, right: 4, top: 4),
                                            child: Text(
                                              categories[index].name,
                                              style: GoogleFonts.readexPro(
                                                textStyle: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              screenIndex.updateIndex(2);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0, right: 4, top: 4),
                                              child: Text(
                                                "Edit",
                                                style: GoogleFonts.readexPro(
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade500),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5.0, left: 8, right: 8),
                            child: Text(
                              "Menu",
                              style: normalStyle,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              screenIndex.updateIndex(3);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 5.0, left: 8, right: 8),
                              child: Material(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "Add Menu",
                                    style: subTitleStyle,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 140,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ListView.builder(
                            key: PageStorageKey<String>("menuList"),
                            padding: EdgeInsets.only(left: 0, right: 5, top: 0),
                            scrollDirection: Axis.horizontal,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: categories.length,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 130,
                                  height: 140,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                categories[index].imageUrl),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0, right: 4, top: 4),
                                            child: Text(
                                              categories[index].name,
                                              style: GoogleFonts.readexPro(
                                                textStyle: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              screenIndex.updateIndex(4);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0, right: 4, top: 4),
                                              child: Text(
                                                "Edit",
                                                style: GoogleFonts.readexPro(
                                                  textStyle: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Colors.grey.shade500),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "My Orders",
                              style: GoogleFonts.readexPro(
                                textStyle: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                screenIndex.updateIndex(5);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: size.width * 0.45,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage("assets/images/order.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Revenue Tracking",
                              style: GoogleFonts.readexPro(
                                textStyle: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                screenIndex.updateIndex(6);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: size.width * 0.45,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/images/revenue.jpg"),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    )
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
