
import 'package:bitto/colors.dart';
import 'package:bitto/widgets/search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: [
          TextButton(onPressed: (){}, child: const Text("Gmail",
          style: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.w400,))),
          TextButton(onPressed: (){}, child: const Text("Images",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,))),
          const SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/more_apps.svg', color: primaryColor,) ),
          const SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, ).copyWith(right: 10),
            child: MaterialButton(onPressed: (){},
            color:   const Color(0xff1A73EB),
              child: const Text("Sign In",
                style: TextStyle(
                  fontWeight: FontWeight.w400,)),),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.25,
            ),
            Expanded(child: Column(
             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Search(),
                SizedBox(height: 20,),
                SizedBox(
                  width: size.width*0.5,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search Google or type a URL",

                      hintStyle: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: const Icon(Icons.search, color: primaryColor),
                      suffixIcon: Padding(padding: const EdgeInsets.all(6),child: SvgPicture.asset('assets/mic-icon.svg',),),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,

                      ),
                    ),
                  ),
                )
              ]
            ))
          ],
        ),
      ),
    );
  }
}
