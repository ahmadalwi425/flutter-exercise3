import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  double _kelvin = 0, _reamur = 0;
  final TextEditingController _angkaCelcius = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(angkaCelcius: _angkaCelcius),
              SizedBox(height: 230),
              Result(),
              SizedBox(height: 230),
              Convert(convert1Handler : _convert1),
            ],
          ),
        ),
      ),
    );
  }


  void _convert1() {
    _kelvin = double.parse(_angkaCelcius.text) - 273;
    _reamur = (4/5) * double.parse(_angkaCelcius.text);
  }
}

class Convert extends StatelessWidget {
  const Convert({
    Key? key,
    @required convert1Handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 40), // double.infinity is the width and 30 is the height
        primary: Colors.blue,
      ),
      onPressed: ( ) {  },
      child: Text('Konversi Suhu'),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text("Suhu dalam Kelvin",style: TextStyle(fontSize: 15)),
            Text("0",style: TextStyle(fontSize: 40)),
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            Text("Suhu dalam Reamor",style: TextStyle(fontSize: 15)),
            Text("0",style: TextStyle(fontSize: 40)),
          ],
        )
      ],
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required TextEditingController angkaCelcius,
  }) : _angkaCelcius = angkaCelcius, super(key: key);

  final TextEditingController _angkaCelcius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan suhu terlebih  dahulu';
        }
        return null;
      },
      controller: _angkaCelcius,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Masukkan Suhu Dalam Celcius",
      ),
    );
  }
}


