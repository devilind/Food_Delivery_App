// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/constant/textstyles.dart';
import 'package:food_delivery_app/provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final TextStyle acceptStyle = GoogleFonts.readexPro(
    textStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: primaryColor),
  );

  final TextStyle declineStyle = GoogleFonts.readexPro(
    textStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
  );

  final TextStyle commonStyle = GoogleFonts.readexPro(
    textStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade800),
  );
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (provider.currentIndex != 0) {
          provider.updateIndex(0);
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
                child: Padding(
                  padding: const EdgeInsets.only(),
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
                                    if (provider.currentIndex != 0) {
                                      provider.updateIndex(0);
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        itemCount: provider.orders.length,
                        itemBuilder: ((context, index) => Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(bottom: 0),
                                    shrinkWrap: true,
                                    itemCount: index == 0 ? 2 : 1,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 5),
                                            child: Container(
                                              width: 75,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        'assets/categories/cholepuri.jpg')),
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 70,
                                            width: size.width * 0.75,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0.0, right: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "#1234",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .readexPro(
                                                          textStyle: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                      ),
                                                      Text(
                                                        "JB Nagar, Mumbai",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .readexPro(
                                                          textStyle: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  primaryColor),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          provider.orders[index]
                                                              .name,
                                                          style: commonStyle),
                                                      Text("Quantity: 1",
                                                          style: commonStyle),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Date: 12/0.3/2022",
                                                          style: commonStyle),
                                                      Text("04:55 PM",
                                                          style: commonStyle),
                                                      Text(" ₹100",
                                                          style: commonStyle)
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, bottom: 8, right: 8),
                                    child: Row(
                                      children: [
                                        Consumer<MyProvider>(
                                          builder: (context, value, child) {
                                            if (provider.orders[index].status ==
                                                '') {
                                              return Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      provider
                                                          .updateOrderStatus(
                                                              index,
                                                              "Accepted");
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Text(
                                                        "Accept",
                                                        style: acceptStyle,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      provider
                                                          .updateOrderStatus(
                                                              index,
                                                              "Declined");
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15,
                                                              vertical: 2),
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .grey.shade300,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      child: Text(
                                                        "Decline",
                                                        style: declineStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else if (provider
                                                    .orders[index].status ==
                                                "Accepted") {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Text(
                                                  "Accepted",
                                                  style: acceptStyle,
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 2),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade300,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Text(
                                                  "Declined",
                                                  style: declineStyle,
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        Spacer(),
                                        Container(
                                          alignment: Alignment.centerRight,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text("Total: ₹200",
                                              style: commonStyle),
                                        )
                                      ],
                                    ),
                                  ),
                                  Material(
                                    color: Colors.grey.shade300,
                                    child: SizedBox(
                                      height: 10,
                                      width: size.width,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
