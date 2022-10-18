import 'package:bitto/widgets/language_text.dart';
import 'package:flutter/material.dart';

class TranslationButtons extends StatelessWidget {
  const TranslationButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: const [
        Text("Google Offered in:"),
        SizedBox(width: 5,),
        LanguageText(title: 'Eng'),
        SizedBox(width: 5,),
        LanguageText(title: 'Ru'),
        SizedBox(width: 5,),
        LanguageText(title: 'Uzb'),
        SizedBox(width: 5,),
        LanguageText(title: 'Kg'),
        SizedBox(width: 5,),
        LanguageText(title: 'Tjk')
      ],
    );
  }
}
