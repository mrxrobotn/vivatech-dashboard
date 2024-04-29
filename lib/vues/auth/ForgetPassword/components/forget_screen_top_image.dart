import 'package:flutter/material.dart';
import '../../../../constants.dart';


class ForgetScreenTopImage extends StatelessWidget {
  const ForgetScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(
          "Changer votre mot de passe".toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: Image.asset("assets/images/logo-dclic-oif.jpg"),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: kDefaultPadding * 2),
      ],
    );
  }
}