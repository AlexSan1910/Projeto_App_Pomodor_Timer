import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:async';


class ScreenTimer extends StatefulWidget {
  const ScreenTimer({super.key});

  @override
  State<ScreenTimer> createState() => _ScreenTimerState();
}

class _ScreenTimerState extends State<ScreenTimer> {

  var colorFirst = Colors.red[600];
  var colorSecundary =  Colors.red[400];
  var colorButtonPomodoro = Colors.red[900];
  var colorButtonShortBreak = Colors.red[400];
  var colorButtonLongBreak = Colors.red[400];
  var colorButtonStart = Colors.white;
  var colorLetterButtonStart = Colors.red[900];
  String timer = "00:25:00";
  String _timerPomodoro =  "assets/animacoes/timer_woman.json";
  String _menu = "pl";

  bool pressButtonPomodoro = false;
  bool pressButtonShortBreak = false;
  bool pressButtonLongBreak = false;
  
  /* timeOut = Duration(seconds: 1);

  void _startTimePomodoro(){
    
    if(pressButtonPomodoro == true){
      while(){}
    }

  }*/

  void _alteracaoTema(){

    if(_menu == "pc"){
      setState(() {
        colorFirst = Colors.green[600];
        colorSecundary = Colors.green[400];
        colorButtonPomodoro = Colors.green[400];
        colorButtonShortBreak = Colors.green[900];
        colorButtonLongBreak = Colors.green[400];
        colorLetterButtonStart = Colors.green[900];
        timer = "00:05:00";
        _timerPomodoro = "assets/animacoes/timer_short_break.json";
      });
    }else if(_menu == "pl"){
      setState(() {
        colorFirst = Colors.purple[600];
        colorSecundary = Colors.purple[400];
        colorButtonPomodoro = Colors.purple[400];
        colorButtonShortBreak = Colors.purple[400];
        colorButtonLongBreak = Colors.purple[900];
        colorLetterButtonStart = Colors.purple[900];
        timer = "00:15:00";
        _timerPomodoro = "assets/animacoes/timer_long_break.json";
      });
    }else if(_menu == "p"){
      setState(() {
        colorFirst = Colors.red[600];
        colorSecundary = Colors.red[400];
        colorButtonPomodoro = Colors.red[900];
        colorButtonShortBreak = Colors.red[400];
        colorButtonLongBreak = Colors.red[400];
        colorLetterButtonStart = Colors.red[900];
        timer = "00:25:00";
        _timerPomodoro =  "assets/animacoes/timer_woman.json";
      });
    };
    void _limparMenu(){
    _menu = "";
  }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFirst,
      body: Stack( // basicamente tudo que eu colocar por ultimo dentro desse stack, é o que ficara em primeiro na tela, e tudo que eu colocar em primeiro é o que ficara por ultimo na tela, ou seja, ao fundo
        children: [ 
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(20, 100, 20, 80),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.red[200],
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff1542bf), Color(0xff51a8ff)],
                begin: FractionalOffset(0.5, 1)
                
              ),
              color: colorSecundary,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: colorButtonPomodoro),
                        onPressed: (){
                          setState(() {
                            _menu = "p";
                          });
                          _alteracaoTema();
                        }, 
                        child: Text(
                          "Pomodoro",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: colorButtonShortBreak),
                        onPressed: (){
                          setState(() {
                            _menu = "pc";
                          });
                           _alteracaoTema();
                        }, 
                        child: Text(
                          "Parada Curta",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: colorButtonLongBreak),
                        onPressed: (){ 
                          setState(() {
                            _menu = "pl";
                          });
                          _alteracaoTema();
                        }, 
                        child: Text(
                          "Parada Longa",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Lottie.asset(
                  _timerPomodoro,
                width: 450,
                height: 350
                ),
                Text(
                  timer,
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorButtonStart,
                    ),
                    onPressed: (){
                      
                    }, 
                    child: Text(
                      "Iniciar",
                      style: TextStyle(
                        fontSize: 25,
                        color: colorLetterButtonStart,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                )
              ],
            ),
           // Text()
          ),
        ]
      ),
    );
  }
}