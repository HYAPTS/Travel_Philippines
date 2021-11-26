// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:travel_blog/widgets/travel_blog.dart';
import 'package:travel_blog/widgets/most_popular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        actions:[
          
          Padding(
            padding: const EdgeInsets.all(20),
            
            child: Icon(
              Icons.menu,
              size: 36.9,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      
        children: [Padding(
          padding: const EdgeInsets.all(15),      
          child: Text('Tourist Spots in the Philippines',        
          style:TextStyle(fontSize: 36),
          ),
        ),
        Expanded(
          flex: 2,
          child: travelblog()),
         Padding(
           padding: const EdgeInsets.all(20),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             // ignore: prefer_const_literals_to_create_immutables
             children: [
             Text('Most Popular',
            
             style: TextStyle(fontSize: 20),
             ),
             Text('View All',
            
             style: TextStyle(fontSize: 16,color: Colors.redAccent[400]),
             )
           ],
          ),
        ),
           Expanded(flex: 1, child: MostPopular()),
        ],
      ),
    );
  }
}
