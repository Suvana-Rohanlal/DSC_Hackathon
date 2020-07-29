import 'package:flutter/material.dart';
import 'package:xhasasmall/Shared/Constants.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final customerPasswordController = TextEditingController();
  final customerEmailContactController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,

        body:Container(

          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "Picture/background.png"
                  ),

                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
//            SizedBox(
//              height:20
//            ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height:100,
                  width:200,
                  color:Colors.white,
                  child: Image(
                    image:AssetImage("Picture/xhasaSmallLogo.jpg"),
                    fit:BoxFit.fill,

                  ),
                ),
              ),
              SizedBox(
                  height:30
              ),
              Container(
                  child:Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.5,
                    ),
                  )
              ),
              SizedBox(
                  height:20
              ),
              Container(
               child:(
               Column(
                 children: [

                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 12),
                       child: TextFormField(
                         controller: customerEmailContactController,
                         decoration: textInputDecoration.copyWith(hintText: "Name"),
                       ),
                     ),


                        Padding(
                         padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 12),
                         child: TextFormField(
                           controller: customerPasswordController,
                           decoration: textInputDecoration.copyWith(hintText: "Password"),
                         ),
                       ),

                 ],
               )
               )
              ),
//              Expanded(
//                child:Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 12),
//                  child: TextFormField(
//                    controller: customerEmailContactController,
//                    decoration: textInputDecoration.copyWith(hintText: "Name"),
//                  ),
//                ),),
//              Expanded(
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 12),
//                  child: TextFormField(
//                    controller: customerPasswordController,
//                    decoration: textInputDecoration.copyWith(hintText: "Password"),
//                  ),
//                ),),

              SizedBox(
                  height:60
              ),
              Container(
                height:50,
                width:150,
                child: FlatButton(
                  onPressed: (){},
                  child: Text("Sign In"),
                  color:Colors.deepPurpleAccent,
                ),
              )

            ],
          ),
        )
    );
  }
}
