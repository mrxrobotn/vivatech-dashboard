import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vtdashboard/vues/dashboard/components/custom_loader.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class AnalyticCards extends StatelessWidget {
  const AnalyticCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Responsive(
      mobile: AnalyticInfoCardGridView(
        crossAxisCount: size.width < 650 ? 2 : 4,
        childAspectRatio: size.width < 650 ? 2 : 1.5,
      ),
      tablet: const AnalyticInfoCardGridView(),
      desktop: AnalyticInfoCardGridView(
        childAspectRatio: size.width < 1400 ? 1.5 : 2.1,
      ),
    );
  }
}

class AnalyticInfoCardGridView extends StatelessWidget {
  const AnalyticInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('results').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int qrcodeCount = 0;
          int formCount = 0;

          List<DocumentSnapshot> documents = snapshot.data!.docs;

          documents.forEach((doc) {

            bool qrcode = doc['qrcode'];
            bool form = doc['form'];

            if (qrcode == true) {
              qrcodeCount++;
            }

            if (form == true) {
              formCount++;
            }
          });

          return Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding,
                    vertical: kDefaultPadding * 2 ,
                  ),
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$qrcodeCount",
                            style: const TextStyle(
                              color: kGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(kDefaultPadding / 2),
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: kDarkPurple,
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              "assets/icons/QrCode.svg",
                              color: kWhite,
                            ),
                          )
                        ],
                      ),
                      const Text(
                        "Codes scannés",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kGrey,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                )
              ),
              const SizedBox(width: kDefaultPadding),
              Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding * 2 ,
                    ),
                    decoration: BoxDecoration(
                        color: kWhite, borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$formCount",
                              style: const TextStyle(
                                color: kGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(kDefaultPadding / 2),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: kGreen,
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "assets/icons/Form.svg",
                                color: kWhite,
                              ),
                            )
                          ],
                        ),
                        const Text(
                          "Formulaires remplis",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: kGrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          );
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CustomLoader();
        }
      },
    );
  }
}
