import 'package:flutter/material.dart';

import 'Hasan.dart';

import 'Omar.dart';
import 'Sead.dart';
class Adddecor extends StatefulWidget {
  const Adddecor({super.key});

  @override
  State<Adddecor> createState() => _AdddecorState();
}

class _AdddecorState extends State<Adddecor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
      ),
      body:  ListView(children: [


        Card(child: Column(children: [  Image.asset("images/OIP (6).jpg",height: 80,),
          Text(" حسن محمد ",style: TextStyle(fontSize: 20)),
          Text("منسق حفلات",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[700]))],),),


        Container(height:20 ,),
        Center(child: InkWell(
            onTap: (){
              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return Hasan();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent,
              child: Text("اضافه"),))),
        Container(height:20 ,),
        Card(
          child: Column(children: [
            Image.asset("images/avatar.jpg",height: 80,),
            Text(" سيد محمد  ",style: TextStyle(fontSize: 20)),
            Text("  منسق حفلات تخرج",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[700]))
          ],),),
        Container(height:20 ,),
        Center(child: InkWell(
            onTap: (){
              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return Sead();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent,
              child: Text("اضافه"),))),
        Container(height:20 ,),
        Card(

          child: Column(children: [
            Image.asset("images/artworks-000187254853-pg3rfe-t500x500.jpg",height: 80,),
            Text(" عمرو جمال  ",style: TextStyle(fontSize: 20)),
            Text("  منسق حفلات واعياد ميلاد",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.lightBlue[700]))
          ],),),
        Container(height:20 ,),
        Center(child: InkWell(
            onTap: (){
              Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                return Omar();
              }));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.greenAccent,
              child: Text("ارسال"),))),
        Container(height:20 ,),

      ],),
    );
  }
}
