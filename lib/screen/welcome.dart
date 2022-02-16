// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/constant/textstyles.dart';
import 'package:food_delivery_app/screen/verification.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: primaryBGColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.4,
                  color: Colors.amber,
                  child: Image.asset(
                    "assets/images/welcome.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Welcome",
                    style: headingStyle,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 10,
                        thickness: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5),
                      child: Text(
                        "To get started Login or signup",
                        style: normalStyle,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 10,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: size.width * 0.95,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 2, color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: TextField(
                        style: normalStyle,
                        controller: phone,
                        decoration: InputDecoration(
                          hintStyle: labelStyle,
                          border: InputBorder.none,
                          hintText: "Enter Mobile Number",
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20.0, left: 10, right: 10, top: 10),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationScreen()))
                    },
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
                          "Login",
                          textAlign: TextAlign.center,
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        height: 10,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        "OR",
                        style: GoogleFonts.readexPro(
                          textStyle: TextStyle(
                              fontSize: 16, color: Colors.grey.shade700),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 10,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.2, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Material(
                        color: Colors.white,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/icons/google.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        shape: CircleBorder(),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue.shade900,
                            )),
                      ),
                      Material(
                        color: Colors.white,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FontAwesomeIcons.apple,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: SizedBox(
                      width: size.width * 0.8,
                      child: RichText(
                        // "By continuing you about to agree the terms and conditions.",
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                fontSize: 13, color: Colors.black),
                          ),
                          children: [
                            const TextSpan(
                                text: "By continuing you about to agree the "),
                            TextSpan(
                              text: "Terms & Conditions",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 13, color: primaryColor),
                              ),
                            ),
                            TextSpan(text: " and "),
                            TextSpan(
                              text: "Privacy Policy",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 13, color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
