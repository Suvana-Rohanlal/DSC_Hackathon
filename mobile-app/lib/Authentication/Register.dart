import 'package:flutter/material.dart';
import 'package:xhasasmall/Authentication/SignIn.dart';
import 'package:xhasasmall/Shared/Constants.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final customerNameController = TextEditingController(); // where we will get user input
  final customerPasswordController = TextEditingController();
  final customerEmailContactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
//      appBar: AppBar(
//        title:Text("Register"),
//        centerTitle: true,
//        backgroundColor: Colors.deepPurpleAccent[200],
//
//      ),
      body:Container(
        //color:Colors.transparent,
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
                  "Register",
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: 1.5,
                ),
              )
            ),
            SizedBox(
              height:20
            ),
            Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
              child: TextFormField(
                controller: customerNameController,
                decoration: textInputDecoration.copyWith(hintText: "Name"),
              ),
            ),),
            Expanded(
            child: Padding(
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
               child: TextFormField(
                 controller: customerPasswordController,
                 decoration: textInputDecoration.copyWith(hintText: "Password"),
               ),
             ),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                child: TextFormField(
                  controller: customerEmailContactController,
                  decoration: textInputDecoration.copyWith(hintText: "Email"),
                ),
              ),
            ),
            SizedBox(
              height:60
            ),
            Container(
              height:50,
              width:150,
              child: FlatButton(
                onPressed: (){
                  setState(() {
                    //Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn())
                    );
                  });
                },
                child: Text("Register"),
                color:Colors.deepPurpleAccent,
              ),
            )

          ],
        ),
      )
    );
  }
}
