import 'package:bitto/colors.dart';
import 'package:bitto/widgets/footer_text.dart';
import 'package:flutter/material.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              FooterText(title: 'About'),
              SizedBox(width: 10),
              FooterText(title: 'Advertising'),
              SizedBox(width: 10),
              FooterText(title: 'Business'),
              SizedBox(width: 10),
              FooterText(title: 'How Search works'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              FooterText(title: 'Privacy'),
              SizedBox(width: 10),
              FooterText(title: 'Terms'),
              SizedBox(width: 10),
              FooterText(title: 'Settings'),
            ],
          ),
        ],
      ),

    );
  }
}
