
import 'package:bitto/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,

    children: [
      Center(
        child: Image.asset('assets/google-logo.png', height: size.height*0.12,),
      ),
      SizedBox(height: 20,),
      SizedBox(
        width: size.width>1024? size.width*0.4: size.width>768?size.width*0.6: size.width*0.8,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search Google or type a URL",

            hintStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey,),
            suffixIcon: Padding(padding: const EdgeInsets.all(6),child: SvgPicture.asset('assets/mic-icon.svg',),),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,

            ),
          ),
        ),
      )
    ],
    );
  }
}
