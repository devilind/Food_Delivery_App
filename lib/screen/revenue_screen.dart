// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant/constants.dart';
import 'package:food_delivery_app/constant/textstyles.dart';
import 'package:food_delivery_app/provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RevenueScreen extends StatelessWidget {
  RevenueScreen({Key? key}) : super(key: key);

  final greyTextStyle = GoogleFonts.readexPro(
    textStyle: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
  );
  TooltipBehavior tooltipBehavior = TooltipBehavior(
    enable: true,
    header: 'Revenue',
    textStyle: GoogleFonts.readexPro(
      textStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
    ),
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
                                  "Revenue Tracking",
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
                    Text(
                      "₹ 10,230",
                      style: titleStyle,
                    ),
                    Text(
                      'Total Earnings',
                      style: greyTextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        color: Colors.grey.shade300,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          height: 300,
                          width: size.width,
                          child: SfCartesianChart(
                            tooltipBehavior: tooltipBehavior,
                            title: ChartTitle(
                                text: 'Nov', textStyle: greyTextStyle),
                            primaryXAxis: CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            primaryYAxis: NumericAxis(
                              labelFormat: '{value}₹',
                              majorGridLines: MajorGridLines(width: 0),
                            ),
                            series: <ChartSeries>[
                              ColumnSeries<RevenueData, String>(
                                color: primaryColor,
                                enableTooltip: true,
                                dataLabelSettings: DataLabelSettings(
                                    textStyle: greyTextStyle,
                                    labelPosition:
                                        ChartDataLabelPosition.inside,
                                    labelAlignment: ChartDataLabelAlignment.top,
                                    isVisible: false),
                                dataSource: getColumnData(),
                                xValueMapper: (RevenueData revenue, _) =>
                                    revenue.x,
                                yValueMapper: (RevenueData revenue, _) =>
                                    revenue.y,
                                width: 0.1,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

class RevenueData {
  String x;
  double y;
  RevenueData(this.x, this.y);
}

getColumnData() {
  List<RevenueData> columnData = <RevenueData>[
    RevenueData("Mon", 1800),
    RevenueData("Tue", 1100),
    RevenueData("Wed", 1600),
    RevenueData("Thu", 1500),
    RevenueData("Fri", 800),
    RevenueData("Sat", 1900),
    RevenueData("Sun", 2400),
  ];
  return columnData;
}
