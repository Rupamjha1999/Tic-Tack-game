import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tic_tack/screen_sizes.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Tic-Tack',
      //title: Image.asset('assets/images/easydoubt.png', fit: BoxFit.cover),
      home: SplashScreen(),

    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a time-consuming task (e.g., loading data) for the splash screen.
    // Replace this with your actual data loading logic.


    //child: Text('Goto Next Page')),


    Future.delayed(
      Duration(seconds: 5),
          () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyHomePage()));
        // Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(


        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[

                Container(
                  width: displayWidth(context) * 0.25,
                  height: displayHeight(context) * 0.25,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                  ),
                  child: Image.asset('assets/images/tic-tac-toe.png',),
                ),

                //Image.asset('assets/images/book.png'),
                //  Image.asset('assets/images/microphone.png'),
                LoadingAnimationWidget.fallingDot(color: Colors.white, size: 100)
                // LoadingAnimationWidget.staggeredDotsWave(
                //   //color: Colors.white,
                //   size: 100, leftDotColor: Colors.blue, rightDotColor: Colors.red,
                // )
              ]
          ),




        )

    );
  }

}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _buttonText1 = "";
  String _buttonText2 = "";
  String _buttonText3 = "";
  String _buttonText4 = "";
  String _buttonText5 = "";
  String _buttonText6 = "";
  String _buttonText7 = "";
  String _buttonText8 = "";
  String _buttonText9 = "";
  String winner="";

  int counter=0;
  final _Player1 = TextEditingController();
  final _Player2 = TextEditingController();
  String Player1='X';
  String Player2='0';
  String Player='';
  String Choose='';


  void closeAppUsingExit() {
    SystemNavigator.pop();
  }


  Create_User(BuildContext context) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {

        //Navigator.of(context).pop();
        setState(() {
          Player1=_Player1.text.toString();
          print(Player1);
          Player2=_Player2.text.toString();
          Navigator.of(context).pop();
        });

      },
    );

    // Create AlertDialog
    AlertDialog alert1 = AlertDialog(
      backgroundColor: Colors.orange,
      title: Text("Enter Player Details",style: TextStyle(
        color: Colors.white,
      ),),

        content:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //posisi
          mainAxisSize: MainAxisSize.min,
          // untuk mengatur agar widget column mengikuti widget
          children: <Widget>[
            TextField(
              onChanged: (value) { },
              controller: _Player1,
              decoration: InputDecoration(hintText: " X for Player1"),
            ),
            TextField(
              onChanged: (value) { },
              controller: _Player2,
              decoration: InputDecoration(hintText: "0 for Player2"),
            ),
          ],
        ),


      actions: [

        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert1;
      },
    );
  }




  String calculate(String btn) {
    if (counter == 0) {
      btn = "X";
      counter++;
    }
    else {
      btn = "0";
      counter = 0;
    }
    return btn;
  }

  String checkWinner(){

    if(_buttonText1==_buttonText2  && _buttonText2==_buttonText3 && _buttonText3!="") {
      if(_buttonText1=="X"){
        winner="X";
      }else{
        winner="0";
      }

    }
    else if(_buttonText1==_buttonText4  && _buttonText4==_buttonText7 && _buttonText7!="") {
      if(_buttonText4=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }
    else if(_buttonText4==_buttonText5  && _buttonText5==_buttonText6 && _buttonText6!="") {
      if(_buttonText5=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }

    else if(_buttonText7==_buttonText8  && _buttonText8==_buttonText9 && _buttonText9!="") {
      if(_buttonText7=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }
    else if(_buttonText2==_buttonText4  && _buttonText4==_buttonText8 && _buttonText8!="") {
      if(_buttonText8=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }
    else if(_buttonText3==_buttonText6  && _buttonText6==_buttonText9 && _buttonText9!="") {
      if(_buttonText6=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }

    else if(_buttonText1==_buttonText5  && _buttonText5==_buttonText9 && _buttonText9!="") {
      if(_buttonText9=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }
    else if(_buttonText3==_buttonText5  && _buttonText5==_buttonText7 && _buttonText7!="") {
      if(_buttonText7=="X"){
        winner="X";
      }else{
        winner="0";
      }
    }
    else if(_buttonText3!="" && _buttonText4!=""  && _buttonText5!="" && _buttonText6!="" && _buttonText7!="" && _buttonText1!="" && _buttonText2!=""  && _buttonText8!="" && _buttonText9!=""){

      winner="Draw";

    }
 return winner;
  }


  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        //Navigator.of(context).pop();
        Close(context);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) =>  MyHomePage()
        //   ),
        // );
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.orange,
      title: Text("Game Over",style: TextStyle(
        color: Colors.white,
      ),),
      content: Text("$Player $winner is Winner",style: TextStyle(
        color: Colors.white,
      ),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



//match draw
  draw(BuildContext context) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        //Navigator.of(context).pop();
        Close(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MyHomePage()
          ),
        );
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.orange,
      title: Text("Game Over",style: TextStyle(
        color: Colors.white,
      ),),
      content: Text("Match is Draw",style: TextStyle(
        color: Colors.white,
      ),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  //to choose want to exit or play

  Close(BuildContext context) {
    // Create button
    Widget Yes = ElevatedButton(
      child: Text("Yes"),
      onPressed: () {
        //Navigator.of(context).pop();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  MyHomePage()
          ),
        );
      },
    );
    Widget No = ElevatedButton(
      child: Text("No"),
      onPressed: () {
       // Navigator.of(context).pop();
        setState(() {
          Choose = 'EXIT';

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()
            ),
          );

          // call this to exit app
          // SystemNavigator.pop();


          // FlutterExitApp.exitApp();

        });

      }

    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.orange,
      title: Text("Do You Want to Play?",style: TextStyle(
        color: Colors.white,
      ),),
      content: Text("$Player $winner is Winner",style: TextStyle(
        color: Colors.white,
      ),),
      actions: [
        Yes,
        No

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    //setState(() {});
    if(Player1=="X" && Player2=="0")
    {  Future.delayed(Duration.zero, () => Create_User(context));}
    else if(Choose=='EXIT'){
      closeAppUsingExit();
    }

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(
          children: <Widget>[

            Text(
              'Tic-Tack',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            Container(
              width: displayWidth(context) * 0.07,
              height: displayHeight(context) * 0.07,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: Image.asset('assets/images/tic-tac-toe.png',),
            ),

            //  Image.asset('assets/images/microphone.png',  width: displayWidth(context) * 0.07,
            //  height: displayHeight(context) * 0.07,)
          ],
        ),



      ),
      body: Center(

        child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(

              width: displayWidth(context) * 0.20,
              height: displayHeight(context) * 0.20,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                   Text("Player1 is $Player1" ,style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold, fontSize: 15


                    ),
                    ),

                    Text("Player2 is $Player2",style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold, fontSize: 15
                    ),
                    ),
                  Text(" $Player1 will start the Game",style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold, fontSize: 20
                  ),
                  ),
                ],

              ),
            ),

            Container(

              alignment: Alignment.bottomCenter,
        child: Row(

            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: crossAxisAlignment.center,
          children: [


         Container(

            width: 80,
            height: 80,
            decoration: const BoxDecoration(
            border: Border(
            right: BorderSide(color: Colors.white),
            )
            ),
          child: ElevatedButton(

            onPressed: () {
              setState(() {
                // erase the board
                if(_buttonText1==""){
                  String val =calculate("_buttonText1");
                  _buttonText1=val;
                  String winner="";
                  winner=checkWinner();

                  if(winner=="X"){
                    Player=Player1;
                    showAlertDialog(context);

                  }
                  else if(winner=="0"){
                    Player=Player2;
                    showAlertDialog(context);
                  }
                  else if(winner=="Draw"){
                    draw(context);
                  }
                }


              });

            },
            child: Text(_buttonText1,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
            style: ElevatedButton.styleFrom(

              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
              backgroundColor: Colors.orange,

            ),
          ),
        ),

               Container(
                 width: 80,
                 height: 80,
                 decoration: const BoxDecoration(
                     border: Border(
                       right: BorderSide(color: Colors.white),
                       left: BorderSide(color: Colors.white),
                     )
                 ),
                  child: ElevatedButton(
                    onPressed: () {

                      setState(() {
                        // erase the board
                        if(_buttonText2==""){
                          String val =calculate("_buttonText2");
                          _buttonText2=val;
                          String winner="";
                          winner=checkWinner();

                          if(winner=="X"){
                            Player=Player1;
                            showAlertDialog(context);

                          }
                          else if(winner=="0"){
                            Player=Player2;
                            showAlertDialog(context);
                          }
                          else if(winner=="Draw"){
                            draw(context);
                          }
                        }


                      });
                    },
                    child: Text( _buttonText2,
                      style: TextStyle(
                    color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                    style: ElevatedButton.styleFrom(
                      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                      backgroundColor: Colors.orange,

                    ),
                  ),
                ),
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                  border: Border(

                    left: BorderSide(color: Colors.white),
                  )
              ),
              child: ElevatedButton(
                onPressed: () {setState(() {
                  // erase the board
                  if(_buttonText3==""){
                    String val =calculate("_buttonText3");
                    _buttonText3=val;
                    String winner="";
                    winner=checkWinner();

                    if(winner=="X"){
                      Player=Player1;
                      showAlertDialog(context);

                    }
                    else if(winner=="0"){
                      Player=Player2;
                      showAlertDialog(context);
                    }
                    else if(winner=="Draw"){
                      draw(context);
                    }
                  }


                });
                },
                child: Text(_buttonText3,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),),
                style: ElevatedButton.styleFrom(
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                  backgroundColor: Colors.orange,


                ),
              ),
            ),

]
    ),
            ),


            Container(


              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                          )
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // erase the board
                            if(_buttonText4==""){
                              String val =calculate("_buttonText4");
                              _buttonText4=val;
                              String winner="";
                              winner=checkWinner();

                              if(winner=="X"){
                                Player=Player1;
                                showAlertDialog(context);

                              }
                              else if(winner=="0"){
                                Player=Player2;
                                showAlertDialog(context);
                              }
                              else if(winner=="Draw"){
                                draw(context);
                              }
                            }


                          });

                        },
                        child: Text(_buttonText4,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),

                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                          )
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // erase the board
                            if(_buttonText5==""){
                              String val =calculate("_buttonText5");
                              _buttonText5=val;
                              String winner="";
                              winner=checkWinner();

                              if(winner=="X"){
                                Player=Player1;
                                showAlertDialog(context);

                              }
                              else if(winner=="0"){
                                Player=Player2;
                                showAlertDialog(context);
                              }
                              else if(winner=="Draw"){
                                draw(context);
                              }
                            }


                          });

                        },
                        child: Text( _buttonText5,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                          )
                      ),
                      child: ElevatedButton(
                        onPressed: () {setState(() {
                          // erase the board
                          if(_buttonText6==""){
                            String val =calculate("_buttonText6");
                            _buttonText6=val;
                            String winner="";
                            winner=checkWinner();

                            if(winner=="X"){
                              Player=Player1;
                              showAlertDialog(context);

                            }
                            else if(winner=="0"){
                              Player=Player2;
                              showAlertDialog(context);
                            }
                            else if(winner=="Draw"){
                              draw(context);
                            }
                          }


                        });
                        },
                        child: Text(_buttonText6,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),

                  ]
              ),
            ),


            Container(


              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(color: Colors.white),
                            right: BorderSide(color: Colors.white),
                          )
                      ),
                      child: ElevatedButton(

                        onPressed: () {
                          setState(() {
                            // erase the board
                            if(_buttonText7==""){
                              String val =calculate("_buttonText7");
                              _buttonText7=val;
                              String winner="";
                              winner=checkWinner();

                              if(winner=="X"){
                                Player=Player1;
                                showAlertDialog(context);

                              }
                              else if(winner=="0"){
                                Player=Player2;
                              }
                              else if(winner=="Draw"){
                                draw(context);
                              }
                            }


                          });

                        },
                        child: Text(_buttonText7,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.orange,
                        ),


                      ),
                    ),

                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.white),
                            left: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                          )
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // erase the board
                            if(_buttonText8==""){
                              String val =calculate("_buttonText8");
                              _buttonText8=val;
                              String winner="";
                              winner=checkWinner();

                              if(winner=="X"){
                                Player=Player1;
                                showAlertDialog(context);

                              }
                              else if(winner=="0"){
                                Player=Player2;
                                showAlertDialog(context);
                              }
                              else if(winner=="Draw"){
                                draw(context);
                              }
                            }


                          });

                        },
                        child: Text( _buttonText8,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          border: Border(

                            left: BorderSide(color: Colors.white),
                            top: BorderSide(color: Colors.white),
                          )
                      ),
                      child: ElevatedButton(
                        onPressed: () {

                          setState(() {
                            // erase the board
                            if(_buttonText9==""){
                              String val =calculate("_buttonText9");
                              _buttonText9=val;
                              String winner="";
                              winner=checkWinner();

                              if(winner=="X"){
                                Player=Player1;
                                showAlertDialog(context);

                              }
                              else if(winner=="0"){
                                Player=Player2;
                                showAlertDialog(context);
                                }
                              else if(winner=="Draw"){
                                draw(context);
                              }
                            }


                          });

                          //calculate("_buttonText9");
                        },
                        child: Text(_buttonText9,style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),),
                        style: ElevatedButton.styleFrom(
                          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ),

                  ]
              ),
            ),
          ]
    )
    )
    );
  }


}
