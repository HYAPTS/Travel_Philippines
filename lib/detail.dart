// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:travel_blog/travel.dart';

class detailpage extends StatelessWidget {
  final Travel travel;
  final double expadedHeight=300;
  final double roundedContainerHeight = 50;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  detailpage({required this.travel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children:[
          CustomScrollView(
            slivers: [
              _buildSilverHead(),
            SliverToBoxAdapter(
              child: _buildDetail(),
            )],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              right: 17,left: 17
            ),
            child: SizedBox(height: kToolbarHeight,
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                //wrap icon to widget
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
              child: Icon(Icons.arrow_back,color: Colors.black,size:30,)),
              Icon(Icons.menu,color: Colors.black,size:36,),
            ],),),
          ) 
        ],));
  }
   Widget _buildSilverHead(){
     return SliverPersistentHeader(delegate: 
     DetailSLiverDelegate(
      travel: travel,
      expadedHeight: expadedHeight,
      roundedContainerHeight: roundedContainerHeight
     ));
   }
   Widget _buildDetail(){
     return Container(
       color: Colors.grey[400],
       child: Column(children: [
         _buildUserInfo(),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
           child: Text('The Philippines is a tropical paradise in the Pacific Ocean made up of more than 7,000 islands that offer a natural playground for your inner explorer. Collectively, its landscapes feature an array of natural wonders, from volcanoes and rice terraces to underwater rivers and limestone caves, along with beautiful beaches.',
           style: TextStyle(color: Colors.black.withOpacity(1.0),
           fontSize:16,height: 1.5,fontWeight: FontWeight.w400),
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20),

           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Featured',
               style: TextStyle(
                 fontWeight: FontWeight.w700,
                 fontSize: 20,
                 letterSpacing: 1.5
              ),),
             
             ],
           ),
         ),
         //https://api.flutter.dev/flutter/painting/TextStyle-class.html
          SizedBox(height: 180,child: FeaturedWidget()),
           Padding(
           padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
           
           child: Text('Individually, the islands each offer something unique, whether you are looking for the best place to dive and snorkel or prefer to take in the historical sights in cities like Manila or Vigan, which have deep colonial roots.',
           style: TextStyle(color: Colors.black.withOpacity(1.0),
           fontSize:17,height: 1.5,fontWeight: FontWeight.w400
           ),
           ),
         ),
          Padding(
           padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
           child: Text('Since the country is so spread out, a trip to the Philippines requires careful planning so that you can connect with the proper guides and find the most convenient lodging as a base for your favorite activities. Some destinations, like the Chocolate Hills in Bohol or the Hanging Coffins in Sagada, are remote, but getting there is well worth the effort.',
           style: TextStyle(color: Colors.black.withOpacity(1.0),
           fontSize:17,height: 1.5,fontWeight: FontWeight.w400),
           ),
         ),
          Padding(
           padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
           child: Text('Plan your travels with our list of the top tourist attractions and things to do in the Philippines.',
           style: TextStyle(color: Colors.black,
           fontWeight: FontWeight.w400,
           fontSize:17,),
           ),
         ),
        ],
       ),
     );
   }
   Widget _buildUserInfo(){
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
       child: Row(
         children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(50),
           child: Image.asset(
             travel.url,
             width: 50,
             height: 50,
             fit: BoxFit.cover,),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             Text(travel.name,
             style: TextStyle(
               fontSize: 20,
               color: Colors.black,
               fontWeight: FontWeight.bold
             ),),
            Text(travel.location,
             style: TextStyle(
               fontSize: 16,
             ),
             ),
           ],
           ),
         ),
         Spacer(),
         Icon(Icons.share,
         color: Colors.black,)
       ],),
     );
   }
}
class DetailSLiverDelegate extends SliverPersistentHeaderDelegate{
  final Travel travel;
  final double expadedHeight;
  final double roundedContainerHeight;

    DetailSLiverDelegate({
      required this.travel,
      required this.expadedHeight,
      required this.roundedContainerHeight
    });
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
         Opacity(opacity: 0.8,
       child: Image.asset(travel.url,
       width: MediaQuery.of(context).size.width,
       height:expadedHeight,
       fit: BoxFit.cover),
       ),
       Positioned(
         left: 0,
         top: expadedHeight - roundedContainerHeight-shrinkOffset,

         child: Container(
           width: MediaQuery.of(context).size.width,
           height: roundedContainerHeight,
           decoration: BoxDecoration(
             color: Colors.grey[400],
             borderRadius: BorderRadius.only(
               topLeft:Radius.circular(30),
               topRight:Radius.circular(30)
            )
           ),
         ),
       ),
       //detail picture
      Positioned(
        top: expadedHeight -shrinkOffset-120,
        left: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(travel.name,
          style:TextStyle(color: Colors.black,fontWeight: FontWeight.w700,backgroundColor: Colors.yellowAccent,fontSize: 20)),
          Text(travel.location,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700,backgroundColor: Colors.amber[900]),)
        ],))
      ],
    );
     
      
    
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
// ignore: use_key_in_widget_constructors
class FeaturedWidget extends StatelessWidget {
  final _list = Travel.generateMostPopular();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index ){
        var travel= _list[index];
        return Container(
        width: 130,
        child: Image.asset(
        travel.url,
        fit: BoxFit.cover));
      },
      separatorBuilder: (_,index)=>SizedBox(width: 10,),
       itemCount: _list.length);
  }

}