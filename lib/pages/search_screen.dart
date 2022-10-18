import 'package:bitto/colors.dart';
import 'package:bitto/services/api_service.dart';
import 'package:bitto/widgets/search_footer.dart';
import 'package:bitto/widgets/search_header.dart';
import 'package:bitto/widgets/search_tabs.dart';
import 'package:flutter/material.dart';

import '../widgets/search_component.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          // Web header
          const SearchHeader(),

          // Labs for news
          const Padding(
            padding: EdgeInsets.only(left: 150.0),
            child: SearchTabs(),
          ),
          const Divider(
            height: 0,
            thickness: 0.3,

          ),
          // Search results
          FutureBuilder(future: ApiService().fetchData(queryTerm: "Ismoilxon",),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 12),
                    child:  Text('About ${snapshot.data?['searchInformation']['totalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)', style: const TextStyle(color: Color(0xff70757A),
                    fontSize: 15),),
                  ),
                  ListView.builder(
                      itemCount: snapshot.data?['items'].length,
                      itemBuilder: (context, index){
                    return Padding(padding: const EdgeInsets.only(left: 150, top: 10),
                    child: SearchResultComponent(
                      description: snapshot.data?['items'][index]['snippet'],
                      linkToGo: snapshot.data?['items'][index]['link'],
                      link: snapshot.data?['items'][index]['formattedUrl'],
                      text: snapshot.data?['items'][index]['title'],
                    ),
                    );
                  })
                ],

              );
            }
            return const Center(child: CircularProgressIndicator(),);
          },
          ),
          // Pagination buttons
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: (){}, child: const Text("< prev", style: TextStyle(color: blueColor),)),
              TextButton(onPressed: (){}, child: const Text(" next >", style: TextStyle(color: blueColor),)),
            ],
          )
        ),
          const SizedBox(height: 30,),
          const SearchFooter(),
        ],
        ),
      ),
    );
  }
}