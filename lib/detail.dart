// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:travel_blog/travel.dart';

class detailpage extends StatelessWidget {
  final Travel travel;
  final double expadedHeight=300;
  detailpage({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children:[
          CustomScrollView(
            slivers: [
              _buildSilverHead()
            ],
          )
        ],));
  }
   Widget _buildSilverHead(){
     return SliverPersistentHeader(delegate: 
     DetailSLiverDelegate(
      travel: travel,
      expadedHeight: expadedHeight
     ));
   }
}
class DetailSLiverDelegate extends SliverPersistentHeaderDelegate{
  final Travel travel;
  final double expadedHeight;
    DetailSLiverDelegate({
      required this.travel,
      required this.expadedHeight
    });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
         Opacity(opacity: 0.8,
       child: Image.asset(travel.url,
       width: MediaQuery.of(context).size.width,
       height:expadedHeight,
       fit: BoxFit.cover),)
      ],);
     
      
    
  }

  @override

  double get maxExtent => expadedHeight;

  @override
  
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
   return true;
  }

}