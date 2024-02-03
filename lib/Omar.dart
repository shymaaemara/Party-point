import 'package:flutter/material.dart';


import 'Hagz.dart';

class Omar extends StatefulWidget {
  const Omar({super.key});

  @override
  State<Omar> createState() => _OmarState();
}

class _OmarState extends State<Omar> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:
    Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent),
      body:Container(child:
      Column(children: [
        Container(height: 20,),
        Container(
          padding: EdgeInsets.all(20),
          child:  Text("سابقه اعمال منسق الحفلات",style: TextStyle(fontSize: 20,color: Colors.black)),),
        Container(
            padding: EdgeInsets.all(20),
            child: Center(child: MaterialButton(
              shape: RoundedRectangleBorder(

              ),
              color: Colors.greenAccent,
              onPressed: ()async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                  return Hagz();
                }));

              }
              ,child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("حجز مع المنسق",style: TextStyle(fontSize: 20,color: Colors.white),),
                Icon(Icons.arrow_forward_ios,color: Colors.white,)
              ],
            ),),)),
        Expanded(
          flex: 3,
          child: ListView(children: [
            InkWell(
              onTap: (){},
              child: Card(

                child: Column(children: [
                  Image.asset("images/OIP (11).jpg",height: 250,fit: BoxFit.fill,),
                  Text(" حفله زفاف ",style: TextStyle(fontSize: 20)),
                  Text("في قاعه الاشاره",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey))
                ],),),
            ),
            InkWell(
              onTap: (){},
              child: Card(
                child: Column(children: [
                  Image.asset("images/1689161889_1.jpg",height: 350,fit: BoxFit.fill,),
                  Text(" اعياد ميلاد"
                      "  ",style: TextStyle(fontSize: 20)),

                ],),),
            ),


          ],),
        )
      ],)


        ,),
    ));
  }
}

