import 'package:bitto/colors.dart';
import 'package:flutter/material.dart';


class SearchButton extends StatelessWidget {
  final String title;
  const SearchButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:(){},
    elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      color: searchColor,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
    child: Text(title),
    );
  }
}
