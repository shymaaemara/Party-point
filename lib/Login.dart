import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Homepage.dart';
import 'Sighin.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var password,email;
  GlobalKey<FormState> formstate=new GlobalKey<FormState>();
  bool showpassword=false;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:

    Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: ListView(children: [Form(
autovalidateMode: AutovalidateMode.always,
                  key: formstate,
                  child:
                  Column(

                    children: [

                      Image.asset("images/OIP (12).jpg",height: 200,),
                      Container(height: 50,),
                      TextFormField(
                        onSaved: (val){
                          email=val;
                        }
                        ,
                        validator: (val){
                          if (val!.length<10){

                            return "not valid";
                          }},
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "الايميل ",
                            filled: true,
                            fillColor: Colors.grey[100],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),


                            )
                        ),
                      ),
                      Container(height: 20,),


                      TextFormField(
                          obscureText:!showpassword,
                          onSaved: (val){
                            password=val;
                          },
                          validator: (val){
                            if (val!.length<5){
                              return "not valid";
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon:
                              IconButton(
                                icon: Icon(
                                    showpassword?
                                    Icons.visibility:
                                    Icons.visibility_off
                                ), onPressed: () {
                                setState(() {
                                  showpassword=!showpassword;
                                });
                              },
                              ),
                              prefixIcon: Icon(Icons.lock)
                              ,
                              hintText: "كلمه المرور ",
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)))),

                    ],),),


                  Container(height: 50,),


                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.pinkAccent,
                      onPressed: ()async {


                        if(formstate.currentState!.validate()){

                          formstate.currentState?.save();
                          try {
                            final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: email,
                                password: password
                            );

                            Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                              return Homepage(username: "", phone: "", email: '',);
                            }));
                          } on FirebaseAuthException catch (e) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.bottomSlide,
                              title: 'تحزير',
                              desc: 'الايميل غير موجود',
                              buttonsTextStyle: const TextStyle(color: Colors.black),
                              showCloseIcon: true,
                              btnCancelOnPress: () {

                              },
                              btnOkOnPress: () {
                                Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                  return Login();
                                }));
                                ;
                              },
                            ).show();
                            if (e.code == 'user-not-found') {

                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {


                              print('Wrong password provided for that user.');
                            }
                          }


                        }
                        else{
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.bottomSlide,
                              title: 'تحزير',
                              desc: 'لايمكن ان يكون الايميل فارغ',
                              buttonsTextStyle: const TextStyle(color: Colors.black),
                              showCloseIcon: true,
                              btnCancelOnPress: () {

                              },
                              btnOkOnPress: () {
                                Navigator .of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                  return Login();
                                }));
                              }

                          ).show();
                        };

                      }
                      ,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تسجيل الدخول    ",style: TextStyle(fontSize: 20,color: Colors.white),),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,)
                    ],
                  )

                  ),
                  Container(height:20 ,),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      color: Colors.pinkAccent,
                      onPressed: ()async {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                          return Sighin();
                        }));

                      }
                      ,child: Text("قم بتسجيل حساب من هنا",style: TextStyle(fontSize: 20,color: Colors.white),)

                  ),
                ])))));






  }
}


