import 'package:bitto/colors.dart';
import 'package:bitto/services/api_service.dart';
import 'package:bitto/widgets/search_footer.dart';
import 'package:bitto/widgets/search_header.dart';
import 'package:bitto/widgets/search_tabs.dart';
import 'package:flutter/material.dart';

import '../widgets/search_component.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  final String start;
  const SearchScreen({Key? key, required this.searchQuery, required this.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            // Web header
            const SearchHeader(),

            // Labs for news
             Padding(
              padding: EdgeInsets.only(left: size.width<768? 10:150),
              child: const SearchTabs(),
            ),
            const Divider(
              height: 0,
              thickness: 0.3,

            ),
            // Search results
            FutureBuilder(future: ApiService().fetchData(queryTerm: searchQuery, start: start),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:  EdgeInsets.only(left: size.width<768?10:150, top: 12),
                      child:  Text('About ${snapshot.data?['searchInformation']['totalResults']} results (${snapshot.data?['searchInformation']['formattedSearchTime']} seconds)', style: const TextStyle(color: Color(0xff70757A),
                      fontSize: 15),),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?['items']!=null?snapshot.data['items'].length:0,
                        shrinkWrap: true,
                        itemBuilder: (context, index){
                      return Padding(padding:  EdgeInsets.only(left: size.width<768?10:150, top: 15),
                      child: SearchResultComponent(
                        description: snapshot.data?['items'][index]['snippet'],
                        linkToGo: snapshot.data?['items'][index]['link'],
                        link: snapshot.data?['items'][index]['formattedUrl'],
                        text: snapshot.data?['items'][index]['title'],
                      ),
                      );
                    }),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){
                              if(start!="0"){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchScreen(searchQuery: searchQuery, start: (int.parse(start)-10).toString(),)));
                              }
                            }, child: const Text("< prev", style: TextStyle(color: blueColor),)),
                            TextButton(onPressed: (){
                              if(snapshot.data?['items']!=null && snapshot.data['items'].length==10){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SearchScreen(searchQuery: searchQuery, start: (int.parse(start)+10).toString(),)));
                              }

                            }, child: const Text(" next >", style: TextStyle(color: blueColor),)),
                          ],
                        )
                    ),
                    const SizedBox(height: 30,),
                    const SearchFooter(),
                  ],

                );
              }
              return const Center(child: CircularProgressIndicator(),);
            },
            ),
            // Pagination buttons

          ],
          ),
        ),
      ),
    );
  }
}