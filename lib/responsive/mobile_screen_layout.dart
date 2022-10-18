
import 'package:bitto/colors.dart';
import 'package:bitto/widgets/mobile/mobile_footer.dart';
import 'package:bitto/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.menu, color: Colors.grey,), onPressed: (){},),
      title: SizedBox(
        width: size.width*0.34,
        child: const DefaultTabController(length: 2, child: TabBar(
          labelColor: blueColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: blueColor,

          tabs: [
            Tab(child: Text("All"),),
            Tab(child: Text("Images"),),
          ],
        )),
      ),
        actions: [
       
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
                children: const [
                  Search(),
                  SizedBox(height: 20,),

                ]
            )),
            const MobileFooter(),
          ],
        ),
      ),
    );
  }
}
