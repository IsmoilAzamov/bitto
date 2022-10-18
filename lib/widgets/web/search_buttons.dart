import 'package:bitto/widgets/web/search_button.dart';
import 'package:flutter/material.dart';


class SearchButtons extends StatelessWidget {
  const SearchButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SearchButton(title: "All"),
            SizedBox(width: 10),
            SearchButton(title: "Images"),
            SizedBox(width: 10),
            SearchButton(title: "News"),
            SizedBox(width: 10),
            SearchButton(title: "Videos"),
          ],

        )
      ],
    );
  }
}
