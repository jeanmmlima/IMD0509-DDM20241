import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int contador = 0;

  contar(){
    setState(() {
        contador++;
    });

    print(contador);
  }

  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Meu App"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Olá mundo",
                  style: TextStyle(fontSize: 26),
                ),
                Text("Esse é meu primeiro App em Flutter",
                    style: TextStyle(fontSize: 20)),
                ElevatedButton(
                  onPressed: contar,
                  child: Text("Contar", style: TextStyle(fontSize: 20)),
                ),
                Text(
                  "Contagem: $contador",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
