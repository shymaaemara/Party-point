import 'package:flutter/material.dart ';

import 'Login.dart';
import 'Login2.dart';
import 'Loginpos.dart';
class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(appBar: AppBar(


      ),

        body: Container(
          padding: EdgeInsets.all(30),
          child: ListView(children: [
            Image.asset("images/OIP (12).jpg",height: 200,),
            Container(height: 10,),
            Center(child: Text("اهلا بيك في تطبيق",style: TextStyle(fontSize: 20),)),
            Center(child: Text("بارتي بوينت",style: TextStyle(fontSize: 30),)),

            Container(height: 20,),
            InkWell(
              onTap: (){
                Navigator.of(context).push
                  (MaterialPageRoute(builder: (context){
                  return Login();
                }));
              },
              child:
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.pinkAccent,
                  ),
                  padding: EdgeInsets.all(10),

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: Colors.white,), SizedBox(width: 25,),Text("المستخدم",style: TextStyle(fontSize: 20,color:Colors.white),)],)),),
            Container(height: 10,),
            InkWell(
              onTap: (){
                Navigator.of(context).push
                  (MaterialPageRoute(builder: (context){
                  return Login2();
                }));
              },
              child:
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent,
                  ),
                  padding: EdgeInsets.all(10),

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: Colors.white),SizedBox(width: 10,),Text("منسقي الحفلات ",style: TextStyle(fontSize: 20,color:Colors.white),)],)),),
            Container(height: 10,),
            InkWell(
              onTap: (){

                Navigator.of(context).push
                  (MaterialPageRoute(builder: (context){
                  return Loginpos();
                }));
              },
              child:
              Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.greenAccent,
                  ),
                  padding: EdgeInsets.all(10),

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,color: Colors.white),SizedBox(width: 10,) ,Text("مدير النظام",style: TextStyle(fontSize: 20,color: Colors.white),)],)),),
          ],),
        ),));
  }
}
