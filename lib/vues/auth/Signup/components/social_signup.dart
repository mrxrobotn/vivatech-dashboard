import 'package:flutter/material.dart';
import 'package:vtdashboard/vues/auth/Signup/components/social_icon.dart';
import 'or_divider.dart';


class SocialSignUp extends StatelessWidget {
   const SocialSignUp({
     Key? key,
   }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Column(
      children: [
         const OrDivider(),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             SocalIcon(
               iconSrc: "assets/icons/Facebook.svg",
               press: () {},
             ),
             SocalIcon(
               iconSrc: "assets/icons/Twitter.svg",
               press: () {},
             ),
             SocalIcon(
               iconSrc: "assets/icons/google-plus.svg",
               press: () {},
             ),
           ],
         ),
       ],
     );
   }
}