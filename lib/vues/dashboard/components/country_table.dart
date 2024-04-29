import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vtdashboard/vues/dashboard/components/country_table_details.dart';
import '../../../constants.dart';

class CountryTable extends StatelessWidget {
  const CountryTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tableau des pays: ',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: kGrey,
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: CountryNumberDetails(),
          )
        ],
      ),
    );
  }
}
