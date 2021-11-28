class Travel{
 String name; 
 String location;
 String url;

 Travel(this.name,this.location,this.url);
 static List<Travel> generateTravelBlog(){
   //location-nameofplace
   return [
     Travel('Albay','Mayon Volcano','assets/images/t2.jpg'),
     Travel('Bohol','Chocolate Hills','assets/images/t3.jpg'),
     Travel('Puerto Princesa','Underground River','assets/images/t4.jpg'),
     Travel('Caramoan Islands','Island Hopping','assets/images/t5.jpg'),
     Travel('Banaue','Batad Rice Terraces','assets/images/t6.jpg'),
     Travel('Sevilla','Hanging Bridge','assets/images/t7.jpg'),
   ];
 } 
 static List<Travel> generateMostPopular(){
   return [
     Travel('Island in Malay, Aklan','Boracay','assets/images/b1.jpg'),
     Travel('Intramuros, Manila','San Agustin Church','assets/images/b2.jpg'),
     Travel('Corregidor Island',' Historic Tour of ','assets/images/b4.jpg'),
     Travel('Laguna','Pagsanjan Falls','assets/images/b5.jpg'),
     Travel('Coron','Coral Garden','assets/images/b6.jpg'),
     Travel('Talisay','Taal Volcano','assets/images/b7.jpg'),
     Travel(' Subic Bay','Jungle Training','assets/images/b8.jpg'),
   ];
 } 
}