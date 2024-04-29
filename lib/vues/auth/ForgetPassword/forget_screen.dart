import 'package:flutter/material.dart';
import 'package:vtdashboard/vues/auth/ForgetPassword/components/forget_form.dart';

import '../background.dart';
import '../../../responsive.dart';
import 'components/forget_screen_top_image.dart';


class ForgetScreen extends StatelessWidget {
  const ForgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileForgetScreen(),
          desktop: Row(
            children: [
              const Expanded(
                child: ForgetScreenTopImage(),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 450,
                      child: ForgetForm(),
                    ),
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

class MobileForgetScreen extends StatelessWidget {
  const MobileForgetScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const ForgetScreenTopImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 8,
              child: ForgetForm(),
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
