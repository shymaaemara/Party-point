  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Anser.dart';
import 'package:untitled5/Homepage.dart';
import 'package:untitled5/shaqa.dart';
class Showdacor extends StatefulWidget {
  const Showdacor({super.key});

  @override
  State<Showdacor> createState() => _ShowdacorState();
}

class _ShowdacorState extends State<Showdacor> {
  bool isloading=true;
  List data=[];


                     getdecor()async{
                       QuerySnapshot querySnapshot= await    FirebaseFirestore.instance.collection("adecor").get();

                       data.addAll(querySnapshot.docs);

                       setState(() {

                       });

                     }
                     @override
  void initState() {
Future.delayed(Duration(seconds:5 )).then((value) =>
                       getdecor());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
      Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,),
      body: Container(child:ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,i){
        return Container(child: Center(child: Column(
          children: [
            Container(height: 20,),
            Container(child: Image.asset("images/OIP (12).jpg",height: 100,),),
            Container(height: 80,),
            Card(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [Text(" اسم القاعه المتاحه في هذا الموعد   ",style: TextStyle(fontSize: 20
                       ,color: Colors.grey)),],),
                  Text("${data[i]['namehall1']}",style: TextStyle(fontSize: 20
                      ,color: Colors.white)),
                   Row(

                       mainAxisAlignment: MainAxisAlignment.center,
                     children: [Text(" عدد الافراد    ",style: TextStyle(fontSize: 20
                       ,color: Colors.grey)),

                   ],),
                  Text("${data[i]['numberperson']}",style: TextStyle(fontSize: 20
                      ,color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("   لتاكيد الحجز   اضغط",style: TextStyle(fontSize: 25
                          ,color: Colors.grey),),

                    ],
                  ),
                  MaterialButton(

                      shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.pinkAccent,
                      onPressed: ()async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return Anser();
                        }));
                      }


                      ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("   تاكيد ",style: TextStyle(fontSize: 25
                          ,color: Colors.white),),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,)
                    ],
                  )

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("  لشكوي اضغط ",style: TextStyle(fontSize: 25
                          ,color: Colors.grey),),

                    ],
                  ),
                  MaterialButton(

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.orangeAccent,




                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                          return Shaqa();
                        }));
                      },
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("  ارسال ",style: TextStyle(fontSize: 25
                          ,color: Colors.white),),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,)
                    ],
                  )

                  ),
                ],
              ),
            ),


          ],
        ),),);
      }) ,),
    ));
  }
}
