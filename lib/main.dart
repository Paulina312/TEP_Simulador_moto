import'package:flutter/material.dart';
import'package:all_sensors/all_sensors.dart';

void main()=> runApp(MOTO());

class MOTO extends StatefulWidget{
  @override
  createState() => Estado();
}

class Estado extends State<MOTO>{
  List <double> moto = [0.0,0.0,0.0];
  double pi = 3.1416;
  String personaje = "";
  String character = "";

  @override
  void initState() {
    super.initState();
    accelerometerEvents.listen((event) {
      setState(() {
        moto = [event.x, event.y, event.z];
      });
    });
  }

  @override
  Widget build(BuildContext context) =>MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent
    ),
    home: Scaffold(
      appBar: AppBar(
        title: Text("Simulador de moto"),
      ),
      body:
      Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            elevation: 8.0,
            child: Stack(
              children: [
                Image.asset("imagenes/Road op1.gif"),
                Positioned(
                  bottom: (80 + (-7*moto[1])),
                  left: (155 - (12*moto[0])),
                  child: Transform.rotate(
                    angle:(moto[0]/40)*-pi,
                    child: Image.asset(character, width: (30 + (3*moto[1])),),),
                )
              ],
            ),
          ),
          Divider(),
          Text("Toy land!",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w700),),
          Divider(),
          Text("Selecciona un personaje:"),
          ListTile(
            leading: Image.asset("imagenes/Pshyguy.png"),
            title: Text("Shy guy"),
            trailing: Radio(
              groupValue: personaje,
              value: "imagenes/shy_guy.png",
              onChanged: (valor){
                personaje = valor;
                character = valor;
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Image.asset("imagenes/Mario.png"),
            title: Text("Mario"),
            trailing: Radio(
              groupValue: personaje,
              value: "imagenes/mario-moto.png",
              onChanged: (valor){
                personaje = valor;
                character = valor;
              },
            ),
          ),
        ],),
    ),

  );
}