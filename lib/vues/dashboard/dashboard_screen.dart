import 'package:flutter/material.dart';
import 'package:vtdashboard/constants.dart';
import '../../responsive.dart';
import 'components/analytic_cards.dart';
import 'components/country_table.dart';
import 'components/custom_appbar.dart';
import 'components/data_results.dart';
import 'components/drawer_menu.dart';
import 'components/questions.dart';
import 'components/rating.dart';
import 'components/users_list.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      drawer: const DrawerMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) const Expanded(child: DrawerMenu(),),
            Expanded(
              flex: 5,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      const CustomAppbar(),
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    const AnalyticCards(),
                                    const SizedBox(
                                      height: kDefaultPadding,
                                    ),
                                    const DataResults(),
                                    if (Responsive.isMobile(context))
                                      const SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                    if (Responsive.isMobile(context)) const UsersList(),
                                  ],
                                ),
                              ),
                              if (!Responsive.isMobile(context))
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
                              if (!Responsive.isMobile(context))
                                const Expanded(
                                  flex: 2,
                                  child: UsersList(),
                                ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: kDefaultPadding,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if(!Responsive.isMobile(context))
                                          const Expanded(
                                            flex: 2,
                                            child: CountryTable(),
                                          ),
                                        if(!Responsive.isMobile(context))
                                          const SizedBox(width: kDefaultPadding,),
                                        const Expanded(
                                          flex: 3,
                                          child: Questions(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: kDefaultPadding,
                                    ),
                                    if (Responsive.isMobile(context))
                                      const SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                    if (Responsive.isMobile(context)) const CountryTable(),
                                    if (Responsive.isMobile(context))
                                      const SizedBox(
                                        height: kDefaultPadding,
                                      ),
                                    if (Responsive.isMobile(context)) const AppRating(),
                                  ],
                                ),
                              ),
                              if (!Responsive.isMobile(context))
                                const SizedBox(
                                  width: kDefaultPadding,
                                ),
                              if (!Responsive.isMobile(context))
                                const Expanded(
                                  flex: 2,
                                  child: AppRating(),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}