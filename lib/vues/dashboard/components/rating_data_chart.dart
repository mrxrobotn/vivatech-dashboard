import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:vtdashboard/constants.dart';
import 'package:vtdashboard/functions.dart';

import 'custom_loader.dart';



class RatingDataChart extends StatefulWidget {
  RatingDataChart({Key? key}) : super(key: key);

  @override
  State<RatingDataChart> createState() => _RatingDataChartState();
}

class _RatingDataChartState extends State<RatingDataChart> {
  int touchedIndex = -1;

  Map<String, double> ratingData = {};

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: appresults.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {


        if (!snapshot.hasData) {
          return const Text('No data available');
        }

        final docs = snapshot.data!.docs;

        ratingData.clear();

        // Calculate the percentage of 'good' and 'bad' ratings
        int excellentCount = 0;
        int goodCount = 0;
        int badCount = 0;

        Future<void> calculateRatingPercentage() async {
          for (final doc in docs) {
            final choicesSnapshot = await doc.reference.collection('choices').orderBy('num', descending: true).limit(1).get();

            final choicesDocs = choicesSnapshot.docs;

            for (final choiceDoc in choicesDocs) {
              final rating = choiceDoc.get('rating');

              if (rating == 'Excellent') {
                excellentCount++;
              } else if (rating == 'Good') {
                goodCount++;
              } else if (rating == 'Bad') {
                badCount++;
              }
            }
          }
        }
        return FutureBuilder<void>(
          future: calculateRatingPercentage(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLoader();
            }

            final totalCount = excellentCount + goodCount + badCount;
            final excellentPercentage = (excellentCount / totalCount) * 100;
            final goodPercentage = (goodCount / totalCount) * 100;
            final badPercentage = (badCount / totalCount) * 100;

            ratingData['Excellent'] = excellentPercentage;
            ratingData['Good'] = goodPercentage;
            ratingData['Bad'] = badPercentage;

            int ePercentage = excellentPercentage.toInt();
            int gPercentage = goodPercentage.toInt();
            int bPercentage = badPercentage.toInt();


            return PieChart(
              PieChartData(
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: List.generate(3, (i) {
                  final isTouched = i == touchedIndex;
                  final fontSize = isTouched ? 25.0 : 16.0;
                  final radius = isTouched ? 60.0 : 50.0;
                  switch (i) {
                    case 0:
                      return PieChartSectionData(
                        color: kBlue,
                        value: excellentPercentage,
                        title: '$ePercentage%',
                        radius: radius,
                        titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: kGrey),
                      );
                    case 1:
                      return PieChartSectionData(
                        color: kGreen,
                        value: goodPercentage,
                        title: '$gPercentage%',
                        radius: radius,
                        titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: kGrey),
                      );
                    case 2:
                      return PieChartSectionData(
                        color: kRed,
                        value: badPercentage,
                        title: '$bPercentage%',
                        radius: radius,
                        titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: kGrey),
                      );
                    default:
                      throw Error();
                  }
                }),
              ),
            );
          },
        );
      },
    );
  }
}
