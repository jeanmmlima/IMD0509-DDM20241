import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({Key? key}) : super(key: key);

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {

   int contador = 0;

  contar(){
    setState(() {
        contador++;
    });

    print(contador);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
                  onPressed: contar,
                  child: const Text("Contar", style: TextStyle(fontSize: 20)),
                ),
                Text(
                  "Contagem: $contador",
                  style: const TextStyle(fontSize: 20),
                )
      ],
    );
  }
}