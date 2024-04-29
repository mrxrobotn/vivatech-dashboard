import 'package:flutter/material.dart';
import 'package:vtdashboard/vues/dashboard/components/rating_data_chart.dart';
import '../../../constants.dart';


class AppRating extends StatelessWidget {
  const AppRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Container(
        height: 350,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Evaluation:',
              style: TextStyle(
                color: kGrey,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              height: 230,
              child: RatingDataChart()
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: kBlue,
                        size: 10,
                      ),
                      const SizedBox(width: kDefaultPadding /2,),
                      Text('Excellent',style: TextStyle(
                        color: kGrey.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(width: kDefaultPadding * 2 ,),
                      const Icon(
                        Icons.circle,
                        color: kGreen,
                        size: 10,
                      ),
                      const SizedBox(width: kDefaultPadding /2,),
                      Text('Bon',style: TextStyle(
                        color: kGrey.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(width: kDefaultPadding * 2 ,),
                      const Icon(
                        Icons.circle,
                        color: kRed,
                        size: 10,
                      ),
                      const SizedBox(width: kDefaultPadding /2,),
                      Text('Mauvais',style: TextStyle(
                        color: kGrey.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
