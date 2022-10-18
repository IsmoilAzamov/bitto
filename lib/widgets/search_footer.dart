import 'package:bitto/colors.dart';
import 'package:flutter/material.dart';


class SearchFooter extends StatelessWidget {
  const SearchFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(horizontal:150, vertical: 15),
        child:Row(
          children:[
            Text('Uzbekistan', style: TextStyle(color: Colors.grey[700], fontSize: 15),),
       const SizedBox(width: 10,),
            Container(
              height: 20,
              width: 0.5,
              color: Colors.grey[700],
            ),
            const SizedBox(width: 10,),
            const Icon(Icons.circle, color: Color(0xff70757A)),
            const SizedBox(width: 10,),
            const Text("100101, Tashkent, Uzbekistan", style: TextStyle(color:primaryColor, fontSize: 14),),

          ]
        ),
        ),
        const Divider(thickness: 0, height: 9, color: Colors.black26),
        Container(
          color: footerColor,
          padding: const EdgeInsets.symmetric(horizontal:150, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Help", style: TextStyle(color: Colors.grey, fontSize: 14),),
              Text("Business", style: TextStyle(color: Colors.grey, fontSize: 14),),
              Text("About", style: TextStyle(color: Colors.grey, fontSize: 14),),
              Text("How Search works", style: TextStyle(color: Colors.grey, fontSize: 14),),
            ],
          ),
        ),
      ],
    );
  }
}
