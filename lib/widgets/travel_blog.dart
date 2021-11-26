// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:travel_blog/detail.dart';
import 'package:travel_blog/model/travel.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class travelblog extends StatelessWidget {
  final _list=Travel.generateTravelBlog();
  final _pageCtrl=PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageCtrl,
      itemCount: _list.length,
      itemBuilder: (context,index) {
      var travel=_list[index];
      
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return detailpage(travel: travel);
          }));
        },
        child: Stack(
          children: [
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 30),
              child: ClipRRect(
               borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                travel.url,
                height: 370,
                width: 400,
                fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
            bottom: 80,
            left: 15, 
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Material(
                  color: Colors.transparent,
                  child: Text(travel.location,
                  textAlign: TextAlign.left,
                   
                  style: 
                          // ignore: prefer_const_constructors
                          TextStyle(color: Colors.black,
                           fontSize:30,
                           height:1.0,
                           letterSpacing:1.0,
                           backgroundColor:Colors.redAccent[400]))),
                 Material(
                  color: Colors.transparent,
                  child: Text(travel.name,
                  style: 
                          // ignore: prefer_const_constructors
                          TextStyle(color: 
                            Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                           backgroundColor:Colors.limeAccent[400]
                            ))),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 30,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              // ignore: prefer_const_constructors
              child: Icon(Icons.favorite_rounded,
              color: Colors.limeAccent[400],
              size: 4,
              ),
            ),
          )
          ], 
        ),
      );
    }); 
 }
}