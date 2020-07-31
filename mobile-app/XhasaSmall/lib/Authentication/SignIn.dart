import 'package:XhasaSmall/Shared/Constants.dart';
import 'package:XhasaSmall/screens/wrapper.dart';
import 'package:XhasaSmall/services/api.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final customerPasswordController = TextEditingController();
  final customerEmailContactController = TextEditingController();
  String signInFalse = "";//to represent whether sign in was succesfull or not
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
                      "assets/images/background.jpg"
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
                    image:AssetImage("assets/images/logo.png"),
                    fit:BoxFit.fill,

                  ),
                ),
              ),
              SizedBox(
                  height:15
              ),
              Text(
                  signInFalse,
                  style:TextStyle(
                    color: Colors.red,
                  )),
              SizedBox(
                height:15
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
                         decoration: textInputDecoration.copyWith(hintText: "Email"),
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

                  child: Text(
                      "Sign In"
                  ),
                  color:Colors.deepPurpleAccent,
                  onPressed: ()async{
                    if(customerEmailContactController.value.text ==""||customerPasswordController.value.text =="") {
                      setState(() {
                        signInFalse = "Please don't leave any fields empty";
                      });
                    }
                    else{
                      bool loginSuccesful = await login(customerEmailContactController.value.text, customerPasswordController.value.text);
                      if(loginSuccesful == true){
                        setState(() {
                          Navigator.pop(context);// so it doesn't return to sign in
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RootPage())
                          );
                        });

                      }
                      else{
                        setState(() {
                        signInFalse = "Incorrect details supplied! try again";
                        });
                        }
                    }



                  },
                ),
              )

            ],
          ),
        )
    );
  }
}
