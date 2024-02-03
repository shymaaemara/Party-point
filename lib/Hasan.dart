import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Hagz.dart';


class Hasan extends StatefulWidget {
  const Hasan({super.key});

  @override
  State<Hasan> createState() => _HasanState();
}

class _HasanState extends State<Hasan> {
  List data=[];
  getdhasan()async{
      QuerySnapshot querySnapshot                 = await   FirebaseFirestore.instance.collection("hasan").get();
      data.addAll(querySnapshot.docs);
      setState(() {

      });
  }
  @override
  void initState() {
    getdhasan();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:
    Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent),
      body:

      Container(child:
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
                  Image.asset("images/OIP (8).jpg",height: 200,fit: BoxFit.fill,),
                  Text(" حفله زفاف ",style: TextStyle(fontSize: 20)),
                  Text("في قاعه الماسه",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey))
                ],),),
            ),
            InkWell(
              onTap: (){},
              child: Card(
                shape: RoundedRectangleBorder(),
                child: Column(children: [
                  Image.asset("images/OIP (10).jpg",height: 300,fit: BoxFit.fill,),
                  Text(" حفله سبوع"
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
