import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Rechercher",
        helperStyle: TextStyle(
          color: kGrey.withOpacity(0.5),
          fontSize: 15,
        ),
        fillColor: kWhite,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10)
        ),
        prefixIcon: Icon(
          Icons.search,
          color: kGrey.withOpacity(0.5)
        )
      ),
    );
  }
}
