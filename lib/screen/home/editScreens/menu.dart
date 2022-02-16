// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/constant/textstyles.dart';
import 'package:food_delivery_app/provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuEditScreen extends StatelessWidget {
  final String section;
  MenuEditScreen({Key? key, required this.section}) : super(key: key);

  final greyText = GoogleFonts.readexPro(
    textStyle: TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
  );
  final greyLightText = GoogleFonts.readexPro(
    textStyle: TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
  );

  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController priceperplate = TextEditingController();

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
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width,
                            height: 50,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Menu",
                                  style: titleStyle,
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
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                              "$section Menu",
                              style: GoogleFonts.readexPro(
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade700),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 20),
                            child: Material(
                              color: Colors.grey.shade300,
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: size.width,
                                height: size.height * 0.2,
                                child: Center(
                                  child:
                                      Text("Upload Picture", style: greyText),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Name",
                                textAlign: TextAlign.left,
                                style: greyLightText,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: 50,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade500),
                            ),
                            child: TextFormField(
                              style: normalStyle,
                              controller: name,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Description",
                                textAlign: TextAlign.left,
                                style: greyLightText,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: 50,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade500),
                            ),
                            child: TextFormField(
                              style: normalStyle,
                              controller: description,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Price per Plate",
                                textAlign: TextAlign.left,
                                style: greyLightText,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width,
                            height: 50,
                            padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade500),
                            ),
                            child: TextFormField(
                              style: normalStyle,
                              controller: priceperplate,
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          InkWell(
                            onTap: () => {},
                            child: Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Upload",
                                  textAlign: TextAlign.center,
                                  style: buttonTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
