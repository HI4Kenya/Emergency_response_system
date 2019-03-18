import 'package:flutter/material.dart';
import './sign_up.dart';
import './main.dart';
import'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';


void main() => runApp(FirstRoute());

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      routes: <String,WidgetBuilder>{
        '/sign_up':(BuildContext) => SignUp(),
        '/login':(BuildContext)=>FirstRoute()
      }
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Below is the validation and firebase authentication code
  final formKey=new GlobalKey<FormState>();

  String _email;
  String _password;

  bool validateAndSave(){
    final form =formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
      
    }
    return false;
  }
  void validateAndSubmit() async{
    if (validateAndSave()) {
      try {
        // FirebaseUser user =await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _password);


        
      } catch (e) {
        print('Error: $e');
      }
    }

  }
  



// defines the bottom navigation bar;

final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt, color: Colors.white,),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: Icon(Icons.location_on, color: Colors.white),
              onPressed: () {

         

              },
            ),
            IconButton(
              icon: Icon(Icons.message, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(

              icon: Icon(Icons.account_circle, color: Colors.white),
              onPressed: () {
               
              },

            )
          ],
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return new 
    
      
    
    Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      bottomNavigationBar: makeBottom,
      resizeToAvoidBottomPadding: false,
      body: ListView(
        
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 70.0,
                    left: 15.0,
                    
                  ),
                  child: Text('Hello',
                      style: TextStyle(color: Colors.white,
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 130.0,
                    left: 15.0,
                  ),
                  child: Text('There',
                      style: TextStyle(color: Colors.white,
                          fontSize: 80.0, fontWeight: FontWeight.bold)),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 100.0,
                    left: 200.0,
                  ),
                  child: Text('.',
                      style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 15.0,right: 15.0),
            child:Form(
              key: formKey,

            child: Column(
              children: <Widget>[
                
                TextFormField(
                  validator: (value)=>value.isEmpty ? 'Email can\'t be empty':null,
                  onSaved: (value)=>_email=value,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.white
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value)=>value.isEmpty ? 'Password can\'t be empty':null,
                  onSaved: (value)=>_password=value,
                  maxLines: 1,
                  maxLength: 10,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, 
                        color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))
                  ),
               
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(left: 20.0, top: 15.0),
                  child: InkWell(
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.transparent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: RaisedButton(
                      onPressed:validateAndSubmit,
                      child: Center(
                        child: Text(
                          'LOGIN',
                        style:TextStyle(
                          color:Colors.white ,
                          fontWeight: FontWeight.bold)),
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20.0,),
                Container(
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(child:
                        
                         ImageIcon(AssetImage('assets/google.png'),color: Colors.white,),),
                         SizedBox(width: 20.0,),
                         Center(
                           child: Text('Login using Google',
                           style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
                         )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          ),
          SizedBox(height: 15.0,),
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('New to K-Dharura?',
              style:TextStyle(
                color: Colors.white,
                fontWeight:FontWeight.bold,)),
                SizedBox(width: 5.0,),
                
                InkWell(
                  onTap: (){
                   Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SignUp(),
                settings: RouteSettings(name: 'sign_up')),
          );
                  },
                  child: Text('Register',
                  style:TextStyle(
                    fontWeight:FontWeight.bold,
                    color:Colors.green,
                    decoration: TextDecoration.underline,
                  )),

                ),
            ],
          )
        ],
      ),
      
    );
    
  
}
}