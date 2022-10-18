import 'package:bitto/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class SearchResultComponent extends StatefulWidget {
  final String link;
  final String text;
final String linkToGo;
final String description;
  const SearchResultComponent({Key? key, required this.link,  required this.text, required this.linkToGo, required this.description}) : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
  bool _showUnderline = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.link,
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: ()async{
                  if(await canLaunchUrl(Uri.parse(widget.linkToGo))){
                    await launchUrl(Uri.parse(widget.linkToGo));
                  }
                },
                onHover: (hovering) {
                  setState(() {
                    _showUnderline = hovering;
                  });
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.link,
                        style: const TextStyle(
                            color: Color(0xff202124), fontSize: 14,
                            ),
                      ),
                      Text(
                        widget.text,
                        style: TextStyle(
                            color: blueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            decoration: _showUnderline ? TextDecoration.underline : TextDecoration.none),
                      ),
                    ]))),
        Text(widget.description, style: const TextStyle(
            color: primaryColor,
            fontSize: 14,

        ),),
        const SizedBox(height: 20,),
      ],
    );
  }
}
