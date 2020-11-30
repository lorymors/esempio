import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'CheckBox && Radio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum OpzioniEnum {opt1, opt2, opt3}

class _MyHomePageState extends State<MyHomePage> {

  bool cbState = false;
  bool SwitchState = false;
  double slideValue = 0.0;
  OpzioniEnum radioScelta = OpzioniEnum.opt1;

  void onRadioTap(newValue) {
    setState(() {
      radioScelta = newValue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("CheckBox Demo"),
                  Checkbox(
                      tristate: true,
                      activeColor: Colors.yellow,
                      checkColor: Colors.white,
                      value: cbState,
                      onChanged: (v) {
                       setState(() => cbState = v);
                      },
                  )
                ],
            ),
          ),
          //Center ammette un solo figlio , invece column e Row ne ammettono di più
          Center(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Radio Button demo"),
                Radio(value: OpzioniEnum.opt1, groupValue: radioScelta, onChanged: onRadioTap,
                  ),
                Radio(value: OpzioniEnum.opt2, groupValue: radioScelta, onChanged: onRadioTap,
                  ),
                Radio(value: OpzioniEnum.opt3, groupValue: radioScelta, onChanged: onRadioTap,
                  ),
                ],
            ),
          ),
          Text("Switch Demo"),
          Switch(
            //si può settare tutta la tipologia di 
            value: SwitchState,
            onChanged: (newValue) {setState(() => SwitchState = newValue);}
          ),
          Text("Slider Demo"),
          Slider(
            value: slideValue,
              min: 0,
              max: 100,
              divisions: 100,
              onChanged: (newValue) {
              setState(() {
                slideValue = newValue.roundToDouble();
              });
              },
          ),
          Text("il valore è $slideValue"),
        ],
      ),
    );
  }

  }



