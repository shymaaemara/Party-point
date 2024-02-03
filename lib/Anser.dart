import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Adecor.dart';
import 'package:untitled5/Hagz.dart';
import 'package:untitled5/Homepage.dart';
import 'package:untitled5/Showdecor.dart';
class Anser extends StatefulWidget {
  const Anser({super.key});

  @override
  State<Anser> createState() => _AnserState();
}

class _AnserState extends State<Anser> {
  @override
  Widget build(BuildContext context) {
    return
      Directionality(textDirection: TextDirection.rtl, child:
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.greenAccent,
          ),
          body: Center(
            child: Column(
              children: [
                Container(height: 50,),

                Container(height: 100,),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 250,
                  color: Colors.pinkAccent,
                  child:




                       Column(
                         children: [
                           Text("لتاكيد الحجز  ",style: TextStyle(fontSize: 30),),
                           Text("اضغط",style: TextStyle(fontSize: 20),),
                           Container(height: 10,),
                           MaterialButton(
                             padding: EdgeInsets.all(10),
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(20)
                             ),
                             color: Colors.greenAccent,
                             onPressed: (){

                               AwesomeDialog(
                                 context: context,
                                 dialogType: DialogType.success,
                                 headerAnimationLoop: false,
                                 animType: AnimType.bottomSlide,

                                 desc: 'لقد نم الحجز بنجاح',
                                 buttonsTextStyle: const TextStyle(color: Colors.black),
                                 showCloseIcon: true,
                                 btnCancelOnPress: () {

                                 },
                                 btnOkOnPress: () {
                                   Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                     return  Hagz();
                                   }));
                                   ;
                                 },
                               ).show();


                             },child: Text("تاكيد"),)
                         ],
                       ),

                    ),


              ],
            ),),


          )
      ) ;
  }
}
