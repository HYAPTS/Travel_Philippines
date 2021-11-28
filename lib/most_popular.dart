import 'package:flutter/material.dart';
import 'package:travel_blog/detail.dart';
import 'package:travel_blog/travel.dart';


// ignore: use_key_in_widget_constructors
class MostPopular extends StatelessWidget {
  final _list= Travel.generateMostPopular();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    // ignore: prefer_const_constructors
    padding: EdgeInsets.only(left: 15, right: 15,bottom: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        var travel =_list[index];
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return detailpage(travel: travel);   
            }));
          },
          child: Stack(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(travel.url,
              height:110,
              width: 180,
              fit: BoxFit.cover
              )
              ),
              Positioned(bottom: 10,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: 
              [
                Material(color: Colors.transparent,
                child: Text(travel.location,
                // ignore: prefer_const_constructors
                style: TextStyle( color: Colors.black,
                fontSize: 19.0,
                height:1.0,
              
                ))),
                 Material(color: Colors.transparent,
                child: Text(travel.name,
                // ignore: prefer_const_constructors
                style: TextStyle( color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.1,
                letterSpacing: 1.0,
                
               )))
              ],
              ),
            )
          ],
          ),
        );
      },
       // ignore: prefer_const_constructors
       separatorBuilder: (_,index)=>SizedBox(width: 15,),
        itemCount: _list.length);
  }
}