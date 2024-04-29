import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vtdashboard/functions.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/icons/Bell.svg",
                height: 25,
                color: kGrey.withOpacity(0.8),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kRed,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: kDefaultPadding),
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: kDefaultPadding / 2,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/images/profile.png',
                  height: 38,
                  width: 38,
                  fit: BoxFit.cover,
                ),
              ),
              if(!Responsive.isMobile(context))
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  children: [
                    const Text('Bienvenue, ',
                      style: TextStyle(
                      color: kGrey,
                      fontWeight: FontWeight.w800,
                      )
                    ),
                    Text( getUsername.toString(),
                      style: const TextStyle(color: kGrey, fontWeight: FontWeight.w800)
                    ),
                  ],
                )
              )
            ],
          ),
        )
      ],
    );
  }
}
