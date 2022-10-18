 import 'package:bitto/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(padding: const EdgeInsets.only(top: 25),
    child: Row(
      children:  [
        Padding(padding: const EdgeInsets.only(left: 28, right: 15, top:4),
        child: Image.asset('assets/google-logo.png', height: 30, width: 92,),),
        const SizedBox(width: 27,),
        SizedBox(
          width: size.width>768? size.width*0.5: size.width*0.6,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search Google or type a URL",
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Padding(padding: const EdgeInsets.all(6),child: SvgPicture.asset('assets/mic-icon.svg',),),
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Icon(Icons.search, color: blueColor,),
                  )
                ],
              ),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none,

              ),
            ),
          ),
        ),

      ],
    ),
    );
  }
}
