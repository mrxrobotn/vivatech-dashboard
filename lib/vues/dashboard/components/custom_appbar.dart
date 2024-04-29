import 'package:flutter/material.dart';
import 'package:vtdashboard/vues/dashboard/components/profile_info.dart';
import 'package:vtdashboard/vues/dashboard/components/search_field.dart';


class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SearchField()
        ),
        ProfileInfo()
      ],
    );
  }
}
